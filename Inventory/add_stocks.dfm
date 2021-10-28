object add_stocks_frm: Tadd_stocks_frm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Add Stocks'
  ClientHeight = 410
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 338
    Width = 534
    Height = 72
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 0
    VisualStyle = vsGradient
    object RzLabel15: TRzLabel
      Left = 130
      Top = 13
      Width = 68
      Height = 13
      Caption = 'F5 - Refresh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel18: TRzLabel
      Left = 130
      Top = 32
      Width = 59
      Height = 13
      Caption = 'Esc - Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 338
    Align = alClient
    BevelOuter = bvNone
    Color = 16645114
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.2.1.1'
    BorderColor = 16765615
    Caption.Color = 16575452
    Caption.ColorTo = 16571329
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 16643051
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 13542013
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 7485192
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 16575452
    StatusBar.ColorTo = 16571329
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    Text = ''
    DesignSize = (
      534
      338)
    FullHeight = 200
    object RzLabel1: TRzLabel
      Left = 8
      Top = 7
      Width = 90
      Height = 19
      Caption = 'Add Stocks'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 402
      Top = 12
      Width = 51
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Batch ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_batch_id: TRzLabel
      Left = 459
      Top = 12
      Width = 63
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '000000000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel3: TRzLabel
      Left = 8
      Top = 266
      Width = 78
      Height = 13
      Caption = 'Expiration Date:'
      Transparent = True
    end
    object RzLabel4: TRzLabel
      Left = 8
      Top = 239
      Width = 44
      Height = 13
      Caption = 'Location:'
      Transparent = True
    end
    object RzLabel5: TRzLabel
      Left = 382
      Top = 54
      Width = 88
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Transaction Code:'
      Transparent = True
    end
    object RzLabel6: TRzLabel
      Left = 277
      Top = 238
      Width = 42
      Height = 13
      Caption = 'Supplier:'
      Transparent = True
    end
    object RzLabel7: TRzLabel
      Left = 277
      Top = 265
      Width = 35
      Height = 13
      Caption = 'Status:'
      Transparent = True
    end
    object RzLabel8: TRzLabel
      Left = 8
      Top = 54
      Width = 23
      Height = 13
      Caption = 'Unit:'
      Transparent = True
    end
    object RzLabel9: TRzLabel
      Left = 332
      Top = 200
      Width = 49
      Height = 13
      Caption = 'No of Pcs:'
      Transparent = True
    end
    object RzLabel10: TRzLabel
      Left = 376
      Top = 31
      Width = 77
      Height = 13
      Caption = 'Inventory No:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_inventory_id: TRzLabel
      Left = 459
      Top = 31
      Width = 63
      Height = 13
      Caption = '000000000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_transaction_value: TRzLabel
      Left = 261
      Top = 12
      Width = 102
      Height = 13
      Caption = 'lbl_transaction_value'
      Transparent = True
      Visible = False
    end
    object lbl_inventory_value: TRzLabel
      Left = 261
      Top = 31
      Width = 94
      Height = 13
      Caption = 'lbl_inventory_value'
      Transparent = True
      Visible = False
    end
    object lbl_brand: TRzLabel
      Left = 261
      Top = 50
      Width = 44
      Height = 13
      Caption = 'lbl_brand'
      Transparent = True
      Visible = False
    end
    object lbl_category: TRzLabel
      Left = 184
      Top = 12
      Width = 59
      Height = 13
      Caption = 'lbl_category'
      Visible = False
    end
    object lbl_generic: TRzLabel
      Left = 184
      Top = 31
      Width = 51
      Height = 13
      Caption = 'lbl_generic'
      Visible = False
    end
    object lbl_type_id: TRzLabel
      Left = 184
      Top = 50
      Width = 52
      Height = 13
      Caption = 'lbl_type_id'
      Visible = False
    end
    object RzLabel11: TRzLabel
      Left = 8
      Top = 200
      Width = 42
      Height = 13
      Caption = 'Pcs/Box:'
      Transparent = True
    end
    object RzLine1: TRzLine
      Left = -1
      Top = 215
      Width = 532
      Height = 20
      LineSlope = lsUp
      LineWidth = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_close: TRzBitBtn
      Left = 432
      Top = 303
      Width = 100
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      TabOrder = 9
      OnClick = btn_closeClick
    end
    object btn_ok: TRzBitBtn
      Left = 332
      Top = 303
      Width = 100
      Height = 35
      Default = True
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 8
      OnClick = btn_okClick
      Glyph.Data = {
        9E0D0000424D9E0D000000000000360000002800000022000000210000000100
        180000000000680D0000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFEDF4EF72A77C218C2A6BA173E3EDE5FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFEFDC2DBC844995809861A3B8C44B8D2BDFBFD
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFCC5DECD449F5F14A839129829
        0D89123B8C43BCD5C1F9FCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFCC7E0CF47A56617
        B14509961A05890910811411840D3D9245C0DAC7FBFDFCFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBE3
        D34EAD6E19B1470A9A1D008800008D02038C0613811013820F41994CC6DFCEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCEE6D754B3751CB0490B9F23018E0603900B03910B02920B078E0E1382
        1117841444A154C9E4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD0E9DA5ABC7F1EB34F0EA52C049411059512069716069716
        0697160599150A931714861318861849AB5FCDE8D9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD1EBDB5DC7891DBE590CAB3300981600991803
        9C1C039B1B029B1B039C1C059D1D059F1F0D9820168B19158A1A4DB368CCEAD9
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2EEDF5CCB8B21CF691ABC4C13A6
        3017A6331CAB3C1DAB3B1CAB3B1AAA3815A93510A6310AA52C06A62A0B9D2616
        8E1D17931F4DB971C9ECD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0F0DF5FCE8F32D97A
        33CD6A33B8553AB85843BF6546BF6646BF6646BF6743BE643DBD5F34BA592AB5
        501EB34612B13F11A534189322169B2853C17AC9EEDAFEFFFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFED7F4E566
        D59845DB8551D68550C67354C77656CB7B53CA7A53C87952C87853C87954C97A
        54CA7A54CA7B53C97949C67138C16524BD5718AF431C972A16A33257CA85CCF2
        DFFCFEFDFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF9FE
        FBDEF8EB7ADFAA57E0935DDB9251CC7D50CC7D4FCD7E4ECD7D4ECD7D4ECC7C4E
        CC7D4ECC7E4FCE7F4ECC7D4ECD7C50CE7E53CE8157CF8351CE803BCA7223B854
        1E9D3019AB3F5AD38ED0F5E3FCFEFDFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFBBF2D794EBBE5CDF9859DE9450D08450D1854FD1854FD1844ED1
        844ED1844ED1844FD2854CD2854BCF804FD3874FD2854ED1844FD18551D18653
        D28856D38A4DD48730BF641FA1391BB24A5EDC99D6F9E8FFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFF95EFC376ECB25AE29C51D48C50D68C4ED58C
        4DD58B4DD58A4CD5894CD58A4DD78F4BD78B43C87561CD874ECF834FD98E4DD7
        8D4ED58B50D68C52D68D55D78F57D89154D99336C46D21AA4423BB5963E4A4DC
        FBEDFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFB5D8BB83C99758E7A254
        E09B4ED9914BDA914BD98F49D98E47D88D49DD9447DB8E46CA77B9E8C8DFF5E7
        7AD6994CD0824CDC924CDE954DDA9151DB9253DB9455DC975ADE9B56DF9B37C7
        7221B24F26C16565EBACDDFDEEFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFF3F7
        F2C6DCC658B77453EBA54CE39D46DC9344DB9141DB9043E29940DD8F48CC7BB0
        E4BFFDFEFEFFFFFFDDF5E579D39747CD7B48DF934BE59E4EDE9752DE9953DF9B
        57E09D5EE4A453E19E32CA741FB85728CA706BF0B2D7FDEB0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF9FBF9B4D1B355BB7647E8A042E69D3DE0963CE69C39DE
        8E48CB7CABE1BBFFFFFFFFFFFFFFFFFFFFFFFFD8F2E075CD8F3FC37145DD934C
        EAA74FE39F53E3A056E3A35AE4A361E9AD4BE49F2ACE7821C06627D58064F0B0
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2D0B14EC07739E497
        38EBA035E08F45C876A7DDB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5EF
        DC6CC07E36B86142DE944FEFAC53E8A656E8A85AE8A861E9AC5DEBAF40E69F23
        D37E26CA7541E79B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFB4D3B350CB813ADE8D44C574A6DAB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD4ECD95DAF672EAB5246E29853F0AF56ECAC5BEBAC5EEC
        AE66ECB153EDAB2DE19347DD94A8F9D30000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBADEBF79C98DB4DFBDFCFEFDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4EAD74EA0522CA5494AE59E
        56F1AF5BEEAF5EEDAE67EFB45DE9AB55E8A2A9F8D3FFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4
        E9D6449644299F444FE7A05CF3B45FF0B265ECB071EBB2B3F9D7FFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFCFEFDD1E6D23F903C29A04355E8A366F9BE71EFB5BBF9DBF9
        FFFCFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDD0E5D04FA25439B05971D5
        98C7F7DFF6FFFBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF5EE
        6BB06F4AAE5F84D5A0DFFAECFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
    end
    object edt_quantity_box: TRzNumericEdit
      Left = 8
      Top = 78
      Width = 515
      Height = 108
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -83
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = edt_quantity_boxChange
      DisplayFormat = '0;(0)'
    end
    object btn_query: TRzBitBtn
      Left = 0
      Top = 303
      Width = 35
      Height = 35
      Anchors = [akLeft, akBottom]
      TabOrder = 10
      OnClick = btn_queryClick
      Glyph.Data = {
        12060000424D1206000000000000360000002800000014000000190000000100
        180000000000DC050000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF2F2F3E5E6E6DAD9DADAD6D9E4E2E4F2F0
        F1FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFCFCEAE9E8BEB0AC9B756696654B925E4297614A9C6C5AA07D6FC0B3AD
        E7E6E7FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F8F7CABA
        B5875947874321A75021C06226CA7026D2762AD0732FC66E2DAF67339F7255C9
        BDB8F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F6F4B29D90773B209C4A19
        C16A28D47831DA8132E08831E88C34F09038FC943AFA913AE18337A56B3DB7A4
        99F7F5F4FFFFFFFFFFFFFFFFFFFEFDFDBEADA37B3918AA551FBE6B2ACA702CD9
        7731DC7C32DF8033E38635EC8E36FB9437FD983AFF9C39F3943EB36E3BC3B0A4
        FDFCFCFFFFFFFFFFFFE7DEDC7D452A9E4F21B76528BB6A29CB7130C4652CB05B
        28AC612DAE6632BE7131E78733FE9B3CFD9B34FF9C39F69443AF7247E5DCDEFF
        FFFFFCFAFAAA887C8F441AAF5F28B76327BF6B2CA2531D905B3BB49B8BC4B1A7
        C7B4AEBFA399A97254D47D38FF9D3EFE9A37FF9D3FE28A44BC9E91FBFAF9EFE7
        E3824729A45623B05E25B864299E511EA37B65E7DFDBFDFDFDFFFFFFFFFFFFFE
        FEFEEBE4E3B28D75D78039FF9C3AFF9A3AFE9D44BA7E4DEFE8E6CFBCB1954D27
        AC5D2BAB5A25A95A2989583BEDE7E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFECE7E4AF764DF8933BFF9739FF9D3DD68C44D8C5BDA88979A66136B06231A7
        5B249A5226BBA097FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
        C9AF9EEA883DFF9D3CFF9E3BF29F4CC3A58CAA8978A86539BA6D3DAF652C9751
        26DBC9C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCDC2C9
        793EE89345E99749E99353C4977BAB8A79AE6B3FBD7444BA73399E5A2DDCCEC7
        FFFFFFFFFFFFFFFFFFFFFFFFF8F8F7FDFDFCFFFFFFFFFFFFDFD9D7B9A292BDA4
        92BFA794C3A294CBB7B4AB8B7BB57448BF7948C07B42A76537BCA399FEFDFDFF
        FFFFFFFFFFFFFFFFC8BEB9D6C6BDFFFEFEFFFFFFFFFFFFFEFEFDFEFEFDFEFEFE
        FEFEFEFFFEFED5C2B8AA6C45C28550C2814AB9794894634AE6DDDCFFFFFFFFFF
        FFFFFFFFC6B1A9945D42DACDC8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF3ECE8A06F50C78955C9874ECC8B52B576489C7561DBD3D2F7F6F9FAFAFA
        CEBCB4BC764CA6714FD4C8C6FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
        FCBCA094BA7E55D0915BCE9055D59259BA7B50986E56AA9286C3B9ADA68A77D0
        8954DE9052A67355DBCFC9FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE4E1
        A5775FCC9265CF9760CE955CD89861D08F5AB98350B37E52B6805ADA985FE9A2
        5EDE985CB07B5FDBD1CFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2C2BAB3
        8261D3A269D3A168D39B64D89D62DA9F61DD9E64DE9F67DFA061E1A15DECA760
        EAA069B8866AE3DCD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBD1C5BAB189
        68D5A174E0AD77D9A76CD5A564D7A462DBA161DEA363E1A466DBA361EEB36BD8
        A070C8AFAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD3CFBD9A8B
        C1916FD9A37BE5AD7AE5B27CE6B47CDFAC72DDA76CECAE74E2AA74C0A68BF4EF
        EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F2F1DBD1CCC7
        B1A5C5A08BBA8E74BF906FE1B281E7B879DDAF79C3A694F4F1EFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
        FBF4F1EFB7A396E2B98FE1B882BDA58AF3EFEDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        D8C8B9DCAC85BEA490F1EDEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBBBAEB4
        937FF2EEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDCD7D5EEE8E5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object dtp_expiration_date: TRzDateTimePicker
      Left = 92
      Top = 262
      Width = 162
      Height = 21
      Date = 41018.654071574080000000
      Format = ''
      Time = 41018.654071574080000000
      TabOrder = 3
    end
    object cmb_branch_id: TRzComboBox
      Left = 92
      Top = 235
      Width = 162
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
    object cmb_supplier_id: TRzComboBox
      Left = 325
      Top = 235
      Width = 164
      Height = 21
      Style = csDropDownList
      TabOrder = 4
    end
    object cmb_status_id: TRzComboBox
      Left = 325
      Top = 262
      Width = 164
      Height = 21
      Style = csDropDownList
      TabOrder = 5
    end
    object RzBitBtn1: TRzBitBtn
      Left = 495
      Top = 235
      Width = 30
      Height = 21
      Caption = '...'
      TabOrder = 6
      OnClick = RzBitBtn1Click
    end
    object btn_status_att: TRzBitBtn
      Left = 495
      Top = 262
      Width = 30
      Height = 21
      Caption = '...'
      TabOrder = 7
      OnClick = btn_status_attClick
    end
    object cmb_trans_code: TRzComboBox
      Left = 476
      Top = 51
      Width = 47
      Height = 21
      Style = csDropDownList
      TabOrder = 14
    end
    object cmb_unit_id: TRzComboBox
      Left = 37
      Top = 51
      Width = 98
      Height = 21
      Style = csDropDownList
      TabOrder = 13
      OnClick = cmb_unit_idClick
    end
    object edt_quantity: TRzEdit
      Left = 387
      Top = 192
      Width = 135
      Height = 27
      Text = ''
      Alignment = taRightJustify
      Color = clInfoBk
      DisabledColor = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object edt_pieces: TRzEdit
      Left = 92
      Top = 192
      Width = 162
      Height = 27
      Text = '1'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edt_piecesChange
    end
    object btn_calculate: TRzBitBtn
      Left = 35
      Top = 303
      Width = 35
      Height = 35
      TabOrder = 11
      Visible = False
      OnClick = btn_calculateClick
    end
  end
  object AdvPanelStyler1: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = 16765615
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = 16575452
    Settings.Caption.ColorTo = 16571329
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clBlack
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'Tahoma'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Collaps = False
    Settings.CollapsColor = clNone
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 16645114
    Settings.ColorTo = 16643051
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = 7485192
    Settings.Font.Height = -11
    Settings.Font.Name = 'Tahoma'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clNone
    Settings.HoverFontColor = clNone
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = 13542013
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = 7485192
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 16575452
    Settings.StatusBar.ColorTo = 16571329
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psWindows7
    Left = 376
    Top = 344
  end
  object ActionList1: TActionList
    Left = 456
    Top = 344
    object esc: TAction
      Caption = 'esc'
      ShortCut = 27
      OnExecute = escExecute
    end
    object refresh: TAction
      Caption = 'refresh'
      ShortCut = 116
      OnExecute = refreshExecute
    end
  end
end
