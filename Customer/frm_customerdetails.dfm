object frm_customer_details: Tfrm_customer_details
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Customer Details'
  ClientHeight = 376
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 304
    Width = 595
    Height = 72
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 0
    VisualStyle = vsGradient
    object RzLabel14: TRzLabel
      Left = 130
      Top = 11
      Width = 47
      Height = 13
      Caption = 'F1 - New'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel16: TRzLabel
      Left = 130
      Top = 30
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
    object RzLabel17: TRzLabel
      Left = 244
      Top = 30
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
    object RzLabel18: TRzLabel
      Left = 244
      Top = 11
      Width = 74
      Height = 13
      Caption = 'Ctrl+P - Print'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel19: TRzLabel
      Left = 130
      Top = 49
      Width = 95
      Height = 13
      Caption = 'Ctrl+Del - Delete'
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
    Width = 595
    Height = 304
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
      595
      304)
    FullHeight = 200
    object RzLabel1: TRzLabel
      Left = 15
      Top = 8
      Width = 140
      Height = 19
      Caption = 'Customer Details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 52
      Width = 64
      Height = 13
      Caption = 'Customer ID:'
      Transparent = True
    end
    object RzLabel3: TRzLabel
      Left = 16
      Top = 80
      Width = 50
      Height = 13
      Caption = 'Lastname:'
      Transparent = True
    end
    object RzLabel4: TRzLabel
      Left = 271
      Top = 80
      Width = 51
      Height = 13
      Caption = 'Firstname:'
      Transparent = True
    end
    object RzLabel5: TRzLabel
      Left = 495
      Top = 80
      Width = 24
      Height = 13
      Caption = 'M.I.:'
      Transparent = True
    end
    object RzLabel6: TRzLabel
      Left = 16
      Top = 110
      Width = 43
      Height = 13
      Caption = 'Address:'
      Transparent = True
    end
    object RzLabel7: TRzLabel
      Left = 319
      Top = 146
      Width = 39
      Height = 13
      Caption = 'Gender:'
      Transparent = True
    end
    object RzLabel8: TRzLabel
      Left = 319
      Top = 170
      Width = 74
      Height = 13
      Caption = 'Telephone No.:'
      Transparent = True
    end
    object RzLabel9: TRzLabel
      Left = 16
      Top = 198
      Width = 71
      Height = 13
      Caption = 'Cellphone No.:'
      Transparent = True
    end
    object RzLabel10: TRzLabel
      Left = 16
      Top = 141
      Width = 48
      Height = 13
      Caption = 'Birthdate:'
      Transparent = True
    end
    object RzLabel11: TRzLabel
      Left = 16
      Top = 170
      Width = 75
      Height = 13
      Caption = 'Business Name:'
      Transparent = True
    end
    object RzLabel12: TRzLabel
      Left = 319
      Top = 198
      Width = 62
      Height = 13
      Caption = 'Fax Number:'
      Transparent = True
    end
    object RzLabel13: TRzLabel
      Left = 15
      Top = 224
      Width = 32
      Height = 13
      Caption = 'E-mail:'
      Transparent = True
    end
    object edt_id: TRzEdit
      Left = 97
      Top = 48
      Width = 168
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object edt_lname: TRzEdit
      Left = 97
      Top = 77
      Width = 168
      Height = 21
      Text = ''
      TabOrder = 1
    end
    object edt_fname: TRzEdit
      Left = 328
      Top = 77
      Width = 161
      Height = 21
      Text = ''
      TabOrder = 2
    end
    object edt_address: TRzEdit
      Left = 97
      Top = 107
      Width = 480
      Height = 21
      Text = ''
      TabOrder = 4
    end
    object edt_business_name: TRzEdit
      Left = 97
      Top = 165
      Width = 216
      Height = 21
      Text = ''
      TabOrder = 7
    end
    object edt_tel_number: TRzEdit
      Left = 400
      Top = 165
      Width = 177
      Height = 21
      Text = ''
      TabOrder = 8
    end
    object edt_cel_number: TRzEdit
      Left = 97
      Top = 194
      Width = 216
      Height = 21
      Text = ''
      TabOrder = 9
    end
    object edt_fax_number: TRzEdit
      Left = 400
      Top = 192
      Width = 177
      Height = 21
      Text = ''
      TabOrder = 10
    end
    object dtp_birthdate: TRzDateTimePicker
      Left = 97
      Top = 138
      Width = 216
      Height = 21
      Date = 41033.851214097220000000
      Format = ''
      Time = 41033.851214097220000000
      TabOrder = 5
    end
    object cmb_gender: TRzComboBox
      Left = 400
      Top = 138
      Width = 177
      Height = 21
      Style = csDropDownList
      TabOrder = 6
      Items.Strings = (
        '-Select Gender-'
        'F'
        'M')
    end
    object cmb_mi: TRzComboBox
      Left = 525
      Top = 77
      Width = 52
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      Items.Strings = (
        ''
        'A'
        'B'
        'C'
        'D'
        'E'
        'F'
        'G'
        'H'
        'I'
        'J'
        'K'
        'L'
        'M'
        'N'
        'O'
        'P'
        'Q'
        'R'
        'S'
        'T'
        'U'
        'V'
        'W'
        'X'
        'Y'
        'Z')
    end
    object btn_save: TRzBitBtn
      Left = 396
      Top = 270
      Width = 100
      Height = 35
      Default = True
      Anchors = [akRight, akBottom]
      Caption = 'Save'
      TabOrder = 12
      OnClick = btn_saveClick
    end
    object btn_delete: TRzBitBtn
      Left = 135
      Top = 270
      Width = 100
      Height = 35
      Anchors = [akLeft, akBottom]
      Caption = 'Delete'
      Enabled = False
      TabOrder = 16
      OnClick = btn_deleteClick
    end
    object btn_print: TRzBitBtn
      Left = 235
      Top = 270
      Width = 100
      Height = 35
      Anchors = [akLeft, akBottom]
      Caption = 'Print'
      TabOrder = 17
      OnClick = btn_printClick
    end
    object btn_cancel: TRzBitBtn
      Left = 495
      Top = 270
      Width = 100
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 13
      OnClick = btn_cancelClick
    end
    object btn_query: TRzBitBtn
      Left = 1
      Top = 270
      Width = 35
      Height = 35
      Anchors = [akLeft, akBottom]
      TabOrder = 14
      OnClick = btn_queryClick
    end
    object edt_email: TRzEdit
      Left = 97
      Top = 221
      Width = 216
      Height = 21
      Text = ''
      TabOrder = 11
    end
    object btn_new: TRzBitBtn
      Left = 35
      Top = 270
      Width = 100
      Height = 35
      Caption = 'New'
      TabOrder = 15
      OnClick = btn_newClick
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
    Left = 472
    Top = 312
  end
  object ActionList1: TActionList
    Left = 544
    Top = 312
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
    object del: TAction
      Caption = 'del'
      ShortCut = 16430
      OnExecute = delExecute
    end
    object new: TAction
      Caption = 'new'
      ShortCut = 112
      OnExecute = newExecute
    end
    object print: TAction
      Caption = 'print'
      ShortCut = 16464
      OnExecute = printExecute
    end
  end
end
