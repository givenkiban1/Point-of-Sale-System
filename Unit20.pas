unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, pngimage, DB,
  ADODB , dbConn_u, UserAcc, frmProducts, unit29;

type
  TForm20 = class(TForm)
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Image2: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    GridPanel3: TGridPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel3: TPanel;
    GridPanel2: TGridPanel;
    BitBtn3: TBitBtn;
    Button5: TButton;
    Label4: TLabel;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable2: TADOTable;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Account : TAccount;
    procedure displayAll;

  end;

var
  Form20: TForm20;

implementation
uses unit17;
{$R *.dfm}

procedure TForm20.BitBtn1Click(Sender: TObject);
begin
//reset
  ComboBox1.ItemIndex := -1;
  ComboBox2.ItemIndex := -1;
  ComboBox3.ItemIndex := -1;
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox1.Text:='';
  ADOTable1.Filtered := False;
  ADOTable1.Filter := '';

  Edit1.Clear;
  displayAll;
end;

procedure TForm20.BitBtn2Click(Sender: TObject);
begin
//search
if (ComboBox2.ItemIndex > -1) and (Edit1.Text<>'') then
    begin
      ADOTable1.Filtered := False;
      ADOTable1.Filter:= ComboBox2.Text + ' LIKE '+ QuotedStr('*'+Edit1.Text+'*');
      ADOTable1.Filtered := True;
    end
else
    ShowMessage('You need to select a field and enter search value ');
end;

procedure TForm20.BitBtn3Click(Sender: TObject);
begin
  displayAll;
end;

procedure TForm20.BitBtn4Click(Sender: TObject);
begin
//sort
if (ComboBox1.ItemIndex > -1) and (ComboBox3.ItemIndex > -1) then
  begin
    //ADOTable1.Filtered := False;
    ADOTable1.Sort := ComboBox1.Text + ' '+ ComboBox3.Text;
    //ADOTable1.Filtered := True;
  end
else ShowMessage('You need to select both a field and an ORDER in order to sort');

end;

procedure TForm20.Button1Click(Sender: TObject);
begin
//WHEN ADMIN IS DELETING STOCK
ADOTable1.Delete;
end;

procedure TForm20.Button2Click(Sender: TObject);
begin
//WHEN ADMIN WANTS TO EDIT STOCK DETAILS
frmProducts.Form27.Panel2.Caption := 'EDIT STOCK';
frmProducts.Form27.stockID := ADOTable1['StockID'];
frmProducts.Form27.showAll;
frmProducts.Form27.Button2.Caption := 'EDIT STOCK';

frmProducts.Form27.Show;
Self.Enabled := False;
end;

procedure TForm20.Button3Click(Sender: TObject);
var x : string;
    n : integer;
    cost : real;
begin
//WHEN ADMIN WANTS TO MAKE AN ORDER 4 STOCK ITEM
x := InputBox('ORDER STOCK','Enter Quantity that you would like to order','');

try
n := StrToInt(x);
except on E: Exception do
begin
  ShowMessage('You need to enter a valid number!');
  exit;
end;
end;

cost := ADOTable1['UnitCost']*n;

//insert into database
ADOTable2.Close;
ADOTable2.TableName := 'tblOrders';
ADOTable2.Open;

ADOTable2.Insert;
ADOTable2['productID'] := (ADOTable1['StockID']);
ADOTable2['Quantity'] := n;
ADOTable2['Cost'] := cost;
ADOTable2['EmployeeID'] := Account.getEmployeeID;
ADOTable2['SupplierID'] := IntToStr(ADOTable1['SupplierID']);

if MessageDlg('You are about to place an order for :'+slinebreak +
'product id = '+ IntToStr(ADOTable1['StockId'])+ sLineBreak+
'Stock Name : '+ ADOTable1['StockName']+slinebreak+
'Quantity Ordered : ' + IntToStr(n)+ sLineBreak+
'COST = '+ FloatToStrF(cost, ffCurrency, 7, 2)+ slinebreak+
'DO YOU WISH TO PROCEED ?', mtConfirmation, [mbYes, mbNo], 0) =6 then
begin
//if user says they confirm that they wanna proceed
//then make it official

ADOTable2.Post;

ShowMessage(
'SUCCESS! ORDER HAS BEEN MADE. ORDER ID IS #' +
IntToStr(ADOTable2['OrderId'])
);

ADOTable2.Close;

end
else
  ShowMessage('No order placed.');

end;

procedure TForm20.Button4Click(Sender: TObject);
begin
//WHEN ADMIN WANTS TO SHOW ALL THE ORDERS MADE FOR THE SELECTED PRODUCT
with unit29.Form29 do
  begin
    item := ADOTable1['StockName'];
    productID:= ADOTable1['StockID'];
    suppID:= -1;
    self.Enabled := False;
    from := self;
    Form29.Show;
  end;
end;

procedure TForm20.Button5Click(Sender: TObject);
begin
//WHEN ADMIN WANTS TO CREATE A NEW STOCK ITEM
frmProducts.Form27.Panel2.Caption := 'CREATE STOCK';
frmProducts.Form27.clearAll;
frmProducts.Form27.Button2.Caption := 'CREATE STOCK';

frmProducts.Form27.Show;
Self.Enabled := False;

end;

procedure TForm20.displayAll;
begin
ADOTable1.Filtered := False;
ADOTable1.Filter := '';

ADOTable1.Close;
ADOTable1.TableName := 'tblStock';
ADOTable1.Open;

DBGrid1.Columns[0].Width:=60;
DBGrid1.Columns[1].Width:=200;
DBGrid1.Columns[2].Width:=60;
DBGrid1.Columns[3].Width:=50;
DBGrid1.Columns[4].Width:=50;
DBGrid1.Columns[5].Width:=200;
DBGrid1.Columns[6].Width:=200;
end;

procedure TForm20.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin

if (NewHeight>=400) and (NewWidth>=800)  then
  Resize := True
else Resize := False;

end;

procedure TForm20.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := False;
Image2Click(Self);
end;

procedure TForm20.FormCreate(Sender: TObject);
var i : integer;
begin
(Sender as TForm).Position:=poScreenCenter;
(Sender as TForm).DefaultMonitor := dmMainForm;
displayAll;

ComboBox2.Items.Clear;
ComboBox1.Items.Clear;

//GETTING THE FIELD NAMES FROM DATABASE AND INSERTING THEM IN COMBOBOX
for i := 0 to (ADOTable1.Fields.Count)-1 do
  begin
    ComboBox2.Items.Add(ADOTable1.Fields[i].FieldName);
    ComboBox1.Items.Add(ADOTable1.Fields[i].FieldName);
  end;
ComboBox2.ItemIndex := -1;
ComboBox1.ItemIndex := -1;
end;

procedure TForm20.FormShow(Sender: TObject);
begin
displayAll;
end;

procedure TForm20.Image2Click(Sender: TObject);
begin
unit17.form15.show;
Self.hide;
end;

end.
