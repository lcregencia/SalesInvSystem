object pos_sales_frm: Tpos_sales_frm
  Left = 0
  Top = 0
  Align = alCustom
  BorderStyle = bsDialog
  Caption = 'Sales'
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
  object RzPanel3: TRzPanel
    Left = 0
    Top = 668
    Width = 1018
    Height = 72
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 0
    VisualStyle = vsGradient
    object lbl_unit: TRzLabel
      Left = 273
      Top = 0
      Width = 34
      Height = 13
      Caption = 'lbl_unit'
      Visible = False
    end
    object RzLabel7: TRzLabel
      Left = 273
      Top = 37
      Width = 39
      Height = 13
      Caption = 'lbl_price'
      Visible = False
    end
    object lbl_description: TRzLabel
      Left = 273
      Top = 56
      Width = 68
      Height = 13
      Caption = 'lbl_description'
      Visible = False
    end
    object lbl_category: TRzLabel
      Left = 347
      Top = 0
      Width = 59
      Height = 13
      Caption = 'lbl_category'
      Visible = False
    end
    object lbl_brand: TRzLabel
      Left = 347
      Top = 18
      Width = 44
      Height = 13
      Caption = 'lbl_brand'
      Visible = False
    end
    object lbl_generic: TRzLabel
      Left = 347
      Top = 37
      Width = 51
      Height = 13
      Caption = 'lbl_generic'
      Visible = False
    end
    object lbl_type: TRzLabel
      Left = 347
      Top = 56
      Width = 38
      Height = 13
      Caption = 'lbl_type'
      Visible = False
    end
    object lbl_id: TRzLabel
      Left = 394
      Top = 56
      Width = 24
      Height = 13
      Caption = 'lbl_id'
      Visible = False
    end
    object lbl_barcode: TRzLabel
      Left = 273
      Top = 18
      Width = 55
      Height = 13
      Caption = 'lbl_barcode'
      Visible = False
    end
    object btn_item_query: TRzButton
      Left = 4
      Top = 0
      Width = 87
      Caption = 'ItemQuery'
      TabOrder = 0
      Visible = False
      OnClick = btn_item_queryClick
    end
    object btn_trans_no_query: TRzButton
      Left = 4
      Top = 24
      Width = 87
      Caption = 'TransMaxQuery'
      TabOrder = 1
      Visible = False
      OnClick = btn_trans_no_queryClick
    end
    object btn_new_trans: TRzButton
      Left = 89
      Top = 0
      Width = 89
      Caption = 'NewTransQuery'
      TabOrder = 2
      Visible = False
      OnClick = btn_new_transClick
    end
    object btn_cus_query: TButton
      Left = 90
      Top = 24
      Width = 89
      Height = 25
      Caption = 'CustomerQuery'
      TabOrder = 3
      Visible = False
      OnClick = btn_cus_queryClick
    end
    object btn_add_item: TRzBitBtn
      Left = 178
      Top = 25
      Width = 89
      Caption = 'Add Item '
      TabOrder = 4
      Visible = False
      OnClick = btn_add_itemClick
    end
    object cmb_trans_code: TRzComboBox
      Left = 486
      Top = 35
      Width = 73
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object edt_description: TRzEdit
      Left = 440
      Top = 8
      Width = 121
      Height = 21
      Text = ''
      TabOrder = 6
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
    object lbl_price: TRzLabel
      Left = 160
      Top = 27
      Width = 210
      Height = 124
      Caption = '0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -107
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      TextStyle = tsRaised
    end
    object RzLabel1: TRzLabel
      Left = 3
      Top = 61
      Width = 134
      Height = 77
      Caption = 'PHP'
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -64
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      TextStyle = tsShadow
    end
    object RzLabel2: TRzLabel
      Left = 713
      Top = 11
      Width = 139
      Height = 19
      Caption = 'Transaction No. :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel6: TRzLabel
      Left = 8
      Top = 8
      Width = 43
      Height = 19
      Caption = 'Sales'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzBitBtn3: TRzBitBtn
      Left = 2
      Top = 143
      Width = 89
      Height = 41
      FrameColor = 7617536
      Caption = 'QTY'
      Color = 15791348
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 0
    end
    object edt_qty: TRzEdit
      Left = 92
      Top = 143
      Width = 90
      Height = 39
      Text = '1'
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object RzBitBtn4: TRzBitBtn
      Left = 183
      Top = 143
      Width = 103
      Height = 41
      Caption = 'BARCODE'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object btn_barcode: TRzButton
      Left = 4
      Top = 560
      Width = 82
      Height = 54
      Caption = 'F1'#13'Barcode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btn_barcodeClick
    end
    object btn_quantity: TRzButton
      Left = 85
      Top = 560
      Width = 83
      Height = 54
      Caption = 'F2'#13'Quantity'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_quantityClick
    end
    object btn_price_level: TRzButton
      Left = 312
      Top = 560
      Width = 83
      Height = 54
      Caption = 'F4'#13'Price Level'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btn_price_levelClick
    end
    object btn_change_quantity: TRzButton
      Left = 167
      Top = 560
      Width = 146
      Height = 54
      Caption = 'F3'#13'Change Item Quantity'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btn_change_quantityClick
    end
    object btn_sales_return: TRzButton
      Left = 394
      Top = 560
      Width = 83
      Height = 54
      Caption = 'F5'#13'Return'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btn_sales_returnClick
    end
    object btn_price_update: TRzButton
      Left = 476
      Top = 560
      Width = 83
      Height = 54
      Caption = 'F6'#13'Price Update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btn_price_updateClick
    end
    object btn_discount: TRzButton
      Left = 558
      Top = 560
      Width = 84
      Height = 54
      Caption = 'F7'#13'Discount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btn_discountClick
    end
    object btn_focus: TRzButton
      Left = 857
      Top = 560
      Width = 160
      Height = 54
      Caption = 'Enter'#13'Items Ctrl+F'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = btn_focusClick
    end
    object btn_print: TRzButton
      Left = 641
      Top = 613
      Width = 98
      Height = 55
      Caption = 'Ctrl+P'#13'Print'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btn_printClick
    end
    object btn_tender: TRzButton
      Left = 4
      Top = 613
      Width = 638
      Height = 55
      Caption = 'Spacebar'#13'Tender'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = btn_tenderClick
    end
    object btn_wholesale: TRzButton
      Left = 641
      Top = 560
      Width = 98
      Height = 54
      Caption = 'F8'#13'Wholesale'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = btn_wholesaleClick
    end
    object btn_trans_id: TRzButton
      Left = 858
      Top = 10
      Width = 155
      Color = clRed
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object btn_cancel: TRzButton
      Left = 738
      Top = 613
      Width = 121
      Height = 55
      Caption = 'Esc'#13'Cancel Transaction'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      OnClick = btn_cancelClick
    end
    object btn_del_item: TRzButton
      Left = 738
      Top = 560
      Width = 120
      Height = 54
      Alignment = taLeftJustify
      Caption = 'Del'#13'Delete Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      OnClick = btn_del_itemClick
    end
    object split_trans: TRzSplitter
      Left = 4
      Top = 188
      Width = 1014
      Height = 373
      Orientation = orVertical
      Position = 0
      Percent = 0
      HotSpotVisible = True
      HotSpotSizePercent = 100
      SplitterWidth = 7
      Align = alCustom
      GradientDirection = gdDiagonalUp
      TabOrder = 17
      BarSize = (
        0
        0
        1014
        7)
      HotSpotClosed = True
      HotSpotClosedToMin = True
      HotSpotClosedToMax = False
      HotSpotPosition = 82
      UpperLeftControls = (
        AdvPanel2)
      LowerRightControls = (
        grd_trans)
      object AdvPanel2: TAdvPanel
        Left = 0
        Top = 0
        Width = 1014
        Height = 0
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
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Name :'
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
          Top = 35
          Width = 52
          Height = 13
          Caption = 'Address :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object RzLabel5: TRzLabel
          Left = 8
          Top = 61
          Width = 64
          Height = 13
          Caption = 'Contact No.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object edt_name: TRzEdit
          Left = 88
          Top = 2
          Width = 920
          Height = 21
          Text = ''
          Enabled = False
          TabOrder = 0
        end
        object edt_address: TRzEdit
          Left = 88
          Top = 29
          Width = 920
          Height = 21
          Text = ''
          Enabled = False
          TabOrder = 1
        end
        object edt_contact_no: TRzEdit
          Left = 88
          Top = 56
          Width = 920
          Height = 21
          Text = ''
          Enabled = False
          TabOrder = 2
        end
      end
      object grd_trans: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 1014
        Height = 366
        Cursor = crDefault
        Align = alClient
        ColCount = 7
        DrawingStyle = gdsClassic
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnClick = grd_transClick
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
          'Qty'
          'Unit'
          'Description'
          'Unit Price'
          'Discount %'
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
        ShowDesignHelper = False
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.HeaderColor = 16579058
        SortSettings.HeaderColorTo = 16579058
        SortSettings.HeaderMirrorColor = 16380385
        SortSettings.HeaderMirrorColorTo = 16182488
        Version = '7.2.0.0'
        ColWidths = (
          21
          66
          66
          464
          125
          121
          146)
      end
    end
    object btn_close: TRzBitBtn
      Left = 858
      Top = 613
      Width = 160
      Height = 55
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      OnClick = btn_closeClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000630B0000630B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8B46C6C6CE8
        E8E8E8E8B46C6C6CE8E8E8E2DFDFDFE8E8E8E8E8E2DFDFDFE8E8E8B49090906C
        E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8E8B4909090
        6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8E8E8B49090
        906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8E8E8B490
        909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8E8E8B4
        9090906CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8B490
        909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8B49090
        906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8B4909090
        6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8B49090906C
        E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8B4B4B4B4E8
        E8E8E8E8B4B4B4B4E8E8E8E2E2E2E2E8E8E8E8E8E2E2E2E2E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object cmb_price_level: TRzComboBox
      Left = 949
      Top = 143
      Width = 66
      Height = 41
      Style = csDropDownList
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
      Text = '1'
      OnChange = cmb_price_levelChange
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
      ItemIndex = 0
    end
    object edt_barcode: TRzEdit
      Left = 286
      Top = 143
      Width = 661
      Height = 41
      Text = ''
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      OnKeyDown = edt_barcodeKeyDown
      OnKeyUp = edt_barcodeKeyUp
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
    Left = 632
    Top = 672
  end
  object ActionList1: TActionList
    Left = 664
    Top = 672
    object barcode: TAction
      Caption = 'barcode'
      ShortCut = 112
      OnExecute = barcodeExecute
    end
    object quantity: TAction
      Caption = 'quantity'
      ShortCut = 113
      OnExecute = quantityExecute
    end
    object ChangeItem: TAction
      Caption = 'Change Item'
      ShortCut = 114
      OnExecute = ChangeItemExecute
    end
    object pricelevel: TAction
      Caption = 'pricelevel'
      ShortCut = 115
      OnExecute = pricelevelExecute
    end
    object salesreturn: TAction
      Caption = 'salesreturn'
      ShortCut = 116
      OnExecute = salesreturnExecute
    end
    object priceupdate: TAction
      Caption = 'priceupdate'
      ShortCut = 117
      OnExecute = priceupdateExecute
    end
    object discount: TAction
      Caption = 'discount'
      ShortCut = 118
      OnExecute = discountExecute
    end
    object findcus: TAction
      Caption = 'findcus'
      ShortCut = 119
      OnExecute = findcusExecute
    end
    object closefrm: TAction
      Caption = 'canceltransactionfrm'
      ShortCut = 27
      OnExecute = closefrmExecute
    end
    object canceltrans: TAction
      ShortCut = 16451
      OnExecute = canceltransExecute
    end
    object del: TAction
      Caption = 'del'
      ShortCut = 46
      OnExecute = delExecute
    end
    object Enterbarcode: TAction
      Caption = 'Enterbarcode'
      ShortCut = 13
      OnExecute = EnterbarcodeExecute
    end
    object pay: TAction
      Caption = 'pay'
      ShortCut = 32
      OnExecute = payExecute
    end
    object focusbarcode: TAction
      Caption = 'focusbarcode'
      ShortCut = 16454
      OnExecute = focusbarcodeExecute
    end
  end
end
