object FClientes: TFClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Clientes'
  ClientHeight = 523
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 72
    Width = 29
    Height = 13
    Caption = 'NOME'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 456
    Top = 72
    Width = 48
    Height = 13
    Caption = 'CPF/CNPJ'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 120
    Width = 36
    Height = 13
    Caption = 'RG/I.E.'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 11
    Height = 13
    Caption = 'ID'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 164
    Width = 85
    Height = 13
    Caption = 'DATA CADASTRO'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 176
    Top = 117
    Width = 55
    Height = 13
    Caption = 'CONTATOS'
    FocusControl = DBEdit5
  end
  object Label7: TLabel
    Left = 8
    Top = 254
    Width = 60
    Height = 13
    Caption = 'ENDERE'#199'OS'
    FocusControl = DBEdit5
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 466
    Width = 608
    Height = 49
    DataSource = DM.DSClientes
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost]
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 64
    Top = 91
    Width = 386
    Height = 21
    DataField = 'NOME'
    DataSource = DM.DSClientes
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 456
    Top = 91
    Width = 161
    Height = 21
    DataField = 'CPF_CNPJ'
    DataSource = DM.DSClientes
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 136
    Width = 153
    Height = 21
    DataField = 'RG_IE'
    DataSource = DM.DSClientes
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 91
    Width = 50
    Height = 21
    DataField = 'ID'
    DataSource = DM.DSClientes
    Enabled = False
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 182
    Width = 153
    Height = 21
    DataField = 'DATA_CADASTRO'
    DataSource = DM.DSClientes
    TabOrder = 5
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 8
    Top = 8
    Width = 609
    Height = 41
    Caption = 'Tipo'
    Columns = 2
    DataField = 'TIPO'
    DataSource = DM.DSClientes
    Items.Strings = (
      'Pessoa F'#237'sica'
      'Pessoa Jur'#237'dica')
    TabOrder = 6
    Values.Strings = (
      'PF'
      'PJ')
    OnClick = DBRadioGroup1Click
  end
  object DBRadioGroup2: TDBRadioGroup
    Left = 8
    Top = 209
    Width = 153
    Height = 39
    Caption = 'Ativo'
    Columns = 2
    DataField = 'ATIVO'
    DataSource = DM.DSClientes
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 7
    Values.Strings = (
      '1'
      '0')
  end
  object DBGrid1: TDBGrid
    Left = 176
    Top = 136
    Width = 394
    Height = 112
    DataSource = DM.DSTelefones
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'Telefones'
        Width = 347
        Visible = True
      end>
  end
  object DBNavigator2: TDBNavigator
    Left = 576
    Top = 135
    Width = 41
    Height = 114
    DataSource = DM.DSTelefones
    VisibleButtons = [nbInsert, nbDelete, nbPost]
    Kind = dbnVertical
    TabOrder = 9
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 273
    Width = 562
    Height = 187
    DataSource = DM.DSEnderecos
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGRADOURO'
        Title.Caption = 'Logradouro'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'N.'#186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Title.Caption = 'Bairro'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'UF'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Title.Caption = 'Pa'#237's'
        Width = 63
        Visible = True
      end>
  end
  object DBNavigator3: TDBNavigator
    Left = 576
    Top = 273
    Width = 41
    Height = 114
    DataSource = DM.DSEnderecos
    VisibleButtons = [nbInsert, nbDelete, nbPost]
    Kind = dbnVertical
    TabOrder = 11
  end
end
