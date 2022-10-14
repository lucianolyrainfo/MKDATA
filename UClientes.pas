unit UClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.Grids,
  Vcl.DBGrids;


type
  TFClientes = class(TForm)
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    Label7: TLabel;
    DBGrid2: TDBGrid;
    DBNavigator3: TDBNavigator;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClientes: TFClientes;

implementation
uses UDM;
{$R *.dfm}

procedure TFClientes.DBRadioGroup1Click(Sender: TObject);
begin
if DBRadioGroup1.ItemIndex = 0 then
DM.FDClienteCPF_CNPJ.EditMask:= '999.999.999-99;0;'
else
DM.FDClienteCPF_CNPJ.EditMask:= '99.999.999/0000-99;0;';
end;

procedure TFClientes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
DM.FDCliente.Close;
DM.FDTelefones.Close;
DM.FDEndereco.Close;
FreeAndNil(FClientes);
end;


procedure TFClientes.FormCreate(Sender: TObject);
begin
if DM.Estado = 'CAD' then
  begin
  DM.FDCliente.Close;
  DM.FDCliente.SQL.Clear;
  DM.FDCliente.SQL.Add('select * from Clientes');
  DM.FDCliente.Open();
  end;
if DM.Estado = 'NOVO' then
  begin
  DM.FDCliente.Close;
  DM.FDCliente.SQL.Clear;
  DM.FDCliente.SQL.Add('select * from Clientes');
  DM.FDCliente.Open();
  DM.FDCliente.Append;
  end;
DM.FDTelefones.Open();
DM.FDEndereco.Open();
end;


end.
