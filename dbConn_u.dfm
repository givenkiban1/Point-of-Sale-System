object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 451
  object dbProvider: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Left = 32
    Top = 48
  end
  object loginQuery: TADOQuery
    Connection = dbProvider
    Parameters = <>
    Left = 184
    Top = 48
  end
  object ADOTable1: TADOTable
    Connection = dbProvider
    Left = 336
    Top = 48
  end
  object qryLogin: TADOQuery
    Connection = dbProvider
    Parameters = <>
    Left = 128
    Top = 152
  end
  object ADOQuery2: TADOQuery
    Connection = dbProvider
    Parameters = <>
    Left = 240
    Top = 144
  end
  object ADOQuery3: TADOQuery
    Connection = dbProvider
    Parameters = <>
    Left = 328
    Top = 152
  end
  object qryMaintenance: TADOTable
    Connection = dbProvider
    Left = 248
    Top = 224
  end
  object updateTbl: TADOTable
    Connection = dbProvider
    Left = 344
    Top = 240
  end
end
