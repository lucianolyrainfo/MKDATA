object FConsulta: TFConsulta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Consultar'
  ClientHeight = 432
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Caption = 'Buscar por Nome'
  end
  object Label2: TLabel
    Left = 527
    Top = 8
    Width = 25
    Height = 13
    Caption = 'Ativo'
  end
  object SpeedButton1: TSpeedButton
    Left = 648
    Top = 16
    Width = 71
    Height = 32
    Caption = 'Consultar'
    OnClick = SpeedButton1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 513
    Height = 21
    TabOrder = 0
  end
  object RadioButton1: TRadioButton
    Left = 527
    Top = 27
    Width = 34
    Height = 17
    Caption = 'Sim'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 583
    Top = 27
    Width = 42
    Height = 17
    Caption = 'N'#227'o'
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 54
    Width = 711
    Height = 323
    DataSource = DSConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 502
    Top = 383
    Width = 106
    Height = 41
    Caption = 'Editar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 614
    Top = 383
    Width = 106
    Height = 41
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 383
    Width = 106
    Height = 41
    Caption = 'Adicionar'
    TabOrder = 6
    OnClick = Button3Click
  end
  object DSConsulta: TDataSource
    DataSet = DM.FDConsultas
    Left = 368
    Top = 152
  end
end
