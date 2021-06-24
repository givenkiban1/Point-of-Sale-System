unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, pngimage,dbConn_u, DB, ADODB, UserAcc;

type
  TForm9 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Image2: TImage;
    Label8: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    DataSource3: TDataSource;
    Label9: TLabel;
    Edit7: TEdit;
    qryWorkAtt: TADOTable;
    qryPayHist: TADOTable;
    qrySales: TADOTable;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function calcTotal( x : TADOTable; xfield : String) : Real;
  public
    { Public declarations }
    Account : TAccount;
    procedure displayData;
  end;

var
  Form9: TForm9;

implementation
Uses dashboard_u;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
//
DataSource1.DataSet := qryWorkAtt;

end;

procedure TForm9.Button2Click(Sender: TObject);
begin
DataSource1.DataSet := ADOQuery1;
end;

function TForm9.calcTotal(x: TADOTable; xfield : String): Real;
var sum : real;
begin
//
sum :=0;
x.First;
while not x.Eof do
  begin
    sum := sum + x[xfield];
    x.Next;
  end;

Result := sum;
end;

procedure TForm9.displayData;
begin
//SHOWING ATTENDANCE HISTORY
DataSource1.DataSet := qryWorkAtt;
qryWorkAtt.Close;
qryWorkAtt.TableName := 'tblAttendance';
qryWorkAtt.Open;

qryWorkAtt.Filtered := False;
qryWorkAtt.Filter := 'EmployeeID = '+ QuotedStr(Account.getEmployeeID);
qryWorkAtt.Filtered := True;

qryWorkAtt.Sort := 'RecordNo DESC';

ADOQuery1.Close;
ADOQuery1.SQL.Text := 'SELECT Distinct DateOfDay , Count(DateOfDay) As [Number Of Times Logged In]'+
' from tblAttendance Where EmployeeId = '+ QuotedStr(Account.getEmployeeID) +
' AND ClockOutTime <> Null GROUP BY DateOfDay;';
ADOQuery1.Open;

panel7.Caption := 'Number of Days Attended Work = '+ IntToStr(ADOQuery1.RecordCount);

//SHOWING PAY HISTORY
qryPayHist.Close;
qryPayHist.TableName := 'tblTransactions';
qryPayHist.Open;

qryPayHist.Filtered := False;
qryPayHist.Filter := 'to = '+ QuotedStr(Account.getEmployeeID);
qryPayHist.Filtered := True;

panel6.Caption := 'TOTAL AMOUNT PAID = '+ FloatToStrF( calcTotal(qryPayHist, 'AMOUNT') , ffCurrency, 7, 2);

//SHOWING SALES MADE BY EMPLOYEE
qrySales.Close;
qrySales.TableName := 'tblSales';
qrySales.Open;

qrySales.Filtered := False;
qrySales.Filter := 'EmployeeID = '+ QuotedStr(Account.getEmployeeID);
qrySales.Filtered := True;

panel8.Caption := 'TOTAL VALUE OF SALES MADE = '+ FloatToStrF( calcTotal(qrySales, 'totalAmount') , ffCurrency, 7, 2);

end;

procedure TForm9.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TForm9.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := False;
Image2Click(self);
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
(Sender as TForm).Position:=poScreenCenter;
(Sender as TForm).DefaultMonitor := dmMainForm;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
ADOQuery1.Close;
ADOQuery1.Open;

qryWorkAtt.Close;
qryWorkAtt.Open;

end;

procedure TForm9.Image2Click(Sender: TObject);
begin
form2.show;
form9.Hide;
end;

end.
