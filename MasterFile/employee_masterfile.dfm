object mf_employee_frm: Tmf_employee_frm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Employee Master File'
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
      Width = 174
      Height = 19
      Caption = 'Employee Master File'
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
          Top = 27
          Width = 37
          Height = 13
          Caption = 'Position'
          Transparent = True
        end
        object cmb_position: TRzComboBox
          Left = 8
          Top = 42
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnClick = cmb_positionClick
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
        object grd_mf_employee: TAdvStringGrid
          Left = 0
          Top = 0
          Width = 1011
          Height = 561
          Cursor = crDefault
          Align = alClient
          ColCount = 7
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
          OnClick = grd_mf_employeeClick
          OnDblClick = grd_mf_employeeDblClick
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
            'Name'
            'Gender'
            'Birthdate'
            'Contact No.'
            'Email'
            'Position'
            ''
            '')
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
          SelectionTextColor = clNone
          ShowDesignHelper = False
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '7.2.0.0'
          ExplicitLeft = -1
          ColWidths = (
            10
            274
            107
            135
            152
            187
            140)
        end
      end
    end
    object btn_query: TRzBitBtn
      Left = 1
      Top = 632
      Width = 35
      Height = 35
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_queryClick
      Glyph.Data = {
        06080000424D060800000000000036000000280000001A000000190000000100
        180000000000D0070000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EAD7DF952DFCF6EDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E7B570DD921FE5AD5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCF9D98E23D17905D78715F3DCBDFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFAF2E6F4E2C9EBCA9DEAC796EDCEA4F4E2C8E8C28E
        D28513CA7300CD7A08D8932FFEFCF9FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F0E3DFAF6ED08928CA790ACA79
        0ACA790ACA7A0ACB7B0CCC7E0FD08516CA7909C57000C57000CE8112E2B678FF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3
        BE8CC4750CC27003C06E01C06D00C06D00C06D00C06D00C06D00C06D00C06D00
        C06D00C06D00C06D00C16F02CC8319F4E6D3FFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDBB27CBB6C02BA6B01BA6A00BA6A00BA6A00BA6A
        00BA6A00BA6A00BA6A00BA6A00BA6A00BA6A00BA6A00BA6A00BA6A00C07309D0
        9540FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D0B1CD9854EA
        D4B7F1E2CFF0E0CCE8D0B1CE9A57B86D0CB56600B56600B56600B56600B56600
        B56600B56600B56600B56600B56600BE740DE1C093FFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF2E5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F4
        EDD0A369AF6300AF6300AF6300AF6300AF6300AF6300AF6300AF6300AF6300B0
        6502BB7618F6EEE30000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6D0B4AC6406AA6000AA6000
        AA6000AA6000AA6000AA6000AA6000AA6000AC6303C99A5A0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF2E8DBA55D00A55D00A55D00A55D00A55D00A55D00A55D00A55D00A5
        5D00A65E01B377280000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF1E1CCDFB987CF964CBE720DF4E6D4FFFFFFCCA675A05B00A05B00A05B00
        A05B00A05B00A05B00A05B00B1782DCDA878E5D3BAFDFBF90000FFFFFFFFFFFF
        FFFFFFFFFFFFF8EFE3E7CBA3D5A461C58224C17813C17813C17813C78529FEFD
        FCFDFBF9A466159C58009C58009C5800A46615BE9157DCC4A5F6EFE7FFFFFFFF
        FFFFFFFFFFFFFFFF0000FCF9F4EED8B9DFB77DCE9139C67F19C67F19C67F19C6
        7F19C67F19C67F19C67F19E2BE8BFFFFFFE8D9C69A5903B58445CEAE84ECDFCF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000D3983DCC8822
        CB8720CB8720CB8720CB8720CB8720CB8720CB8720CB8720CC8823F9F1E5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000E1B66FD49630D08F28D08F28D08F28D08F28D08F28D0
        8F28D08F28D08F28D1922DF2DFC2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FBF4E9DFAB4B
        D89C35D69830D69830D69830D69830D69830D69830D69830D69830D69830E7C3
        86FCF8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E9D3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFF1D8AAE6B755DBA239DBA239DBA239DBA239DB
        A239DBA239DBA239DBA239DBA239DBA239DDA642E7C27DF4E3C2F8ECD7F8ECD7
        F4E3C2E6BD73F5E6C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFEFD
        EDC774E8B955E1AB42E1AB42E1AB42E1AB42E1AB42E1AB42E1AB42E1AB42E1AB
        42E1AB42E1AB42E1AB42E1AB42E1AC43E2AD45F0D6A4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFAF1DCF2CB6CE8B74EE7B44AE7B44AE7
        B44AE7B44AE7B44AE7B44AE7B44AE7B44AE7B44AE7B44AE8B64CE9B850EABC59
        F6E1B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFF7DDA1F4CE6DECBC52ECBC52F0C661F6D173F3CB69F2C965F1C763F1C6
        62F1C661F0C560F2CD77F6DCA3FEFAF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFEFCF7F8D67CF4CB64F1C459F7
        D372F9E6B7FCF3DBFAEBC3FAE7BAFBEDC9FCF3DCFEFCF5FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFDF0D0FAD877F7CF66FAD87DFFFEFDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE299FDE085FC
        E6AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCF3FDDF8AFFF9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
    end
    object edt_search: TRzEdit
      Left = 100
      Top = 45
      Width = 469
      Height = 21
      Text = ''
      TabOrder = 2
      OnChange = btn_queryClick
      OnKeyDown = edt_searchKeyDown
    end
    object btn_new: TRzBitBtn
      Left = 620
      Top = 633
      Width = 100
      Height = 35
      Caption = 'New'
      TabOrder = 3
      OnClick = btn_newClick
    end
    object btn_delete: TRzBitBtn
      Left = 719
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Delete'
      TabOrder = 4
      OnClick = btn_deleteClick
    end
    object btn_print: TRzBitBtn
      Left = 818
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Print'
      TabOrder = 5
      OnClick = btn_printClick
    end
    object btn_close1: TRzBitBtn
      Left = 917
      Top = 632
      Width = 100
      Height = 35
      Caption = 'Close'
      TabOrder = 6
      OnClick = btn_close1Click
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
    Left = 96
    Top = 672
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
end
