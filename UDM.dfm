object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 346
  Width = 496
  object FDConn: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object FDCliente: TFDQuery
    AfterInsert = FDClienteAfterInsert
    AfterScroll = FDClienteAfterScroll
    Connection = FDConn
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CLIENTES_ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'select * from Clientes'
      'Where ID = :ID')
    Left = 96
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 70
    end
    object FDClienteTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 2
    end
    object FDClienteCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      OnValidate = FDClienteCPF_CNPJValidate
      Size = 25
    end
    object FDClienteRG_IE: TStringField
      FieldName = 'RG_IE'
      Origin = 'RG_IE'
      Size = 25
    end
    object FDClienteDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object FDClienteATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
    end
    object FDClienteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object FDEndereco: TFDQuery
    IndexFieldNames = 'ID_CLIENTE'
    MasterSource = DSClientes
    MasterFields = 'ID'
    DetailFields = 'ID_CLIENTE'
    Connection = FDConn
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_ENDERECO_ID'
    UpdateOptions.AutoIncFields = 'ID_INTERNO'
    SQL.Strings = (
      'select * from Endereco')
    Left = 96
    Top = 72
    object FDEnderecoID_INTERNO: TIntegerField
      FieldName = 'ID_INTERNO'
      Origin = 'ID_INTERNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDEnderecoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 200
    end
    object FDEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 5
    end
    object FDEnderecoCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      OnValidate = FDEnderecoCEPValidate
      Size = 15
    end
    object FDEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 100
    end
    object FDEnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 50
    end
    object FDEnderecoESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object FDEnderecoPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Size = 30
    end
    object FDEnderecoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
  end
  object DSClientes: TDataSource
    DataSet = FDCliente
    Left = 168
    Top = 16
  end
  object FDTelefones: TFDQuery
    IndexFieldNames = 'ID_CLIENTE'
    MasterSource = DSClientes
    MasterFields = 'ID'
    DetailFields = 'ID_CLIENTE'
    Connection = FDConn
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_TELEFONE_ID'
    UpdateOptions.AutoIncFields = 'ID_INTERNO'
    SQL.Strings = (
      'select * from Telefone')
    Left = 96
    Top = 128
    object FDTelefonesID_INTERNO: TIntegerField
      FieldName = 'ID_INTERNO'
      Origin = 'ID_INTERNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTelefonesNUMERO: TLargeintField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      DisplayFormat = '(00)00000-0000'
      EditFormat = '0'
    end
    object FDTelefonesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
  end
  object FDConsultas: TFDQuery
    Connection = FDConn
    Left = 24
    Top = 208
  end
  object DSTelefones: TDataSource
    DataSet = FDTelefones
    Left = 168
    Top = 128
  end
  object DSEnderecos: TDataSource
    DataSet = FDEndereco
    Left = 168
    Top = 72
  end
  object FDQ1: TFDQuery
    Connection = FDConn
    Left = 24
    Top = 264
  end
end
