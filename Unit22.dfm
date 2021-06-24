object Form22: TForm22
  Left = 0
  Top = 0
  Caption = 'CURRENTLY VIEWING GRAPHS'
  ClientHeight = 578
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 578
    Align = alClient
    TabOrder = 2
    object GridPanel3: TGridPanel
      Left = 1
      Top = 1
      Width = 765
      Height = 576
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = DBChart3
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      object DBChart3: TDBChart
        Left = 1
        Top = 1
        Width = 763
        Height = 574
        Title.Text.Strings = (
          'TDBChart')
        View3D = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        DesignSize = (
          763
          574)
        object Label4: TLabel
          Left = 610
          Top = 545
          Width = 134
          Height = 13
          Anchors = []
          Caption = 'Developed by GinTEC -2018'
        end
        object Series3: TPieSeries
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = True
          Gradient.Direction = gdRadial
          OtherSlice.Legend.Visible = False
          PieValues.Name = 'Pie'
          PieValues.Order = loNone
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 578
    Align = alClient
    TabOrder = 1
    object GridPanel2: TGridPanel
      Left = 1
      Top = 1
      Width = 765
      Height = 576
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = DBChart1
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      object DBChart1: TDBChart
        Left = 1
        Top = 1
        Width = 763
        Height = 574
        Title.Text.Strings = (
          'Total Daily Sales For this Month')
        View3D = False
        Align = alClient
        TabOrder = 0
        DesignSize = (
          763
          574)
        ColorPaletteIndex = 15
        object Label1: TLabel
          Left = 626
          Top = 553
          Width = 134
          Height = 13
          Anchors = []
          Caption = 'Developed by GinTEC -2018'
        end
        object Series1: TBarSeries
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Shadow.Color = 8487297
          Marks.Symbol.Transparency = 9
          Marks.Visible = True
          DataSource = reportPage.ADOQuery1
          XLabelsSource = 'TransactionDate'
          Gradient.Direction = gdTopBottom
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Order = loNone
          XValues.ValueSource = 'TransactionDate'
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'TotalSales'
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 578
    Align = alClient
    TabOrder = 0
    object GridPanel1: TGridPanel
      Left = 1
      Top = 1
      Width = 765
      Height = 576
      Align = alClient
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = DBChart2
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      object DBChart2: TDBChart
        Left = 1
        Top = 1
        Width = 763
        Height = 574
        Title.Text.Strings = (
          
            'GRAPH SHOWING THE PERCENTAGE OF SALES THAT BELONG TO THE CORRESP' +
            'ONDING FOOD PRODUCTS')
        View3D = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        DesignSize = (
          763
          574)
        ColorPaletteIndex = 10
        object Label2: TLabel
          Left = 610
          Top = 545
          Width = 134
          Height = 13
          Anchors = []
          Caption = 'Developed by GinTEC -2018'
        end
        object Series2: TPieSeries
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = True
          DataSource = reportPage.ADOQuery2
          XLabelsSource = 'StockName'
          Circled = True
          Gradient.Direction = gdRadial
          MultiPie = mpDisabled
          OtherSlice.Legend.Visible = False
          PieValues.Name = 'Pie'
          PieValues.Order = loNone
          PieValues.ValueSource = 'ProductSales'
        end
      end
    end
  end
end
