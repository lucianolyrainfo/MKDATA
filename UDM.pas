unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Xml.Win.msxmldom,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, REST.Types, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Client, REST.Response.Adapter;
type
  TEndereco = class (TObject)
  strict private
    FCep: string;
    FLogradouro: string;
    FBairro: string;
    FCidade: string;
    FUF: string;
    FIBGE: string;
  private
    procedure proLocalizaCep;
  public
    constructor Create(const Cep: string); overload;
    property Cep: string read FCep;
    property Logradouro: string read FLogradouro;
    property Bairro: string read FBairro;
    property Cidade: string read FCidade;
    property UF: string read FUF;
    property IBGE: string read FIBGE;
  end;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    FDCliente: TFDQuery;
    FDClienteNOME: TStringField;
    FDClienteTIPO: TStringField;
    FDClienteCPF_CNPJ: TStringField;
    FDClienteRG_IE: TStringField;
    FDClienteDATA_CADASTRO: TDateField;
    FDClienteATIVO: TIntegerField;
    FDClienteID: TIntegerField;
    FDEndereco: TFDQuery;
    FDEnderecoID_INTERNO: TIntegerField;
    FDEnderecoLOGRADOURO: TStringField;
    FDEnderecoNUMERO: TStringField;
    FDEnderecoCEP: TStringField;
    FDEnderecoBAIRRO: TStringField;
    FDEnderecoCIDADE: TStringField;
    FDEnderecoESTADO: TStringField;
    FDEnderecoPAIS: TStringField;
    FDEnderecoID_CLIENTE: TIntegerField;
    DSClientes: TDataSource;
    FDTelefones: TFDQuery;
    FDTelefonesID_INTERNO: TIntegerField;
    FDTelefonesNUMERO: TLargeintField;
    FDTelefonesID_CLIENTE: TIntegerField;
    FDConsultas: TFDQuery;
    DSTelefones: TDataSource;
    DSEnderecos: TDataSource;
    FDQ1: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDClienteAfterInsert(DataSet: TDataSet);
    procedure FDClienteAfterScroll(DataSet: TDataSet);
    procedure FDClienteCPF_CNPJValidate(Sender: TField);
    procedure FDEnderecoCEPValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    Estado:String;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
DM.FDConn.Open();
DM.FDTelefonesNUMERO.EditMask:= '(99)99999-9999;0';
end;

procedure TDM.FDClienteAfterInsert(DataSet: TDataSet);
begin
FDClienteDATA_CADASTRO.AsDateTime:= Date;
end;

procedure TDM.FDClienteAfterScroll(DataSet: TDataSet);
begin
if FDClienteTIPO.AsString = 'PF' then
FDClienteCPF_CNPJ.EditMask:= '999.999.999-99;0;'
else
FDClienteCPF_CNPJ.EditMask:= '99.999.999/0000-99;0;';
end;

procedure TDM.FDClienteCPF_CNPJValidate(Sender: TField);
begin
with FDConsultas do
  begin
  Close;
  SQL.Clear;
  SQL.Add('Select Nome from Clientes Where CPF_CNPJ = :CPFCNPJ');
  ParamByName('CPFCNPJ').AsString:= FDClienteCPF_CNPJ.AsString;
  Open();
  if RecordCount > 0 then
    begin
    raise Exception.Create('Já existe um CPF/CNPJ cadastrado em Nome de: '+UpperCase(FieldByName('Nome').AsString));
    end;
  end;
end;
procedure TDM.FDEnderecoCEPValidate(Sender: TField);
var
  _rEndereco: TEndereco;
begin
  if FDEnderecoCEP.AsString = EmptyStr then
    Exit;

  _rEndereco := TEndereco.Create(FDEnderecoCEP.AsString);
  try
    FDEnderecoLOGRADOURO.AsString := _rEndereco.Logradouro;
    FDEnderecoBAIRRO.AsString:= _rEndereco.Bairro;
    FDEnderecoCIDADE.AsString := _rEndereco.Cidade;
    FDEnderecoESTADO.AsString := _rEndereco.UF;

  finally
    _rEndereco.Free;
  end;
end;

constructor TEndereco.Create(const Cep: string);
begin
  FCep := Cep;
  proLocalizaCep;
end;

procedure TEndereco.proLocalizaCep;
resourcestring
  __rINFORME_NR_CEP = 'Informe o número do cep.';
  __rCEP_INVALIDO = 'O número do CEP deve ser composto por 8 bytes.';
  __rCEP_NAO_ENCONTRADO = 'Cep não encontrado.';
const
  _rCep = 'cep';
  _rLogradouro = 'logradouro';
  _rBairro = 'bairro';
  _rLocalidade = 'localidade';
  _rUF = 'uf';
  _rWS = 'https://viacep.com.br/ws/';
  _rXML = '/xml/';
  _rERRO = 'erro';
  _rTrue = 'true';
var
  _rDXML: IXMLDocument;
begin
  FCep := StringReplace(Cep, '-', '', [rfReplaceAll]).Trim;
  if Cep.IsEmpty then
    raise Exception.Create(__rINFORME_NR_CEP);

  if Cep.Length <> 8 then
    raise Exception.Create(__rCEP_INVALIDO);


  _rDXML := TXMLDocument.Create(nil);
  try
    _rDXML.FileName := _rWS + Cep + _rXML;
    _rDXML.Active := True;
    { Quando consultado um CEP de formato válido, porém inexistente, }
    { por exemplo: "99999999", o retorno conterá um valor de "erro"  }
    { igual a "true". Isso significa que o CEP consultado não foi    }
    { encontrado na base de dados. https://viacep.com.br/            }

    if _rDXML.DocumentElement.ChildValues[0] = _rTrue then
      raise Exception.Create(__rCEP_NAO_ENCONTRADO);

    FCep := _rDXML.DocumentElement.ChildNodes[_rCep].Text;
    FLogradouro := _rDXML.DocumentElement.ChildNodes[_rLogradouro].Text;
    FBairro := _rDXML.DocumentElement.ChildNodes[_rBairro].Text;
    FCidade := _rDXML.DocumentElement.ChildNodes[_rLocalidade].Text;
    FUF := _rDXML.DocumentElement.ChildNodes[_rUF].Text;
  finally
    _rDXML := nil;
  end;
end;
end.
