unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Consultas1: TMenuItem;
    Clientes2: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UClientes, UConsulta, UDM;

procedure TFPrincipal.Clientes1Click(Sender: TObject);
begin
if FClientes = nil then
 begin
 DM.Estado := 'CAD';
 Application.CreateForm(TFClientes, FClientes);
 end;
end;

procedure TFPrincipal.Clientes2Click(Sender: TObject);
begin
if FConsulta = nil then
Application.CreateForm(TFConsulta, FConsulta);
end;

end.
