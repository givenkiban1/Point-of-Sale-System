object Form27: TForm27
  Left = 0
  Top = 0
  Caption = 'MANAGE STOCK >> EDIT/ADD STOCK'
  ClientHeight = 585
  ClientWidth = 860
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
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 512
    Top = 120
    Width = 289
    Height = 249
    Center = True
    Proportional = True
  end
  object Label1: TLabel
    Left = 40
    Top = 123
    Width = 89
    Height = 13
    Caption = 'PRODUCT NAME : '
  end
  object Label2: TLabel
    Left = 40
    Top = 262
    Width = 64
    Height = 13
    Caption = 'UNIT COST : '
  end
  object Label4: TLabel
    Left = 40
    Top = 327
    Width = 64
    Height = 13
    Caption = 'CATEGORY : '
  end
  object Label5: TLabel
    Left = 40
    Top = 394
    Width = 64
    Height = 13
    Caption = 'SUPPLIER ID '
  end
  object Label3: TLabel
    Left = 40
    Top = 192
    Width = 81
    Height = 13
    Caption = 'STOCK COUNT : '
  end
  object Label19: TLabel
    Left = 584
    Top = 443
    Width = 249
    Height = 52
    Cursor = crHandPoint
    Caption = 
      'Hey, would you like to Add new stock? If yes, then is the New st' +
      'ock arriving from new  Supplier? If you have said 2 yes'#39' then  I' +
      ' advise you to firstly create that vendors account.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'MANAGE STOCK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Takion'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
  end
  object edtProductName: TEdit
    Left = 224
    Top = 120
    Width = 209
    Height = 21
    TabOrder = 1
    TextHint = 'ENTER NAME OF PRODUCT'
  end
  object edtUCost: TEdit
    Left = 224
    Top = 259
    Width = 209
    Height = 21
    TabOrder = 2
    TextHint = 'ENTER COST PER EACH OF THIS ITEM'
    OnKeyDown = edtUCostKeyDown
    OnKeyPress = edtUCostKeyPress
  end
  object cmbCategory: TComboBox
    Left = 224
    Top = 324
    Width = 209
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    TextHint = 'PICK STOCK CATEGORY'
    Items.Strings = (
      'Beverage'
      'Snack'
      'Extras'
      'Spices'
      'Dairy'
      'Food'
      'Fruits and Vegetables')
  end
  object cmbSupplierID: TComboBox
    Left = 224
    Top = 391
    Width = 209
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    TextHint = 'SELECT WHICH SUPPLIER THIS PRODUCT IS FROM'
    OnChange = cmbSupplierIDChange
  end
  object sedStockCount: TSpinEdit
    Left = 224
    Top = 189
    Width = 209
    Height = 22
    Enabled = False
    MaxValue = 0
    MinValue = 0
    ReadOnly = True
    TabOrder = 5
    Value = 0
  end
  object Button1: TButton
    Left = 512
    Top = 385
    Width = 137
    Height = 52
    Caption = 'UPLOAD PICTURE'
    TabOrder = 6
    OnClick = Button1Click
  end
  object ComboBox3: TComboBox
    Left = 655
    Top = 391
    Width = 146
    Height = 21
    Style = csDropDownList
    TabOrder = 7
    TextHint = 'TYPE OF UPLOAD'
    Items.Strings = (
      'DEFAULT IMAGES'
      'MY OWN COMPUTER')
  end
  object Button2: TButton
    Left = 344
    Top = 481
    Width = 193
    Height = 72
    Caption = 'UPDATE/CREATE STOCK'
    TabOrder = 8
    OnClick = Button2Click
  end
  object edtSuppExtra: TEdit
    Left = 224
    Top = 424
    Width = 209
    Height = 21
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 9
    TextHint = 'COMPANY OF SUPPLIER'
  end
  object Button3: TButton
    Left = 120
    Top = 481
    Width = 193
    Height = 72
    Caption = 'CANCEL'
    TabOrder = 10
    OnClick = Button3Click
  end
  object CheckBox1: TCheckBox
    Left = 656
    Top = 416
    Width = 145
    Height = 17
    Cursor = crNo
    Hint = 'OPTION COMING SOON'
    Caption = 'Add to existing image(s)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 608
    Top = 504
  end
  object ADOTable1: TADOTable
    Connection = DataModule1.dbProvider
    Left = 264
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.dbProvider
    Parameters = <>
    Left = 336
    Top = 80
  end
end
