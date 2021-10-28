object purchase_order_additem: Tpurchase_order_additem
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Purchase'
  ClientHeight = 487
  ClientWidth = 544
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
    Top = 415
    Width = 544
    Height = 72
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 0
    VisualStyle = vsGradient
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 415
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
      544
      415)
    FullHeight = 200
    object RzLabel1: TRzLabel
      Left = 8
      Top = 8
      Width = 182
      Height = 19
      Caption = 'Quantity And Discount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel2: TRzLabel
      Left = 356
      Top = 8
      Width = 108
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Reference Number:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExplicitLeft = 256
    end
    object lbl_po_id: TRzLabel
      Left = 470
      Top = 8
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
      Transparent = True
      ExplicitLeft = 370
    end
    object RzLabel4: TRzLabel
      Left = 356
      Top = 27
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Barcode:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_barcode: TRzLabel
      Left = 470
      Top = 27
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
      Transparent = True
      ExplicitLeft = 370
    end
    object RzLabel3: TRzLabel
      Left = 234
      Top = 259
      Width = 59
      Height = 13
      Caption = 'Item Cost:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel5: TRzLabel
      Left = 234
      Top = 340
      Width = 56
      Height = 13
      Caption = 'Sub Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel6: TRzLabel
      Left = 389
      Top = 259
      Width = 8
      Height = 14
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel9: TRzLabel
      Left = 234
      Top = 313
      Width = 52
      Height = 13
      Caption = 'Discount:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel12: TRzLabel
      Left = 349
      Top = 313
      Width = 13
      Height = 13
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel16: TRzLabel
      Left = 391
      Top = 313
      Width = 5
      Height = 14
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel7: TRzLabel
      Left = 8
      Top = 33
      Width = 78
      Height = 16
      Caption = 'Description:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_description: TRzLabel
      Left = 92
      Top = 33
      Width = 69
      Height = 16
      Caption = 'Item Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel8: TRzLabel
      Left = 8
      Top = 55
      Width = 36
      Height = 16
      Caption = 'Type:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel10: TRzLabel
      Left = 356
      Top = 73
      Width = 26
      Height = 13
      Caption = 'Unit:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel11: TRzLabel
      Left = 8
      Top = 218
      Width = 42
      Height = 13
      Caption = 'Pcs/Box:'
      Transparent = True
    end
    object RzLine1: TRzLine
      Left = 8
      Top = 239
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
    object RzLabel13: TRzLabel
      Left = 343
      Top = 220
      Width = 49
      Height = 13
      Caption = 'No of Pcs:'
      Transparent = True
    end
    object lbl_type: TRzLabel
      Left = 92
      Top = 55
      Width = 31
      Height = 16
      Caption = 'Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel14: TRzLabel
      Left = 234
      Top = 286
      Width = 50
      Height = 13
      Caption = 'Net Cost:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel15: TRzLabel
      Left = 388
      Top = 286
      Width = 10
      Height = 14
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel17: TRzLabel
      Left = 388
      Top = 340
      Width = 10
      Height = 14
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object nedt_quantity_box: TRzNumericEdit
      Left = 8
      Top = 97
      Width = 525
      Height = 108
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -83
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = nedt_quantity_boxChange
      DisplayFormat = '0;(0)'
    end
    object btn_query: TRzBitBtn
      Left = -1
      Top = 380
      Width = 35
      Height = 35
      Anchors = [akLeft, akBottom]
      TabOrder = 9
      TabStop = False
      OnClick = btn_queryClick
    end
    object btn_ok: TRzBitBtn
      Left = 344
      Top = 380
      Width = 100
      Height = 35
      Default = True
      Anchors = [akRight, akBottom]
      Caption = 'Ok'
      TabOrder = 4
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
    object btn_close: TRzBitBtn
      Left = 444
      Top = 380
      Width = 100
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      TabOrder = 5
      OnClick = btn_closeClick
    end
    object nedt_cost: TRzNumericEdit
      Left = 402
      Top = 256
      Width = 131
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 7
      DisplayFormat = '0;(0)'
    end
    object nedt_total_discount: TRzNumericEdit
      Left = 402
      Top = 310
      Width = 131
      Height = 21
      TabOrder = 3
      OnChange = nedt_total_discountChange
      DisplayFormat = '0;(0)'
    end
    object nedt_total: TRzNumericEdit
      Left = 402
      Top = 337
      Width = 131
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      DisplayFormat = '0;(0)'
    end
    object nedt_discount: TRzNumericEdit
      Left = 299
      Top = 310
      Width = 44
      Height = 21
      TabOrder = 2
      OnChange = nedt_discountChange
      DisplayFormat = '0;(0)'
    end
    object cmb_unit_id: TRzComboBox
      Left = 388
      Top = 70
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 11
      OnClick = cmb_unit_idClick
    end
    object edt_pieces: TRzEdit
      Left = 56
      Top = 211
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
    object edt_quantity: TRzEdit
      Left = 398
      Top = 211
      Width = 135
      Height = 27
      TabStop = False
      Text = '0'
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
      TabOrder = 8
    end
    object btn_calculate: TRzBitBtn
      Left = 35
      Top = 380
      Width = 35
      Height = 35
      Anchors = [akLeft, akBottom]
      TabOrder = 12
      TabStop = False
      Visible = False
      OnClick = btn_calculateClick
    end
    object nedt_netcost: TRzNumericEdit
      Left = 402
      Top = 283
      Width = 131
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 6
      DisplayFormat = '0;(0)'
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
    Left = 248
    Top = 464
  end
  object ActionList1: TActionList
    Left = 360
    Top = 464
    object esc: TAction
      Caption = 'esc'
      ShortCut = 27
      OnExecute = escExecute
    end
  end
end
