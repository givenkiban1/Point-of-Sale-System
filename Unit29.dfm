object Form29: TForm29
  Left = 0
  Top = 0
  Caption = 'ORDER HISTORY'
  ClientHeight = 574
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCanResize = FormCanResize
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 95
    Width = 692
    Height = 390
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 697
    Height = 81
    Caption = 'CAPTION'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 491
    Width = 708
    Height = 83
    Align = alBottom
    Caption = '&EXIT'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkIgnore
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.dbProvider
    Parameters = <>
    Left = 424
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 264
    Top = 40
  end
end
