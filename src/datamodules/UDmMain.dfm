object DmMain: TDmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 319
  Width = 494
  object FDConn: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 128
    Top = 112
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 272
    Top = 120
  end
  object FdQry: TFDQuery
    Connection = FDConn
    Left = 112
    Top = 224
  end
end
