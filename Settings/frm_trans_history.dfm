object frm_transaction_history: Tfrm_transaction_history
  Left = 0
  Top = 0
  Caption = 'frm_transaction_history'
  ClientHeight = 742
  ClientWidth = 1022
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
    Top = 670
    Width = 1022
    Height = 72
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 0
    VisualStyle = vsGradient
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 1022
    Height = 670
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
    FullHeight = 738
    object RzLabel1: TRzLabel
      Left = 23
      Top = 50
      Width = 73
      Height = 13
      Caption = 'Quick Search'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel9: TRzLabel
      Left = 8
      Top = 8
      Width = 159
      Height = 19
      Caption = 'Transaction History'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzSplitter1: TRzSplitter
      Left = 0
      Top = 72
      Width = 1018
      Height = 561
      LockBar = True
      Position = 0
      Percent = 0
      HotSpotVisible = True
      HotSpotSizePercent = 100
      SplitterWidth = 7
      Align = alCustom
      TabOrder = 0
      BarSize = (
        0
        0
        7
        561)
      HotSpotClosed = True
      HotSpotClosedToMin = True
      HotSpotClosedToMax = False
      HotSpotPosition = 165
      UpperLeftControls = (
        AdvPanel3)
      LowerRightControls = (
        AdvPanel2)
      object AdvPanel3: TAdvPanel
        Left = 0
        Top = 0
        Width = 0
        Height = 561
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
        object RzLabel2: TRzLabel
          Left = 8
          Top = 29
          Width = 75
          Height = 13
          Caption = 'Company Name'
          Transparent = True
        end
        object RzLabel3: TRzLabel
          Left = 8
          Top = 10
          Width = 35
          Height = 13
          Caption = 'Filters'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object RzLabel4: TRzLabel
          Left = 8
          Top = 63
          Width = 27
          Height = 13
          Caption = 'Name'
          Transparent = True
        end
        object RzLabel5: TRzLabel
          Left = 8
          Top = 99
          Width = 20
          Height = 13
          Caption = 'Title'
          Transparent = True
        end
        object RzLabel6: TRzLabel
          Left = 8
          Top = 136
          Width = 39
          Height = 13
          Caption = 'Address'
          Transparent = True
        end
        object RzLabel10: TRzLabel
          Left = 8
          Top = 172
          Width = 19
          Height = 13
          Caption = 'City'
        end
        object cmb_companyname: TRzComboBox
          Left = 8
          Top = 42
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 0
        end
        object cmb_name: TRzComboBox
          Left = 8
          Top = 78
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 1
        end
        object cmb_title: TRzComboBox
          Left = 8
          Top = 115
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 2
        end
        object cmb_address: TRzComboBox
          Left = 8
          Top = 150
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 3
        end
        object cmb_city: TRzComboBox
          Left = 8
          Top = 186
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 4
        end
      end
      object AdvPanel2: TAdvPanel
        Left = 0
        Top = 0
        Width = 1011
        Height = 561
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
        object grd_transhistory: TAdvStringGrid
          Left = 0
          Top = 0
          Width = 1011
          Height = 561
          Cursor = crDefault
          Align = alClient
          ColCount = 9
          DrawingStyle = gdsClassic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnClick = grd_transhistoryClick
          OnDblClick = grd_transhistoryDblClick
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 16575452
          ActiveCellColorTo = 16571329
          ColumnHeaders.Strings = (
            ''
            'Machine'
            'Date'
            'Transaction'
            'Customer/Supplier'
            'Branch'
            'Batch'
            'Reference'
            'Total')
          ControlLook.FixedGradientMirrorFrom = 16049884
          ControlLook.FixedGradientMirrorTo = 16247261
          ControlLook.FixedGradientHoverFrom = 16710648
          ControlLook.FixedGradientHoverTo = 16446189
          ControlLook.FixedGradientHoverMirrorFrom = 16049367
          ControlLook.FixedGradientHoverMirrorTo = 15258305
          ControlLook.FixedGradientDownFrom = 15853789
          ControlLook.FixedGradientDownTo = 15852760
          ControlLook.FixedGradientDownMirrorFrom = 15522767
          ControlLook.FixedGradientDownMirrorTo = 15588559
          ControlLook.FixedGradientDownBorder = 14007466
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
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'Tahoma'
          FilterDropDown.Font.Style = []
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Clear')
          FixedColWidth = 10
          FixedRowHeight = 22
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          Look = glWin7
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
          ScrollWidth = 15
          SearchFooter.Color = 16645370
          SearchFooter.ColorTo = 16247261
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
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '7.2.0.0'
          ColWidths = (
            10
            101
            110
            144
            175
            161
            91
            82
            122)
        end
      end
    end
    object btn_query: TRzBitBtn
      Left = 1
      Top = 632
      Width = 35
      Height = 35
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_queryClick
    end
    object btn_close: TRzButton
      Left = 917
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Close'
      TabOrder = 2
      OnClick = btn_closeClick
    end
    object edt_search: TRzEdit
      Left = 100
      Top = 45
      Width = 469
      Height = 21
      Text = ''
      TabOrder = 3
    end
    object btn_print: TRzBitBtn
      Left = 817
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Print'
      TabOrder = 4
      OnClick = btn_printClick
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
    Left = 40
    Top = 672
  end
  object ActionList1: TActionList
    Left = 8
    Top = 672
    object Esc: TAction
      Caption = 'ESC'
      ShortCut = 27
    end
    object new: TAction
      Caption = 'new'
      ShortCut = 112
    end
    object delete: TAction
      Caption = 'delete'
      ShortCut = 46
    end
    object print: TAction
      Caption = 'print'
      ShortCut = 16464
    end
    object refresh: TAction
      Caption = 'refresh'
      ShortCut = 116
    end
  end
end
