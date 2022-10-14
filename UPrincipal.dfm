object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'MKDATA'
  ClientHeight = 477
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 24
    Top = 16
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes...'
        OnClick = Clientes1Click
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object Clientes2: TMenuItem
        Caption = 'Clientes...'
        OnClick = Clientes2Click
      end
    end
  end
end
