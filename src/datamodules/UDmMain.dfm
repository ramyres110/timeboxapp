object DmMain: TDmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 319
  Width = 494
  object FDConn: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=E:\_DEV\_delphi\Timebox\bin\database.sdb')
    Connected = True
    Left = 56
    Top = 112
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    VendorLib = 'E:\_DEV\_delphi\Timebox\bin\sqlite3.dll'
    Left = 64
    Top = 48
  end
  object FdQry: TFDQuery
    Active = True
    DetailFields = 'createdAt;id;name;timebox;updatedAt'
    Connection = FDConn
    SQL.Strings = (
      'Select * from actors')
    Left = 368
    Top = 160
  end
  object DSActors: TDataSource
    DataSet = CDSActors
    Left = 368
    Top = 48
  end
  object CDSActors: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPActors'
    Left = 328
    Top = 104
  end
  object DSPActors: TDataSetProvider
    DataSet = FdQry
    Left = 416
    Top = 104
  end
end
