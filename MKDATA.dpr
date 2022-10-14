program MKDATA;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDM in 'UDM.pas' {DM: TDataModule},
  UClientes in 'UClientes.pas' {FClientes},
  UConsulta in 'UConsulta.pas' {FConsulta};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDM, DM);

  Application.Run;
end.
