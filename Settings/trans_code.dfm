object trans_code_frm: Ttrans_code_frm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Transaction Code'
  ClientHeight = 740
  ClientWidth = 1018
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
    Top = 668
    Width = 1018
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
    object RzLabel14: TRzLabel
      Left = 130
      Top = 30
      Width = 97
      Height = 13
      Caption = 'F3 - Quick Search'
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
      Top = 49
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
      Top = 30
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
    object RzLabel8: TRzLabel
      Left = 244
      Top = 11
      Width = 66
      Height = 13
      Caption = 'Del - Delete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel12: TRzLabel
      Left = 244
      Top = 49
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
    Width = 1018
    Height = 668
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
      Top = 8
      Width = 142
      Height = 19
      Caption = 'Transaction Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel2: TRzLabel
      Left = 8
      Top = 36
      Width = 76
      Height = 13
      Caption = 'Quick Search:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edt_search: TRzEdit
      Left = 90
      Top = 33
      Width = 400
      Height = 21
      Text = ''
      TabOrder = 0
    end
    object grd_trans_code: TAdvStringGrid
      Left = 0
      Top = 60
      Width = 1018
      Height = 573
      Cursor = crDefault
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      OnClick = grd_trans_codeClick
      OnDblClick = grd_trans_codeDblClick
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
        'Description'
        'Code'
        'Transaction Value'
        'Inventory Value')
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
        676
        92
        120
        114)
    end
    object btn_query: TRzBitBtn
      Left = 0
      Top = 633
      Width = 35
      Height = 35
      Caption = 'btn_query'
      TabOrder = 2
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
    object btn_close: TRzBitBtn
      Left = 918
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Close'
      TabOrder = 3
      OnClick = btn_closeClick
    end
    object btn_print: TRzBitBtn
      Left = 335
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Print'
      TabOrder = 4
    end
    object btn_edit: TRzBitBtn
      Left = 135
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Edit'
      TabOrder = 5
    end
    object btn_add: TRzBitBtn
      Left = 35
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Add'
      TabOrder = 6
      OnClick = btn_addClick
    end
    object btn_delete: TRzBitBtn
      Left = 235
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Delete'
      TabOrder = 7
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
    Left = 496
    Top = 640
  end
  object ActionList1: TActionList
    Left = 576
    Top = 640
    object esc: TAction
      Caption = 'esc'
      ShortCut = 27
      OnExecute = escExecute
    end
    object new: TAction
      Caption = 'new'
      ShortCut = 112
      OnExecute = newExecute
    end
    object search: TAction
      Caption = 'search'
      ShortCut = 114
      OnExecute = searchExecute
    end
    object refresh: TAction
      Caption = 'refresh'
      ShortCut = 116
      OnExecute = refreshExecute
    end
    object delete: TAction
      Caption = 'delete'
      ShortCut = 46
      OnExecute = deleteExecute
    end
    object print: TAction
      Caption = 'print'
      ShortCut = 16464
      OnExecute = printExecute
    end
  end
end
