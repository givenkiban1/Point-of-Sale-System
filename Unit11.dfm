object Form11: TForm11
  Left = 0
  Top = 0
  Caption = 'VIEW SALES '
  ClientHeight = 631
  ClientWidth = 1245
  Color = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 0
    Top = 0
    Width = 1245
    Height = 54
    Align = alTop
    Caption = '                       SALES PAGE'
    Color = clLime
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Takion'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 631
  end
  object Label1: TLabel
    Left = 57
    Top = 556
    Width = 83
    Height = 13
    Caption = 'Filter Database : '
  end
  object Image2: TImage
    Left = 24
    Top = 8
    Width = 49
    Height = 41
    Cursor = crHandPoint
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000260000
      002608030000009FE3199C0000000467414D410000B18F0BFC61050000003650
      4C544500000077828C77828C77828C77828C77828C77828C77828C77828C7782
      8C77828C77828C77828C77828C77828C77828C77828C000000DC443D35000000
      1074524E53004080A0C0F03090E010D050602070B016A2AB0E00000009704859
      7300000B1200000B1201D2DD7EFC00000001624B47440088051D480000014B49
      44415478DA8D94D99284200C4583A2A303DAF3FF5F39DDA8206E4D141594B2E0
      C16239DE40089780DFF24C9A2F1785F4A6893B602A617B5FD34504313E16BEB2
      F815372C9F396A4CB42B643E540417DA69BE60BC37E144AA0FA93245F126932E
      C6A9992A851F344919E8459E18529F19AE2DA7B9E5568C65006303F75612C375
      16AB140B531B27FB0D7B91B57B24069C5F50A2D388911728752EA495276D36D4
      8C88510EEFC5A5DCA15D2650A588BB94BF4F134C4C04EAC499BF530045D10E04
      457BF9404152C39BC0DF19334861D40F315BDBF31FA6C0080982EC7C505AB9EB
      4C58AC416C68F77BBD34BB1BCA576C4B9339F133161334F2089109C1F4FE3F5D
      02FC9498DEC8CB8ABCFAC842427CADF79373E54CD6B7B2BC16793D078B3CF6C9
      443EC0D8E76CCD21D13E55CB8B39C45ACD6E5C6AA11D17685C1D0B191744DAE0
      7AE21853DD62872DFA0B4A8DCA436A73F1F90000000049454E44AE426082}
    OnClick = Image2Click
  end
  object Label4: TLabel
    Left = 1090
    Top = 613
    Width = 134
    Height = 13
    Caption = 'Developed by GinTEC -2018'
  end
  object DBGrid1: TDBGrid
    Left = 33
    Top = 169
    Width = 657
    Height = 385
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ComboBox1: TComboBox
    Left = 143
    Top = 553
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    TextHint = 'Sales for Item'
    OnChange = ComboBox1Change
    Items.Strings = (
      'All'
      'receiptID'
      'customerID'
      'EmployeeID'
      'transactionDate')
  end
  object DateTimePicker1: TDateTimePicker
    Left = 143
    Top = 607
    Width = 145
    Height = 21
    CalColors.BackColor = clTeal
    CalColors.TitleTextColor = clSilver
    CalColors.MonthBackColor = clRed
    Date = 43303.000000000000000000
    Time = 43303.000000000000000000
    ParseInput = True
    TabOrder = 2
    OnChange = DateTimePicker1Change
  end
  object Panel1: TPanel
    Left = 33
    Top = 98
    Width = 657
    Height = 41
    Caption = 'YOU ARE CURRENTLY VIEWING ALL SALES'
    Color = clSilver
    ParentBackground = False
    TabOrder = 3
  end
  object ComboBox2: TComboBox
    Left = 143
    Top = 580
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    TextHint = 'For Month or Day or Year'
    Items.Strings = (
      'Day'
      'Month'
      'Year'
      'Both')
  end
  object BitBtn1: TBitBtn
    Left = 401
    Top = 580
    Width = 110
    Height = 49
    Caption = 'RESET'
    DoubleBuffered = True
    Kind = bkRetry
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 294
    Top = 580
    Width = 101
    Height = 49
    Caption = 'SEARCH'
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object Panel2: TPanel
    Left = 728
    Top = 98
    Width = 489
    Height = 41
    Caption = 'RECORD OF ALL SALES FOR TODAY'
    Color = clSilver
    ParentBackground = False
    TabOrder = 7
  end
  object DBGrid2: TDBGrid
    Left = 728
    Top = 169
    Width = 489
    Height = 385
    DataSource = DataSource2
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ComboBox3: TComboBox
    Left = 294
    Top = 553
    Width = 217
    Height = 21
    Style = csDropDownList
    TabOrder = 9
    TextHint = 'Pick 2nd Item to Filter'
    Visible = False
    OnChange = ComboBox1Change
    Items.Strings = (
      'receiptID'
      'customerID'
      'EmployeeID')
  end
  object Panel3: TPanel
    Left = 728
    Top = 566
    Width = 489
    Height = 41
    Caption = 'SUM OF ALL SALES FOR TODAY'
    Color = clSilver
    ParentBackground = False
    TabOrder = 10
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.dbProvider
    Parameters = <>
    Left = 560
    Top = 360
  end
  object ADOQuery2: TADOQuery
    Connection = DataModule1.dbProvider
    Parameters = <>
    Left = 712
    Top = 320
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 560
    Top = 408
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 712
    Top = 272
  end
end
