unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, unit21, TeEngine, Series, TeeProcs, Chart, DBChart, UserAcc,
  StdCtrls;

type
  TForm22 = class(TForm)
    Panel1: TPanel;
    GridPanel1: TGridPanel;
    Panel2: TPanel;
    GridPanel2: TGridPanel;
    Panel3: TPanel;
    GridPanel3: TGridPanel;
    DBChart2: TDBChart;
    Series2: TPieSeries;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DBChart3: TDBChart;
    Series3: TPieSeries;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure displayDataGRaphs;
  public
    { Public declarations }
    Account : TAccount;
  end;

var
  Form22: TForm22;

implementation

{$R *.dfm}

procedure TForm22.displayDataGRaphs;
begin
with DBChart2.Series[0] do
  begin
    Left := 1;
    Top := 1;
    Width := 763 ;
    Height := 574;
    Title :=
        'GRAPH SHOWING THE PERCENTAGE OF SALES THAT BELONG TO THE CORRESP' +
        'ONDING FOOD PRODUCTS';
    Align := alClient;
    TabOrder := 0;

    with Series2 do
      begin
        Marks.Arrow.Visible := True;
        Marks.Callout.Brush.Color := clBlack;
        Marks.Callout.Arrow.Visible := True;
        Marks.Visible := True ;
        DataSource := reportPage.ADOQuery2;
        XLabelsSource := 'StockName';
        Circled := True ;
        MultiPie := mpDisabled ;
        OtherSlice.Legend.Visible := False ;
        PieValues.Name := 'Pie';
        PieValues.Order := loDescending ;
        PieValues.ValueSource := 'ProductSales';
      end;
  end;

with DBChart3.Series[0] do
  begin
    Left := 1;
    Top := 1;
    Width := 763 ;
    Height := 574;

    Align := alClient;
    TabOrder := 0;

    with Series3 do
      begin
        Title :=
          'Total Amount Spent On Each Transaction Category For this Month';

        Marks.Arrow.Visible := True;
        Marks.Callout.Brush.Color := clBlack;
        Marks.Callout.Arrow.Visible := True;
        Marks.Visible := True ;
        DataSource := reportPage.ADOQuery3;
        XLabelsSource := 'Type';
        Circled := True ;
        MultiPie := mpDisabled ;
        OtherSlice.Legend.Visible := False ;
        PieValues.Name := 'Pie';
        PieValues.Order := loDescending ;
        PieValues.ValueSource := 'TOTAL_PAYMENTS';
      end;
  end;


  with DBChart2.Series[0] do
  begin
    Left := 1;
    Top := 1;
    Width := 763 ;
    Height := 574;
    Title :=
        'GRAPH SHOWING THE PERCENTAGE OF SALES THAT BELONG TO THE CORRESP' +
        'ONDING FOOD PRODUCTS';
    Align := alClient;
    TabOrder := 0;

    with Series2 do
      begin
        Marks.Arrow.Visible := True;
        Marks.Callout.Brush.Color := clBlack;
        Marks.Callout.Arrow.Visible := True;
        Marks.Visible := True ;
        DataSource := reportPage.ADOQuery2;
        XLabelsSource := 'StockName';
        Circled := True ;
        MultiPie := mpDisabled ;
        OtherSlice.Legend.Visible := False ;
        PieValues.Name := 'Pie';
        PieValues.Order := loNone ;
        PieValues.ValueSource := 'ProductSales';
      end;
  end;

end;

procedure TForm22.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := false;
form22.Hide;
end;

procedure TForm22.FormCreate(Sender: TObject);
begin
Panel1.BringToFront;
Position := poScreenCenter;

{CREATE GRAPH}
displayDataGRaphs;
end;

procedure TForm22.FormShow(Sender: TObject);
begin
displayDataGRaphs;
WindowState := wsNormal;
end;

end.
