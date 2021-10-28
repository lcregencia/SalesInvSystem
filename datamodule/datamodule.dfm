object dm: Tdm
  OldCreateOrder = False
  Height = 415
  Width = 437
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 88
    Top = 120
  end
  object IdIPWatch1: TIdIPWatch
    Active = False
    HistoryFilename = 'iphist.dat'
    Left = 200
    Top = 64
  end
  object RvProject1: TRvProject
    LoadDesigner = True
    Left = 32
    Top = 72
  end
  object MyConnection1: TMyConnection
    Database = 'doh'
    Username = 'root'
    Password = 'spikes123'
    Server = 'localhost'
    Left = 48
    Top = 288
  end
  object qsearch1: TMyQuery
    Connection = MyConnection1
    Left = 272
    Top = 296
  end
  object qselect1: TMyQuery
    Connection = MyConnection1
    Left = 216
    Top = 296
  end
  object qexec1: TMyQuery
    Connection = MyConnection1
    Left = 152
    Top = 296
  end
  object qcourt1: TMyQuery
    Connection = MyConnection1
    Left = 336
    Top = 304
  end
end
