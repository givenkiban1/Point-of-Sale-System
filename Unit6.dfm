object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'MANAGE EMPLOYEES'
  ClientHeight = 568
  ClientWidth = 1091
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
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 1091
    Height = 568
    Align = alClient
    Color = clBackground
    ColumnCollection = <
      item
        Value = 25.000000000000000000
      end
      item
        Value = 60.000000000000000000
      end
      item
        Value = 15.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        ColumnSpan = 3
        Control = Panel1
        Row = 0
      end
      item
        Column = 0
        Control = GroupBox1
        Row = 1
      end
      item
        Column = 1
        Control = DBGrid1
        Row = 1
      end
      item
        Column = 2
        Control = Panel2
        Row = 1
      end
      item
        Column = 1
        Control = Panel3
        Row = 2
      end
      item
        Column = 2
        Control = Label4
        Row = 2
      end>
    ParentBackground = False
    RowCollection = <
      item
        Value = 10.000000000000000000
      end
      item
        Value = 80.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end>
    TabOrder = 0
    DesignSize = (
      1091
      568)
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1089
      Height = 56
      Align = alClient
      BevelOuter = bvNone
      Caption = 'MANAGE EMPLOYEES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = 'Takion'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
      object Image2: TImage
        Left = 0
        Top = 0
        Width = 49
        Height = 56
        Cursor = crHandPoint
        Align = alLeft
        Center = True
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
    end
    object GroupBox1: TGroupBox
      Left = 11
      Top = 139
      Width = 252
      Height = 288
      Anchors = []
      Color = clMedGray
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      object Label1: TLabel
        Left = 88
        Top = 86
        Width = 47
        Height = 42
        Caption = 'OR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Tempus Sans ITC'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 48
        Top = 153
        Width = 145
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Puppy'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TextHint = 'Enter Search Value'
      end
      object BitBtn2: TBitBtn
        Left = 164
        Top = 202
        Width = 69
        Height = 49
        Caption = 'SEARCH'
        DoubleBuffered = True
        Kind = bkOK
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn1: TBitBtn
        Left = 12
        Top = 202
        Width = 70
        Height = 49
        Caption = 'RESET'
        DoubleBuffered = True
        Kind = bkRetry
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object ComboBox2: TComboBox
        Left = 48
        Top = 127
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        TextHint = 'SEARCH FIELD'
      end
      object ComboBox1: TComboBox
        Left = 48
        Top = 40
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        TextHint = 'ORDER BY FIELD'
      end
      object ComboBox3: TComboBox
        Left = 48
        Top = 67
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        TextHint = 'ORDER'
        Items.Strings = (
          'ASC'
          'DESC')
      end
      object BitBtn4: TBitBtn
        Left = 88
        Top = 202
        Width = 70
        Height = 49
        Caption = 'SORT'
        DoubleBuffered = True
        Kind = bkYes
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = BitBtn4Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 273
      Top = 57
      Width = 653
      Height = 452
      Align = alClient
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel2: TPanel
      Left = 926
      Top = 57
      Width = 164
      Height = 452
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object GridPanel3: TGridPanel
        Left = 0
        Top = 0
        Width = 164
        Height = 452
        Align = alClient
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 100.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = Button1
            Row = 0
          end
          item
            Column = 0
            Control = Button2
            Row = 1
          end>
        RowCollection = <
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end
          item
            Value = 25.000000000000000000
          end>
        TabOrder = 0
        object Button1: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 158
          Height = 107
          Align = alClient
          Caption = 'DELETE EMPLOYEE'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 3
          Top = 116
          Width = 158
          Height = 107
          Align = alClient
          Caption = 'EDIT EMPLOYEE'
          TabOrder = 1
          OnClick = Button2Click
        end
      end
    end
    object Panel3: TPanel
      Left = 273
      Top = 509
      Width = 653
      Height = 58
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      object GridPanel2: TGridPanel
        Left = 0
        Top = 0
        Width = 653
        Height = 58
        Align = alClient
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 45.000000000000000000
          end
          item
            Value = 10.000000000000000000
          end
          item
            Value = 45.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = BitBtn3
            Row = 0
          end
          item
            Column = 2
            Control = Button5
            Row = 0
          end>
        RowCollection = <
          item
            Value = 100.000000000000000000
          end>
        TabOrder = 0
        object BitBtn3: TBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 287
          Height = 52
          Align = alClient
          Caption = 'REFRESH'
          DoubleBuffered = True
          Kind = bkRetry
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBtn3Click
        end
        object Button5: TButton
          AlignWithMargins = True
          Left = 361
          Top = 3
          Width = 289
          Height = 52
          Align = alClient
          Caption = 'CREATE NEW EMPLOYEE'
          TabOrder = 1
          OnClick = Button5Click
        end
      end
    end
    object Label4: TLabel
      Left = 941
      Top = 531
      Width = 134
      Height = 13
      Anchors = []
      Caption = 'Developed by GinTEC -2018'
      ExplicitLeft = 68
      ExplicitTop = 567
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.dbProvider
    Parameters = <>
    Left = 416
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 464
    Top = 208
  end
end
