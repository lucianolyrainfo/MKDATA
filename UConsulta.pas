unit UConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, FireDAC.Stan.Param, System.UITypes,
  Vcl.DBGrids, Vcl.Buttons;

type
  TFConsulta = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SpeedButton1: TSpeedButton;
    DSConsulta: TDataSource;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsulta: TFConsulta;

implementation
uses UDM, UClientes;
{$R *.dfm}

procedure TFConsulta.Button1Click(Sender: TObject);
begin
DM.Estado:= 'EDIT';
with DM.FDCliente do
  begin
  Close;
  SQL.Clear;
  SQL.Add('select * from Clientes where ID = :ID');
  ParamByName('ID').AsInteger:= DM.FDConsultas.FieldByName('ID').AsInteger;
  Open();
  if FClientes = nil then
  Application.CreateForm(TFClientes, FClientes);
  end;
end;

procedure TFConsulta.Button2Click(Sender: TObject);
begin
if MessageDlg('Deseja realmente excluir?',mtWarning,[mbyes,mbno],0) = mryes then
 begin
 with DM.FDQ1 do
   begin
   Close;
   SQL.Clear;
   SQL.Add('delete from Clientes Where ID = :ID');
   ParamByName('ID').AsInteger:= DM.FDConsultas.FieldByName('ID').AsInteger;
   ExecSQL;
   end;
 DM.FDConsultas.Close;
 end;
end;

procedure TFConsulta.Button3Click(Sender: TObject);
begin
DM.Estado:= 'NOVO';
if FClientes = nil then
Application.CreateForm(TFClientes, FClientes);
end;

procedure TFConsulta.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
DM.FDConsultas.Close;
FreeAndNil(FConsulta);
end;

procedure TFConsulta.FormCreate(Sender: TObject);
begin
DM.FDConsultas.SQL.Clear;
end;

procedure TFConsulta.SpeedButton1Click(Sender: TObject);
begin
with DM.FDConsultas do
 begin
 Close;
 SQL.Clear;
 SQL.Add('Select * from Clientes');
   if RadioButton1.Checked = true then
   SQL.Add('Where Nome like :NOME and Ativo = 1')
   else
   SQL.Add('Where Nome like :NOME and Ativo = 0');
 ParamByName('NOME').AsString:= '%'+Edit1.Text+'%';
 Open();
 end;
end;

end.
