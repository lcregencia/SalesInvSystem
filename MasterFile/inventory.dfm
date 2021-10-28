object mf_inventory_frm: Tmf_inventory_frm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Inventory Master File'
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
    object RzLabel12: TRzLabel
      Left = 356
      Top = 11
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
    object RzLabel11: TRzLabel
      Left = 244
      Top = 49
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
      Top = 30
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
    object RzLabel7: TRzLabel
      Left = 244
      Top = 11
      Width = 91
      Height = 13
      Caption = 'F6 - Open Filters'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
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
    object cmb_trans_code: TRzComboBox
      Left = 936
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 0
      Visible = False
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
    TabOrder = 2
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
      Left = 10
      Top = 48
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
    object RzLabel9: TRzLabel
      Left = 8
      Top = 8
      Width = 174
      Height = 19
      Caption = 'Inventory Master File'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_barcode: TRzLabel
      Left = 576
      Top = 18
      Width = 55
      Height = 13
      Caption = 'lbl_barcode'
      Visible = False
    end
    object lbl_price: TRzLabel
      Left = 576
      Top = 37
      Width = 39
      Height = 13
      Caption = 'lbl_price'
      Visible = False
    end
    object lbl_description: TRzLabel
      Left = 576
      Top = 56
      Width = 68
      Height = 13
      Caption = 'lbl_description'
      Visible = False
    end
    object lbl_unit: TRzLabel
      Left = 576
      Top = 0
      Width = 34
      Height = 13
      Caption = 'lbl_unit'
      Visible = False
    end
    object lbl_category: TRzLabel
      Left = 650
      Top = 0
      Width = 59
      Height = 13
      Caption = 'lbl_category'
      Visible = False
    end
    object lbl_brand: TRzLabel
      Left = 650
      Top = 18
      Width = 44
      Height = 13
      Caption = 'lbl_brand'
      Visible = False
    end
    object lbl_generic: TRzLabel
      Left = 650
      Top = 37
      Width = 51
      Height = 13
      Caption = 'lbl_generic'
      Visible = False
    end
    object lbl_type: TRzLabel
      Left = 650
      Top = 56
      Width = 38
      Height = 13
      Caption = 'lbl_type'
      Visible = False
    end
    object split_inventory: TRzSplitter
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
          Width = 28
          Height = 13
          Caption = 'Brand'
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
          Width = 45
          Height = 13
          Caption = 'Category'
          Transparent = True
        end
        object RzLabel5: TRzLabel
          Left = 8
          Top = 99
          Width = 24
          Height = 13
          Caption = 'Type'
          Transparent = True
        end
        object RzLabel6: TRzLabel
          Left = 8
          Top = 136
          Width = 36
          Height = 13
          Caption = 'Generic'
          Transparent = True
        end
        object RzLabel10: TRzLabel
          Left = 8
          Top = 177
          Width = 33
          Height = 13
          Caption = 'Branch'
        end
        object cmb_brand: TRzComboBox
          Left = 8
          Top = 42
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnClick = cmb_brandClick
        end
        object cmb_category: TRzComboBox
          Left = 8
          Top = 78
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          OnClick = cmb_categoryClick
        end
        object cmb_type: TRzComboBox
          Left = 8
          Top = 115
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnClick = cmb_typeClick
        end
        object cmb_generic: TRzComboBox
          Left = 8
          Top = 150
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 3
          OnClick = cmb_genericClick
        end
        object cmb_branch: TRzComboBox
          Left = 8
          Top = 196
          Width = 150
          Height = 21
          Style = csDropDownList
          TabOrder = 4
          OnChange = cmb_branchChange
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
        object grd_mf_inventory: TAdvStringGrid
          Left = 0
          Top = 0
          Width = 1011
          Height = 561
          Cursor = crDefault
          Align = alClient
          ColCount = 10
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
          OnClick = grd_mf_inventoryClick
          OnDblClick = grd_mf_inventoryDblClick
          OnKeyDown = grd_mf_inventoryKeyDown
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
            'Barcode'
            'Description'
            'Price'
            'Unit'
            'Qty'
            'Generic'
            'Type'
            'Brand'
            'Category'
            ''
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
          ColWidths = (
            10
            127
            227
            70
            83
            63
            111
            96
            107
            109)
        end
      end
    end
    object btn_query: TRzBitBtn
      Left = 0
      Top = 633
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
      Left = 92
      Top = 45
      Width = 469
      Height = 21
      Text = ''
      TabOrder = 2
      OnChange = edt_searchChange
      OnKeyDown = edt_searchKeyDown
    end
    object btn_ok: TRzBitBtn
      Left = 818
      Top = 633
      Width = 100
      Height = 35
      Caption = 'OK'
      TabOrder = 3
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
    object btn_add: TRzBitBtn
      Left = 35
      Top = 633
      Width = 100
      Height = 35
      FrameColor = 7617536
      Caption = 'Add'
      Color = 15791348
      TabOrder = 4
      OnClick = btn_addClick
    end
    object btn_edit: TRzBitBtn
      Left = 134
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Edit'
      TabOrder = 5
      OnClick = btn_editClick
    end
    object btn_delete: TRzBitBtn
      Left = 233
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Delete'
      TabOrder = 6
      OnClick = btn_deleteClick
    end
    object btn_print: TRzBitBtn
      Left = 332
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Print'
      TabOrder = 7
      OnClick = btn_printClick
    end
    object btn_close: TRzBitBtn
      Left = 917
      Top = 633
      Width = 100
      Height = 35
      Caption = 'Close'
      TabOrder = 8
      OnClick = btn_closeClick
      Glyph.Data = {
        660C0000424D660C0000000000003600000028000000220000001E0000000100
        180000000000300C0000120B0000120B00000000000000000000FFFFFFFFFFFF
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C8E05B62B1B9BC
        DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC2DD5C63B2C2C4DEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C8E1
        16219D010D9F0D1798B6B9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEC0DD101A
        98010D9F121D9BC0C3DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFCBCCE51823A2010D9B010C90010C940F1A98BABDDAFFFFFFFFFFFFFFFFFF
        C1C3E0131C98010C94010C90010D9B141FA1C4C6E2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCED0E81C27A7010EA2010D95010FA0010E9F010D98121C9DBE
        C0E1FFFFFFC5C7E4151F9C010D95010E9F010EA0010D95010EA11722A6C8CAE5
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFAFB1DC1E28AC000DA8010D9B010EA5010FAC010F
        AB010EA4010D9C1C27A89A9DD4212AA7010C93010EA1010FAC010FAC010EA601
        0D9A010FA81B26ACAAADDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F83D01C27B40A16A4010DA7
        000CAE010EAE020FAE020FAF020EA8010DA1030FA7010D97020DA3020FB0020F
        AE020FAE020FAF020EA9010DA1020FAD686DC6FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEC0F247
        4DC73843BC2C37C01724B80512B3000DB1010EB20210B3020FAC010D9C020EA6
        0210B40210B20210B20210B20210B20210B30110AF1418A5ADAADBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF2F2FD7377E53A42C93A45C43B46C6333EC41D29BD0614B7000DB501
        0FB6020FB20210B70210B60210B60210B60210B60210B60111B8080EAC524BB0
        ECEBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCEF7474FE33C45CF3640C63843C83B45
        C9333EC71925C00210BA000EBA0210BA0210BA0210BA0210BA0210BA0111BC09
        0FB30F0599B5B1DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C7F9505DF4
        3D48D93541CB3642CB3844CC3A46CD2C38C90C1AC1000EBE0211BE0211BE0211
        BE0212C00810BD0C06A6A19ED7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFC6CDFF4B5CF2353FCB333FCF3541CF3541CF3944D03742D01927C8
        000FC20210C30311C40512BF100DB5A3A1DCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE8E8FC4B52CA303ABA313ED5323ED2333FD234
        40D23642D33A45D32430CE0311C70110CA020FAF1B23B3DCDCF7FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5FB5157D82C36B32E39C62F3C
        D7303DD5313ED5323FD53440D63541D63A45D72A37D40514CE010FBD010EA52C
        35D1DCDCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8FC545AE22833BC
        2A34C52B37D92C38D82D3AD82E3BD8303DD8323FD93440D93541D93A45DA2C39
        D70514D2010EBD000EAF2E37DADFDFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECEFA55
        5BE72330C52530C72633DB2733DA2835DA2A36DB2C38DB2D3BDB2E3DDB313FDC
        3340DC3541DD3A46DD2A37DB0313D6020FC0000FBA353CE1C3C3F9FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF8688F2202DD21F2CCB202EDD212FDD2230DD2431DD2633DD2835DE2C
        39DE323DE12E3BDE313FDF3441E03642E03B48E12532DD0111DA0210C50212CC
        7275F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC8C9F64249DF1927DF1C29DF1C29DF1E2BDF202D
        DF2230E02633E02833E23D49EC444EEB2E3AE03340E23542E23743E33C48E31A
        28DF0011E02328CFB7B5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8AAEE2B34E51221E1
        1725E11926E21B28E21E2BE22933E61425E4717FF37580FD414BEB303CE43441
        E53743E53844E63947EA1B21D78884CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF999DEF2831E70E1EE31322E31524E32732EA2033F2818DF6FFFFFFBDC3FD
        5662F33E47EB3441E83542E73947EB3D43DE706AC1FEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF9094F1212BE80F1EE7222DE92E3FF28895FBFF
        FFFFFFFFFFFFFFFF9DA3F3212ADF3740E83A47ED3D45E5706CC9FDFDFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF8185ED2026DC1D25
        D8858EF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C81E9141DD83138E17375DEFB
        FBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FAFAFE888BE18D8FE2FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9397
        EC878BE9F7F7FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
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
    Left = 152
    Top = 504
  end
  object ActionList1: TActionList
    Left = 232
    Top = 504
    object esc: TAction
      Caption = 'esc'
      ShortCut = 27
      OnExecute = escExecute
    end
    object splitter: TAction
      Caption = 'splitter'
      ShortCut = 117
      OnExecute = splitterExecute
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
    object new: TAction
      Caption = 'new'
      ShortCut = 112
      OnExecute = newExecute
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
