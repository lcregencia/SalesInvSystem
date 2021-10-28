object stock_distribution_frm: Tstock_distribution_frm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'stock_distribution_frm'
  ClientHeight = 709
  ClientWidth = 762
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
  object panel: TAdvPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 637
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
    Styler = mf_inventory_frm.AdvPanelStyler1
    Text = ''
    FullHeight = 200
    object RzLabel1: TRzLabel
      Left = 7
      Top = 14
      Width = 180
      Height = 19
      Caption = 'Stock Distribution List'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 7
      Top = 91
      Width = 66
      Height = 13
      Caption = 'Quick Search:'
    end
    object btn_cancel: TRzBitBtn
      Left = 660
      Top = 601
      Width = 100
      Height = 35
      Caption = 'Close'
      TabOrder = 1
      OnClick = btn_cancelClick
    end
    object btn_search_item: TRzBitBtn
      Left = 37
      Top = 601
      Width = 100
      Height = 35
      Caption = 'New Distribution'
      TabOrder = 2
      OnClick = btn_search_itemClick
    end
    object edt_search: TRzEdit
      Left = 75
      Top = 83
      Width = 400
      Height = 21
      Text = ''
      TabOrder = 0
      OnChange = edt_searchChange
    end
    object btn_query: TRzBitBtn
      Left = 3
      Top = 601
      Width = 35
      Height = 35
      HotTrack = True
      TabOrder = 3
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
    object split_distribution: TRzSplitter
      Left = -3
      Top = 120
      Width = 762
      Height = 480
      Position = 0
      Percent = 0
      HotSpotVisible = True
      HotSpotSizePercent = 100
      SplitterWidth = 7
      TabOrder = 4
      BarSize = (
        0
        0
        7
        480)
      HotSpotClosed = True
      HotSpotClosedToMin = True
      HotSpotClosedToMax = False
      HotSpotPosition = 227
      UpperLeftControls = (
        AdvPanel1)
      LowerRightControls = (
        grd_distribution)
      object AdvPanel1: TAdvPanel
        Left = 0
        Top = 0
        Width = 0
        Height = 480
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
        Styler = mf_inventory_frm.AdvPanelStyler1
        Text = ''
        FullHeight = 200
        object RzLabel3: TRzLabel
          Left = 7
          Top = 13
          Width = 24
          Height = 13
          Caption = 'From'
          Transparent = True
        end
        object RzLabel4: TRzLabel
          Left = 7
          Top = 59
          Width = 12
          Height = 13
          Caption = 'To'
          Transparent = True
        end
        object RzLabel8: TRzLabel
          Left = 7
          Top = 202
          Width = 19
          Height = 13
          Caption = 'Unit'
          Transparent = True
        end
        object RzLabel10: TRzLabel
          Left = 7
          Top = 105
          Width = 69
          Height = 13
          Caption = 'Location from:'
          Transparent = True
        end
        object RzLabel5: TRzLabel
          Left = 7
          Top = 151
          Width = 57
          Height = 13
          Caption = 'Location to:'
          Transparent = True
        end
        object dtp_from: TDateTimePicker
          Left = 27
          Top = 32
          Width = 186
          Height = 21
          Date = 41017.995012997700000000
          Time = 41017.995012997700000000
          TabOrder = 0
          OnChange = dtp_fromChange
        end
        object dtp_to: TDateTimePicker
          Left = 25
          Top = 78
          Width = 186
          Height = 21
          Date = 41017.995136435190000000
          Time = 41017.995136435190000000
          TabOrder = 1
          OnChange = dtp_toChange
        end
        object cmb_unit: TRzComboBox
          Left = 27
          Top = 221
          Width = 186
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnChange = cmb_unitChange
        end
        object cmb_location: TRzComboBox
          Left = 27
          Top = 124
          Width = 186
          Height = 21
          Style = csDropDownList
          TabOrder = 3
          OnChange = cmb_locationChange
        end
        object cmb_to: TRzComboBox
          Left = 27
          Top = 172
          Width = 186
          Height = 21
          Style = csDropDownList
          TabOrder = 4
        end
      end
      object grd_distribution: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 755
        Height = 480
        Cursor = crDefault
        Align = alClient
        ColCount = 6
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentFont = False
        ParentShowHint = False
        ScrollBars = ssBoth
        ShowHint = True
        TabOrder = 0
        OnDblClick = grd_distributionDblClick
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
          'Distribution No.'
          'Date of Distribution'
          'From '
          'To'
          'Status')
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
        FixedColWidth = 21
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
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.HeaderColor = 16579058
        SortSettings.HeaderColorTo = 16579058
        SortSettings.HeaderMirrorColor = 16380385
        SortSettings.HeaderMirrorColorTo = 16182488
        Version = '7.2.0.0'
        ExplicitLeft = -1
        ExplicitTop = -5
        ColWidths = (
          21
          133
          143
          157
          159
          137)
      end
    end
    object btn_ok: TRzBitBtn
      Left = 561
      Top = 601
      Width = 100
      Height = 35
      Caption = 'Ok'
      TabOrder = 5
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 637
    Width = 762
    Height = 72
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 1
    VisualStyle = vsGradient
  end
  object ActionList1: TActionList
    Left = 16
    Top = 648
    object esc: TAction
      Caption = 'esc'
      ShortCut = 27
      OnExecute = escExecute
    end
    object Search: TAction
      Caption = 'Search'
      ShortCut = 114
      OnExecute = SearchExecute
    end
    object Refresh: TAction
      Caption = 'Refresh'
      ShortCut = 116
      OnExecute = RefreshExecute
    end
    object open_splitter: TAction
      Caption = 'open_splitter'
      ShortCut = 117
      OnExecute = open_splitterExecute
    end
    object print_preview: TAction
      Caption = 'print_preview'
      ShortCut = 16464
    end
  end
end
