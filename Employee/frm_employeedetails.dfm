object frm_employee_details: Tfrm_employee_details
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Employee Details'
  ClientHeight = 518
  ClientWidth = 720
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
    Top = 477
    Width = 720
    Height = 41
    Align = alBottom
    GradientColorStyle = gcsMSOffice
    TabOrder = 0
    VisualStyle = vsGradient
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 477
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
      Width = 181
      Height = 19
      Caption = 'Employee Information'
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
      Top = 56
      Width = 54
      Height = 13
      Caption = 'Last Name:'
      Transparent = True
    end
    object RzLabel3: TRzLabel
      Left = 8
      Top = 83
      Width = 43
      Height = 13
      Caption = 'Address:'
      Transparent = True
    end
    object RzLabel4: TRzLabel
      Left = 8
      Top = 110
      Width = 64
      Height = 13
      Caption = 'Home Phone:'
      Transparent = True
    end
    object RzLabel5: TRzLabel
      Left = 8
      Top = 137
      Width = 70
      Height = 13
      Caption = 'Email Address:'
      Transparent = True
    end
    object RzLabel6: TRzLabel
      Left = 8
      Top = 164
      Width = 48
      Height = 13
      Caption = 'Birthdate:'
      Transparent = True
    end
    object RzLabel7: TRzLabel
      Left = 321
      Top = 56
      Width = 55
      Height = 13
      Caption = 'First Name:'
      Transparent = True
    end
    object RzLabel8: TRzLabel
      Left = 359
      Top = 110
      Width = 82
      Height = 13
      Caption = 'Alternate Phone:'
      Transparent = True
    end
    object RzLabel9: TRzLabel
      Left = 400
      Top = 137
      Width = 62
      Height = 13
      Caption = 'SSS Number:'
      Transparent = True
    end
    object RzLabel10: TRzLabel
      Left = 308
      Top = 164
      Width = 39
      Height = 13
      Caption = 'Gender:'
      Transparent = True
    end
    object RzLabel11: TRzLabel
      Left = 620
      Top = 56
      Width = 24
      Height = 13
      Caption = 'M.I.:'
      Transparent = True
    end
    object RzLabel12: TRzLabel
      Left = 8
      Top = 191
      Width = 130
      Height = 19
      Caption = 'Job Information'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel13: TRzLabel
      Left = 8
      Top = 232
      Width = 90
      Height = 13
      Caption = 'Employee Number:'
      Transparent = True
    end
    object RzLabel15: TRzLabel
      Left = 8
      Top = 262
      Width = 72
      Height = 13
      Caption = 'Work Location:'
      Transparent = True
    end
    object RzLabel16: TRzLabel
      Left = 8
      Top = 289
      Width = 62
      Height = 13
      Caption = 'Work Phone:'
      Transparent = True
    end
    object RzLabel18: TRzLabel
      Left = 363
      Top = 232
      Width = 24
      Height = 13
      Caption = 'Title:'
      Transparent = True
    end
    object RzLabel20: TRzLabel
      Left = 365
      Top = 262
      Width = 70
      Height = 13
      Caption = 'Email Address:'
      Transparent = True
    end
    object RzLabel21: TRzLabel
      Left = 365
      Top = 289
      Width = 51
      Height = 13
      Caption = 'Cellphone:'
      Transparent = True
    end
    object RzLabel14: TRzLabel
      Left = 8
      Top = 328
      Width = 168
      Height = 19
      Caption = 'Security Information'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RzLabel19: TRzLabel
      Left = 8
      Top = 368
      Width = 50
      Height = 13
      Caption = 'Password:'
      Transparent = True
    end
    object RzLabel22: TRzLabel
      Left = 8
      Top = 395
      Width = 90
      Height = 13
      Caption = 'Confirm Password:'
      Transparent = True
    end
    object edt_lname: TRzEdit
      Left = 92
      Top = 53
      Width = 223
      Height = 21
      Text = ''
      TabOrder = 0
    end
    object edt_address: TRzEdit
      Left = 92
      Top = 80
      Width = 621
      Height = 21
      Text = ''
      TabOrder = 3
    end
    object edt_tel_home: TRzEdit
      Left = 92
      Top = 107
      Width = 261
      Height = 21
      Text = ''
      TabOrder = 4
    end
    object edt_eadd: TRzEdit
      Left = 92
      Top = 134
      Width = 293
      Height = 21
      Text = ''
      TabOrder = 6
    end
    object dtp_birthdate: TRzDateTimePicker
      Left = 92
      Top = 161
      Width = 210
      Height = 21
      Date = 40983.062183333340000000
      Format = ''
      Time = 40983.062183333340000000
      TabOrder = 8
    end
    object edt_fname: TRzEdit
      Left = 382
      Top = 53
      Width = 232
      Height = 21
      Text = ''
      TabOrder = 1
    end
    object edt_tel_alt: TRzEdit
      Left = 447
      Top = 107
      Width = 266
      Height = 21
      Text = ''
      TabOrder = 5
    end
    object edt_sss_num: TRzEdit
      Left = 468
      Top = 134
      Width = 245
      Height = 21
      Text = ''
      TabOrder = 7
    end
    object cmb_gender: TRzComboBox
      Left = 353
      Top = 161
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 9
      Items.Strings = (
        '-Select Gender-'
        'M'
        'F')
    end
    object edt_id: TRzEdit
      Left = 104
      Top = 229
      Width = 253
      Height = 21
      Text = ''
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 10
    end
    object edt_work_loc: TRzEdit
      Left = 104
      Top = 259
      Width = 253
      Height = 21
      Text = ''
      TabOrder = 12
    end
    object edt_tel_work: TRzEdit
      Left = 104
      Top = 286
      Width = 253
      Height = 21
      Text = ''
      TabOrder = 14
    end
    object cmb_position: TRzComboBox
      Left = 450
      Top = 229
      Width = 227
      Height = 21
      Style = csDropDownList
      TabOrder = 11
    end
    object edt_work_eadd: TRzEdit
      Left = 447
      Top = 256
      Width = 266
      Height = 21
      Text = ''
      TabOrder = 13
    end
    object edt_tel_workcel: TRzEdit
      Left = 447
      Top = 283
      Width = 266
      Height = 21
      Text = ''
      TabOrder = 15
    end
    object btn_save: TRzBitBtn
      Left = 521
      Top = 442
      Width = 100
      Height = 35
      Default = True
      Caption = 'Save'
      TabOrder = 18
      OnClick = btn_saveClick
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
    object btn_delete: TRzBitBtn
      Left = 34
      Top = 442
      Width = 100
      Height = 35
      Caption = 'Delete'
      Enabled = False
      TabOrder = 19
      OnClick = btn_deleteClick
    end
    object btn_print: TRzBitBtn
      Left = 134
      Top = 442
      Width = 100
      Height = 35
      Caption = 'Print'
      TabOrder = 20
      OnClick = btn_printClick
    end
    object btn_query: TRzBitBtn
      Left = 0
      Top = 442
      Width = 35
      Height = 35
      TabOrder = 21
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
    object cmb_mi: TRzComboBox
      Left = 648
      Top = 53
      Width = 65
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
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
    object btn_title_att: TRzBitBtn
      Left = 683
      Top = 229
      Width = 30
      Height = 21
      Caption = '...'
      TabOrder = 22
      OnClick = btn_title_attClick
    end
    object edt_password: TRzMaskEdit
      Left = 104
      Top = 360
      Width = 198
      Height = 21
      PasswordChar = '*'
      TabOrder = 16
      Text = ''
    end
    object edt_confirmation: TRzMaskEdit
      Left = 104
      Top = 387
      Width = 198
      Height = 21
      PasswordChar = '*'
      TabOrder = 17
      Text = ''
    end
    object btn_close1: TRzBitBtn
      Left = 620
      Top = 442
      Width = 100
      Height = 35
      Caption = 'Close'
      TabOrder = 23
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
    Top = 480
  end
  object ActionList1: TActionList
    Left = 96
    Top = 472
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
end
