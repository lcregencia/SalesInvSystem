object frm_supplier_details: Tfrm_supplier_details
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Supplier Details'
  ClientHeight = 317
  ClientWidth = 696
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
    Top = 245
    Width = 696
    Height = 72
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 0
    VisualStyle = vsGradient
    object RzLabel13: TRzLabel
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
    object RzLabel15: TRzLabel
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
    object RzLabel11: TRzLabel
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
    object RzLabel12: TRzLabel
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
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 245
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
    FullHeight = 200
    object RzLabel1: TRzLabel
      Left = 8
      Top = 50
      Width = 56
      Height = 13
      Caption = 'Supplier ID:'
      Transparent = True
    end
    object RzLabel2: TRzLabel
      Left = 8
      Top = 77
      Width = 79
      Height = 13
      Caption = 'Company Name:'
      Transparent = True
    end
    object RzLabel3: TRzLabel
      Left = 8
      Top = 104
      Width = 72
      Height = 13
      Caption = 'Contact Name:'
      Transparent = True
    end
    object RzLabel4: TRzLabel
      Left = 383
      Top = 104
      Width = 82
      Height = 13
      Caption = 'Contact Position:'
      Transparent = True
    end
    object RzLabel5: TRzLabel
      Left = 8
      Top = 131
      Width = 43
      Height = 13
      Caption = 'Address:'
      Transparent = True
    end
    object RzLabel6: TRzLabel
      Left = 383
      Top = 131
      Width = 23
      Height = 13
      Caption = 'City:'
      Transparent = True
    end
    object RzLabel7: TRzLabel
      Left = 8
      Top = 158
      Width = 74
      Height = 13
      Caption = 'Phone Number:'
      Transparent = True
    end
    object RzLabel8: TRzLabel
      Left = 383
      Top = 158
      Width = 62
      Height = 13
      Caption = 'Fax Number:'
      Transparent = True
    end
    object RzLabel9: TRzLabel
      Left = 8
      Top = 185
      Width = 28
      Height = 13
      Caption = 'Email:'
      Transparent = True
    end
    object RzLabel10: TRzLabel
      Left = 8
      Top = 8
      Width = 121
      Height = 19
      Caption = 'Supplier Detail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_id: TRzEdit
      Left = 93
      Top = 47
      Width = 203
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object edt_name: TRzEdit
      Left = 93
      Top = 101
      Width = 274
      Height = 21
      Text = ''
      TabOrder = 2
    end
    object edt_address: TRzEdit
      Left = 93
      Top = 128
      Width = 274
      Height = 21
      Text = ''
      TabOrder = 3
    end
    object edt_phone_number: TRzEdit
      Left = 93
      Top = 155
      Width = 274
      Height = 21
      Text = ''
      TabOrder = 5
    end
    object edt_city: TRzEdit
      Left = 471
      Top = 128
      Width = 209
      Height = 21
      Text = ''
      TabOrder = 4
    end
    object edt_fax_number: TRzEdit
      Left = 471
      Top = 155
      Width = 209
      Height = 21
      Text = ''
      TabOrder = 6
    end
    object edt_email: TRzEdit
      Left = 93
      Top = 182
      Width = 274
      Height = 21
      Text = ''
      TabOrder = 7
    end
    object edt_company_name: TRzEdit
      Left = 93
      Top = 74
      Width = 587
      Height = 21
      Text = ''
      TabOrder = 1
    end
    object btn_save: TRzBitBtn
      Left = 496
      Top = 209
      Width = 100
      Height = 35
      Default = True
      Caption = 'Save'
      TabOrder = 8
      OnClick = btn_saveClick
      OnKeyDown = btn_saveKeyDown
    end
    object btn_delete: TRzBitBtn
      Left = 135
      Top = 209
      Width = 100
      Height = 35
      Caption = 'Delete'
      Enabled = False
      TabOrder = 9
      OnClick = btn_deleteClick
    end
    object btn_Cancel: TRzBitBtn
      Left = 596
      Top = 209
      Width = 100
      Height = 35
      Caption = 'Cancel'
      TabOrder = 10
      OnClick = btn_CancelClick
    end
    object btn_print: TRzBitBtn
      Left = 235
      Top = 209
      Width = 100
      Height = 35
      Caption = 'Print'
      TabOrder = 11
      OnClick = btn_printClick
    end
    object btn_query: TRzBitBtn
      Left = 0
      Top = 209
      Width = 35
      Height = 35
      TabOrder = 12
      OnClick = btn_queryClick
    end
    object cmb_title: TRzComboBox
      Left = 471
      Top = 101
      Width = 173
      Height = 21
      Style = csDropDownList
      TabOrder = 13
    end
    object btn_new: TRzBitBtn
      Left = 35
      Top = 209
      Width = 100
      Height = 35
      Caption = 'New'
      TabOrder = 14
      OnClick = btn_newClick
    end
    object btn_position_att: TRzBitBtn
      Left = 650
      Top = 101
      Width = 30
      Height = 21
      Caption = '...'
      TabOrder = 15
      OnClick = btn_position_attClick
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
    Left = 504
    Top = 256
  end
  object ActionList1: TActionList
    Left = 584
    Top = 256
    object Esc: TAction
      Caption = 'ESC'
      ShortCut = 27
      OnExecute = EscExecute
    end
    object delete: TAction
      Caption = 'delete'
      ShortCut = 16430
      OnExecute = deleteExecute
    end
    object print: TAction
      Caption = 'print'
      ShortCut = 16464
      OnExecute = printExecute
    end
    object new: TAction
      Caption = 'new'
      ShortCut = 112
      OnExecute = newExecute
    end
    object refresh: TAction
      Caption = 'refresh'
      ShortCut = 116
      OnExecute = refreshExecute
    end
  end
end
