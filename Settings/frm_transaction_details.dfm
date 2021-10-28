object frm_trans_details: Tfrm_trans_details
  Left = 0
  Top = 0
  Caption = 'Transaction Details'
  ClientHeight = 673
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 616
    Align = alClient
    BevelOuter = bvNone
    Color = 16645114
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.1.0.3'
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
    ExplicitWidth = 724
    FullHeight = 200
    object RzLabel1: TRzLabel
      Left = 8
      Top = 24
      Width = 74
      Height = 13
      Caption = 'Transaction ID:'
      Transparent = True
    end
    object RzLabel2: TRzLabel
      Left = 8
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Batch:'
      Transparent = True
    end
    object RzLabel3: TRzLabel
      Left = 0
      Top = 477
      Width = 73
      Height = 19
      Caption = 'Machine:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel4: TRzLabel
      Left = 8
      Top = 120
      Width = 37
      Height = 13
      Caption = 'Branch:'
      Transparent = True
    end
    object RzLabel5: TRzLabel
      Left = 424
      Top = 88
      Width = 54
      Height = 13
      Caption = 'Reference:'
      Transparent = True
    end
    object RzLabel6: TRzLabel
      Left = 424
      Top = 24
      Width = 60
      Height = 13
      Caption = 'Transaction:'
      Transparent = True
    end
    object RzLabel7: TRzLabel
      Left = 8
      Top = 56
      Width = 50
      Height = 13
      Caption = 'Customer:'
      Transparent = True
    end
    object RzLabel8: TRzLabel
      Left = 496
      Top = 597
      Width = 28
      Height = 13
      Caption = 'Cash:'
      Transparent = True
    end
    object RzLabel9: TRzLabel
      Left = 496
      Top = 559
      Width = 28
      Height = 13
      Caption = 'Total:'
      Transparent = True
    end
    object RzLabel10: TRzLabel
      Left = 496
      Top = 524
      Width = 48
      Height = 13
      Caption = 'Vat Sales:'
      Transparent = True
    end
    object RzLabel11: TRzLabel
      Left = 496
      Top = 495
      Width = 45
      Height = 13
      Caption = 'Discount:'
      Transparent = True
    end
    object RzLabel12: TRzLabel
      Left = 88
      Top = 477
      Width = 85
      Height = 19
      Caption = 'RzLabel12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object AdvStringGrid1: TAdvStringGrid
      Left = 0
      Top = 143
      Width = 729
      Height = 322
      Cursor = crDefault
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        ''
        'Items'
        'Unit'
        'Quantity'
        'Price')
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      DefaultAlignment = taCenter
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 10
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      ShowDesignHelper = False
      Version = '6.0.0.1'
      ColWidths = (
        10
        235
        64
        64
        117)
    end
    object RzEdit1: TRzEdit
      Left = 88
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object RzEdit2: TRzEdit
      Left = 88
      Top = 53
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object RzEdit3: TRzEdit
      Left = 88
      Top = 85
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object RzEdit4: TRzEdit
      Left = 88
      Top = 117
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object RzEdit5: TRzEdit
      Left = 504
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object RzEdit6: TRzEdit
      Left = 504
      Top = 85
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object RzEdit7: TRzEdit
      Left = 560
      Top = 492
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object RzEdit8: TRzEdit
      Left = 560
      Top = 521
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object RzBitBtn1: TRzBitBtn
      Left = 0
      Top = 575
      Width = 35
      Height = 35
      Caption = 'RzBitBtn1'
      TabOrder = 9
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 616
    Width = 729
    Height = 57
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 2
    VisualStyle = vsGradient
    ExplicitWidth = 724
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
    Left = 32
    Top = 624
  end
end
