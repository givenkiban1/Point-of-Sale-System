object Form14: TForm14
  Left = 0
  Top = 0
  Caption = 'TENDER OPTIONS'
  ClientHeight = 497
  ClientWidth = 866
  Color = clBtnFace
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 497
    Align = alClient
    TabOrder = 2
    object Label13: TLabel
      Left = 144
      Top = 202
      Width = 86
      Height = 13
      Caption = 'Account Number :'
    end
    object Label14: TLabel
      Left = 144
      Top = 248
      Width = 94
      Height = 13
      Caption = 'Account Pass code:'
    end
    object Label15: TLabel
      Left = 583
      Top = 245
      Width = 6
      Height = 13
      Caption = '*'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 583
      Top = 199
      Width = 6
      Height = 13
      Caption = '*'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Button2: TButton
      Left = 152
      Top = 352
      Width = 193
      Height = 36
      Caption = 'Change Tender Option'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button6: TButton
      Left = 376
      Top = 352
      Width = 193
      Height = 36
      Caption = 'NEXT'
      TabOrder = 1
      OnClick = Button6Click
    end
    object Panel13: TPanel
      Left = 159
      Top = 73
      Width = 401
      Height = 57
      Caption = 'CUSTOMER MEMBERSHIP CARD'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clAqua
      Font.Height = -27
      Font.Name = 'Zadoka'
      Font.Style = [fsBold, fsItalic]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
    object Edit7: TEdit
      Left = 256
      Top = 199
      Width = 321
      Height = 21
      MaxLength = 13
      NumbersOnly = True
      TabOrder = 3
      TextHint = 'Account Number'
    end
    object Edit8: TEdit
      Left = 256
      Top = 245
      Width = 321
      Height = 21
      TabOrder = 4
      TextHint = 'Account Password'
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 497
    Align = alClient
    TabOrder = 4
    object RichEdit1: TRichEdit
      Left = 20
      Top = 22
      Width = 416
      Height = 459
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Panel23: TPanel
      Left = 465
      Top = 166
      Width = 384
      Height = 95
      Caption = 'Thank you for shopping at our store'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Zadoka'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel22: TPanel
      Left = 447
      Top = 21
      Width = 407
      Height = 456
      TabOrder = 2
      object Panel14: TPanel
        Left = 6
        Top = 65
        Width = 185
        Height = 41
        Caption = 'Amount Due : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Panel19: TPanel
        Left = 215
        Top = 65
        Width = 185
        Height = 41
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object Edit11: TEdit
        Left = 215
        Top = 127
        Width = 185
        Height = 42
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -28
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TextHint = '000000000000'
        OnChange = Edit11Change
        OnKeyPress = Edit11KeyPress
      end
      object Panel16: TPanel
        Left = 6
        Top = 128
        Width = 185
        Height = 41
        Caption = 'Amount Paid : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object Panel17: TPanel
        Left = 6
        Top = 191
        Width = 185
        Height = 41
        Caption = 'Payment Method :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object Panel20: TPanel
        Left = 215
        Top = 191
        Width = 185
        Height = 41
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object Panel21: TPanel
        Left = 215
        Top = 257
        Width = 185
        Height = 41
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object Button9: TButton
        Left = 215
        Top = 319
        Width = 185
        Height = 43
        Caption = 'Make Payment'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = Button9Click
      end
      object Button4: TButton
        Left = 6
        Top = 319
        Width = 185
        Height = 43
        Caption = 'Cancel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = Button4Click
      end
      object Panel18: TPanel
        Left = 6
        Top = 257
        Width = 185
        Height = 41
        Caption = 'Change : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Zadoka'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 497
    Align = alClient
    TabOrder = 3
    object Label17: TLabel
      Left = 144
      Top = 202
      Width = 87
      Height = 13
      Caption = 'Reference Name :'
    end
    object Label18: TLabel
      Left = 583
      Top = 199
      Width = 6
      Height = 13
      Caption = '*'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label19: TLabel
      Left = 583
      Top = 245
      Width = 6
      Height = 13
      Caption = '*'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label20: TLabel
      Left = 144
      Top = 248
      Width = 61
      Height = 13
      Caption = 'Coupon ID : '
    end
    object Panel15: TPanel
      Left = 168
      Top = 80
      Width = 401
      Height = 57
      Caption = 'COUPON'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = 76437439
      Font.Height = -27
      Font.Name = 'Zadoka'
      Font.Style = [fsBold, fsItalic]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Edit9: TEdit
      Left = 256
      Top = 199
      Width = 321
      Height = 21
      MaxLength = 13
      NumbersOnly = True
      TabOrder = 1
      TextHint = 'Reference Name'
    end
    object Edit10: TEdit
      Left = 256
      Top = 245
      Width = 321
      Height = 21
      TabOrder = 2
    end
    object Button3: TButton
      Left = 152
      Top = 352
      Width = 193
      Height = 36
      Caption = 'Change Tender Option'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button7: TButton
      Left = 376
      Top = 352
      Width = 193
      Height = 36
      Caption = 'NEXT'
      TabOrder = 4
    end
    object Button8: TButton
      Left = 595
      Top = 243
      Width = 75
      Height = 25
      Caption = 'Insert Multiple'
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 497
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 519
      Top = 171
      Width = 6
      Height = 13
      Caption = '*'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 519
      Top = 199
      Width = 6
      Height = 13
      Caption = '*'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 519
      Top = 226
      Width = 6
      Height = 13
      Caption = '*'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 519
      Top = 280
      Width = 12
      Height = 13
      Caption = '**'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 519
      Top = 310
      Width = 12
      Height = 13
      Caption = '**'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 80
      Top = 175
      Width = 87
      Height = 14
      Caption = 'Reference Name :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Label6'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 80
      Top = 202
      Width = 86
      Height = 13
      Caption = 'Account Number :'
    end
    object Label8: TLabel
      Left = 80
      Top = 229
      Width = 95
      Height = 13
      Caption = 'Account Password :'
    end
    object Label9: TLabel
      Left = 80
      Top = 283
      Width = 73
      Height = 13
      Caption = 'Email Address :'
    end
    object Label10: TLabel
      Left = 80
      Top = 310
      Width = 97
      Height = 13
      Caption = 'Telephone Number :'
    end
    object Label11: TLabel
      Left = 80
      Top = 256
      Width = 58
      Height = 13
      Caption = 'ID Number :'
    end
    object Label12: TLabel
      Left = 519
      Top = 253
      Width = 6
      Height = 13
      Caption = '*'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Button1: TButton
      Left = 96
      Top = 352
      Width = 193
      Height = 36
      Caption = 'Change Tender Option'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 192
      Top = 172
      Width = 321
      Height = 21
      TabOrder = 1
      TextHint = 'Reference Name'
    end
    object Edit2: TEdit
      Left = 192
      Top = 199
      Width = 321
      Height = 21
      MaxLength = 13
      NumbersOnly = True
      TabOrder = 2
      TextHint = 'Account Number'
    end
    object Edit3: TEdit
      Left = 192
      Top = 226
      Width = 321
      Height = 21
      TabOrder = 3
      TextHint = 'Account Password'
    end
    object Edit4: TEdit
      Left = 192
      Top = 280
      Width = 321
      Height = 21
      TabOrder = 4
      TextHint = 'Email Adress'
    end
    object GroupBox1: TGroupBox
      Left = 575
      Top = 124
      Width = 185
      Height = 285
      Caption = 'SELECT TYPE OF CREDIT CARD'
      TabOrder = 5
      object Image2: TImage
        Left = 56
        Top = 25
        Width = 65
        Height = 53
      end
      object Image3: TImage
        Left = 56
        Top = 84
        Width = 65
        Height = 53
      end
      object Image4: TImage
        Left = 56
        Top = 143
        Width = 65
        Height = 53
      end
      object Image5: TImage
        Left = 56
        Top = 202
        Width = 65
        Height = 53
      end
    end
    object Edit5: TEdit
      Left = 192
      Top = 307
      Width = 321
      Height = 21
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 6
      TextHint = 'Telephone Number, ie. 01234567890'
    end
    object Edit6: TEdit
      Left = 192
      Top = 253
      Width = 321
      Height = 21
      MaxLength = 13
      NumbersOnly = True
      TabOrder = 7
      TextHint = 'South African ID Number'
    end
    object Button5: TButton
      Left = 320
      Top = 352
      Width = 193
      Height = 36
      Caption = 'NEXT'
      TabOrder = 8
    end
    object Panel12: TPanel
      Left = 130
      Top = 64
      Width = 401
      Height = 57
      Caption = 'CREDIT CARD PAYMENT'
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Zadoka'
      Font.Style = [fsBold, fsItalic]
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 497
    Align = alClient
    TabOrder = 0
    DesignSize = (
      866
      497)
    object Label21: TLabel
      Left = 715
      Top = 468
      Width = 134
      Height = 13
      Anchors = []
      Caption = 'Developed by GinTEC -2018'
      ExplicitLeft = 635
    end
    object Panel7: TPanel
      Left = 176
      Top = 136
      Width = 401
      Height = 57
      Cursor = crNo
      Hint = 'OPTION COMING SOON'
      Caption = 'CREDIT CARD'
      Color = clSilver
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Zadoka'
      Font.Style = [fsBold, fsItalic]
      ParentBackground = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Panel7Click
    end
    object Panel8: TPanel
      Left = 176
      Top = 208
      Width = 401
      Height = 57
      Cursor = crHandPoint
      Caption = 'CUSTOMER MEMBERSHIP CARD'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clAqua
      Font.Height = -27
      Font.Name = 'Zadoka'
      Font.Style = [fsBold, fsItalic]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = Panel8Click
    end
    object Panel11: TPanel
      Left = 40
      Top = 80
      Width = 513
      Height = 41
      BevelOuter = bvNone
      Caption = 'How would you like to settle your fee ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Springdale'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Panel10: TPanel
      Left = 176
      Top = 352
      Width = 401
      Height = 57
      Cursor = crNo
      Hint = 'OPTION COMING SOON'
      Caption = 'COUPON'
      Color = clGray
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 76437439
      Font.Height = -27
      Font.Name = 'Zadoka'
      Font.Style = [fsBold, fsItalic]
      ParentBackground = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Panel10Click
    end
    object Panel9: TPanel
      Left = 176
      Top = 280
      Width = 401
      Height = 57
      Cursor = crHandPoint
      Caption = 'CASH'
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = 23893
      Font.Height = -27
      Font.Name = 'Zadoka'
      Font.Style = [fsBold, fsItalic]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnClick = Panel9Click
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 864
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = 'TENDERING OPTIONS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = 'Takion'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
      object Image1: TImage
        Left = 0
        Top = 0
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
        OnClick = Image1Click
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 384
    Top = 256
  end
end
