unit Unit21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Chart, TeEngine, ExtCtrls, TeeProcs, DBChart, DB, ADODB, Grids,
  DBGrids, pngimage, dbConn_u, Series, StdCtrls, UserAcc;

type
  TreportPage = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Image1: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    Label1: TLabel;
    DBGrid3: TDBGrid;
    DataSource2: TDataSource;
    DBGrid4: TDBGrid;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    lblMalesandFemales: TLabel;
    Label6: TLabel;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    Button3: TButton;
    Label7: TLabel;
    ADOQuery4: TADOQuery;
    DBChart2: TDBChart;
    Series1: TPieSeries;
    ADOQuery5: TADOQuery;
    lblExpenditure: TLabel;
    lblTotalSales: TLabel;
    lblTotalDaily: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DBChart2ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Account : TAccount;
    procedure displayAll ;
  end;

var
  reportPage: TreportPage;

implementation
uses unit22, Unit17;
{$R *.dfm}

procedure TreportPage.Button1Click(Sender: TObject);
begin
unit22.form22.Panel2.BringToFront;
unit22.Form22.Show;
unit22.form22.Position := poScreenCenter;
unit22.Form22.WindowState := wsNormal;
end;

procedure TreportPage.Button2Click(Sender: TObject);
begin
unit22.form22.Panel1.BringToFront;
unit22.Form22.Show;
unit22.form22.Position := poScreenCenter;
unit22.Form22.WindowState := wsNormal;
end;

procedure TreportPage.Button3Click(Sender: TObject);
begin
unit22.form22.Panel3.BringToFront;
unit22.Form22.Show;
unit22.form22.Position := poScreenCenter;
unit22.Form22.WindowState := wsNormal;
end;

procedure TreportPage.DBChart2ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ShowMessage( IntToStr( Series1.CalcClickedPie(x ,y) ) );
end;

procedure TreportPage.displayAll;
var x : real;
begin

ADOQuery1.Close;
ADOQuery1.SQL.Text := 'SELECT SUM(TotalAMount) as [TotalSales], TransactionDate from tblSales '+
'Group by TransactionDate having Month(TransactionDate) = Month(Now())';
ADOQuery1.Open;

x:=0;
ADOQuery1.First;
while not ADOQuery1.Eof do
  begin
    x := x + ADOQuery1['TotalSales'];
    ADOQuery1.Next;
  end;
lblTotalDaily.Caption := 'Total Sales : ' + FloatToStrF(x, ffCurrency, 7, 2);

ADOQuery2.Close;
ADOQuery2.SQL.Text := 'Select  b.StockName,SUM(a.productCost) as [ProductSales] from tblReceipts as a, tblStock as b '+
'where Int(a.StockID) = b.StockID group by b.StockName';
ADOQuery2.Open;

x:=0;
ADOQuery2.First;
while not ADOQuery2.Eof do
  begin
    x := x + ADOQuery2['ProductSales'];
    ADOQuery2.Next;
  end;
lblTotalSales.Caption := 'Total Sales : ' + FloatToStrF(x, ffCurrency, 7, 2);

ADOQuery3.close;
ADOQuery3.SQL.Text := 'SELECT SUM(Amount) AS TOTAL_PAYMENTS, Type from tblTransactions Where Month(DateOfTrans) = Month(Now()) Group by Type';
ADOQuery3.Open;

x:=0;
ADOQuery3.First;
while not ADOQuery3.Eof do
  begin
    x := x + ADOQuery3['TOTAL_PAYMENTS'];
    ADOQuery3.Next;
  end;
lblExpenditure.Caption := 'Total Sales : ' + FloatToStrF(x, ffCurrency, 7, 2);

//structure dbgrid

DBGrid4.Columns[0].Width := 195;
DBGrid4.Columns[1].Width := 200;

DBGrid1.Columns[0].Width := 250;
DBGrid1.Columns[1].Width := 145;

DBGrid3.Columns[0].Width := 250;
DBGrid3.Columns[1].Width := 145;

ADOQuery4.Close;
ADOQuery5.SQL.Text := 'SELECT Gender, Count(Gender) as [Num] from tblCustomers'+
' GROUP BY Gender';
ADOQuery5.Open;

lblMalesandFemales.Caption :='Number of Customers of Different Genders : ';

if ADOQuery5.RecordCount>0 then
  begin       //add special prices too, remember//Manage customers form lastly//how should orders be paid 4? well, after admin places order, they only get ordered items when they pay for it. this is also where they can cancel the order if they like.
    ADOQuery5.First;
    while not ADOQuery5.Eof do
      begin
        lblMalesandFemales.Caption := lblMalesandFemales.Caption+ IntToStr(ADOQuery5['Num']) + ' '+ADOQuery5['Gender']+'s ; ';
        ADOQuery5.Next;
      end;
  end;

ADOQuery5.Close;

//display grid
ADOQuery4.Close;
ADOQuery4.SQL.Text := 'SELECT IIf(CustomerID <> "None", "REGISTERED", "NOT REGISTERED") AS [REGGED], COUNT( [REGGED]) AS [XX] from '+
' tblSales GROUP BY IIf(CustomerID <> "None",  "REGISTERED", "NOT REGISTERED")';
ADOQuery4.Open;

with DBChart2 do
  begin
    Width := 499;
    Height := 209;
    Title.Text.Text :=
      'No of Sales made by Customer Membership VS Unregistered';
    View3DOptions.Elevation := 315;
    View3DOptions.Orthogonal := False;
    View3DOptions.Perspective := 0;
    View3DOptions.Rotation := 360;
    TabOrder := 0;

    with Series1 do
      begin
        Active := False;
        Marks.Callout.Brush.Color := clBlack;
        Marks.Callout.Arrow.Visible := True;
        Marks.Callout.ArrowHead := ahSolid ;
        Marks.Callout.Distance := -35;
        Marks.Visible := True;
        XLabelsSource := 'REGGED';
        Circled := True ;
        CustomXRadius := 60 ;
        CustomYRadius := 60 ;
        DataSource := ADOQuery4;
        OtherSlice.Legend.Visible := False ;
        PieValues.Name := 'Pie';
        PieValues.Order := loNone ;
        PieValues.ValueSource := 'XX';
        Active := True;
      end

end
end;

procedure TreportPage.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TreportPage.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := false;
Image1Click(self);
end;

procedure TreportPage.FormCreate(Sender: TObject);
begin
Position := poScreenCenter;

ADOConnection1.Connected := False;
ADOConnection1.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
      ExtractFilePath(ParamStr(0))+'dataSources\db\umbiloplaza.mdb'+
      ';Persist Security Info=False';
ADOConnection1.Connected := True;

displayAll;
end;

procedure TreportPage.FormShow(Sender: TObject);
begin
displayAll;
end;

procedure TreportPage.Image1Click(Sender: TObject);
begin
unit17.Form15.show;
self.Hide;
end;

end.
