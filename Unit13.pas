unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, stockitems, pngimage,dbConn_u, ADODB, DB,productDetails,
  StdCtrls;

type
  TForm13 = class(TForm)
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Image1: TImage;
    TabControl1: TTabControl;
    fp1: TFlowPanel;
    fp2: TFlowPanel;
    fp3: TFlowPanel;
    fp4: TFlowPanel;
    fp5: TFlowPanel;
    fp6: TFlowPanel;
    fp0: TFlowPanel;
    Label4: TLabel;
    procedure TabControl1Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function getParent(foodType: String) : TFlowPanel;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;
  arrPanels : array of TPanel;
  arrItems : array of TStockItem;
implementation

uses dashboard_u;

{$R *.dfm}

procedure TForm13.ButtonClick(Sender: TObject);
var p : Tpanel;
    z,x:integer;
    c,cc:string;
    stockItem : TStockItem;
begin

//
form13.Enabled:=false;
p:= (sender as TPanel);

stockItem := arrItems[StrToInt(p.Hint)-1];

//send details
productDetails.Form18.callerID:= self;
productDetails.Form18.location:= stockItem.getImageFile;
productDetails.Form18.getNames;
productDetails.Form18.Panel3.Caption:=UpperCase(stockItem.getStockName); //UpperCase(Copy(p.Caption,x+1, length(p.Caption)-x));
productDetails.Form18.Panel2.Caption:='COST : R'+ FloatToStr(stockItem.getUnitCost);
productDetails.Form18.Panel1.Caption:='BY '+UpperCase(stockItem.getCompany);

if stockItem.getQuantity < 10 then
  begin
    productDetails.Form18.Panel5.ParentBackground := False;
    productDetails.Form18.Panel5.ParentColor := False;
    productDetails.Form18.Panel5.Color := clRed;
  end
else
  begin
    productDetails.Form18.Panel5.Color := clBtnFace;
  end;

productDetails.Form18.Panel5.Caption:='Stock Count : '+IntToStr(stockItem.getQuantity);
productDetails.Form18.Show;
end;

procedure TForm13.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin

if (NewHeight>= 590) and (NewWidth>=860) then
    Resize := True
else Resize := False;

end;

procedure TForm13.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := False;
Image1Click(Self);
end;

procedure TForm13.FormCreate(Sender: TObject);
var x:Integer;
begin
(Sender as TForm).Position:=poScreenCenter;
(Sender as TForm).DefaultMonitor := dmMainForm;

//making sure that the panel that is first seen is that of which has
//been selected on the tab control. ie. if tab 1 is slected
// then panel one should be displayed
(FindComponent('fp'+IntToStr(TabControl1.TabIndex)) as TFlowPanel).BringToFront;

ADOQuery1.Close;
ADOQuery1.SQL.Text:='Select a.stockID,a.UnitCost,a.Quantity, a.StockName, a.Category, a.ImageFile, b.Company, a.SupplierID '+
' from tblStock as a, tblSuppliers as b where a.SupplierID=b.SupplierID ORDER by a.stockID ASC';
ADOQuery1.Open;

ADOQuery1.First;
x:=0;

SetLength(arrPanels,ADOQuery1.RecordCount);
SetLength(arrItems ,ADOQuery1.RecordCount);

while not ADOQuery1.Eof do
  begin

    arrPanels[x]:=TPanel.Create(self);
    arrPanels[x].Parent:=getParent(lowercase(ADOQuery1['Category'])) ;
    arrPanels[x].Caption := ADOQuery1['Company']+'-'+ADOQuery1['StockName'];
    arrPanels[x].Hint:= IntToStr(ADOQuery1['StockID']);    //

    arrItems[x] := TStockItem.Create(IntToStr(ADOQuery1['StockID']) , ADOQuery1['StockName'],
      IntToStr(ADOQuery1['SupplierID']),ADOQuery1['ImageFile'],ADOQuery1['Category'],
      ADOQuery1['Company'],ADOQuery1['Quantity'],ADOQuery1['UnitCost'] );

    with arrPanels[x] do
      begin
        Width := 184;
        Height := 128;
        Margins.Left := 10;
        Margins.Top := 10;
        Margins.Right := 10;
        Margins.Bottom := 10;
        Padding.Left := 20;
        Padding.Top := 10;
        Padding.Right := 10;
        Padding.Bottom := 10;
        cursor := crHandPoint;
      end;
      arrPanels[x].FullRepaint:=True;
      arrPanels[x].ParentBackground:=True;
      arrPanels[x].Visible:=True;
      arrPanels[x].OnClick := buttonClick;
    ADOQuery1.Next;
    x:=x+1;
  end;
  ADOQuery1.Close;
end;

procedure TForm13.FormShow(Sender: TObject);
var x : integer;
begin
for x := 0 to length(arrPanels) - 1 do
      arrPanels[x].Free;
for x := 0 to length(arrItems) - 1 do
      arrItems[x].Free;
TabControl1.TabIndex := 0;
(FindComponent('fp'+IntToStr(TabControl1.TabIndex)) as TFlowPanel).BringToFront;

ADOQuery1.Close;
ADOQuery1.SQL.Text:='Select a.stockID,a.UnitCost,a.Quantity, a.StockName, a.Category, a.ImageFile, b.Company, a.SupplierID '+
' from tblStock as a, tblSuppliers as b where a.SupplierID=b.SupplierID ORDER by a.stockID ASC';
ADOQuery1.Open;

ADOQuery1.First;
x:=0;

SetLength(arrPanels,ADOQuery1.RecordCount);
SetLength(arrItems ,ADOQuery1.RecordCount);

while not ADOQuery1.Eof do
  begin

    arrPanels[x]:=TPanel.Create(self);
    arrPanels[x].Parent:=getParent(lowercase(ADOQuery1['Category'])) ;
    arrPanels[x].Caption := ADOQuery1['Company']+'-'+ADOQuery1['StockName'];
    arrPanels[x].Hint:= IntToStr(ADOQuery1['StockID']);    //

    arrItems[x] := TStockItem.Create(IntToStr(ADOQuery1['StockID']) , ADOQuery1['StockName'],
      IntToStr(ADOQuery1['SupplierID']),ADOQuery1['ImageFile'],ADOQuery1['Category'],
      ADOQuery1['Company'],ADOQuery1['Quantity'],ADOQuery1['UnitCost'] );

    with arrPanels[x] do
      begin
        Width := 184;
        Height := 128;
        Margins.Left := 10;
        Margins.Top := 10;
        Margins.Right := 10;
        Margins.Bottom := 10;
        Padding.Left := 20;
        Padding.Top := 10;
        Padding.Right := 10;
        Padding.Bottom := 10;
        cursor := crHandPoint;
      end;
      arrPanels[x].FullRepaint:=True;
      arrPanels[x].ParentBackground:=True;
      arrPanels[x].Visible:=True;
      arrPanels[x].OnClick := buttonClick;
    ADOQuery1.Next;
    x:=x+1;
  end;
  ADOQuery1.Close;
end;

function TForm13.getParent(foodType: String): TFlowPanel;
begin
  if foodType='beverage' then
    Result := fp0
  else
  if foodType='snack' then
    Result := fp1
  else
  if foodType='food' then
    Result := fp2
  else
  if foodType='spices' then
    Result := fp3
  else
  if foodType='extras' then
    Result := fp4
  else
  if foodType='dairy' then
    Result := fp5
  else
  if foodType='fruits and vegetables' then
    Result := fp6;




end;

procedure TForm13.Image1Click(Sender: TObject);
begin
form2.show;
form13.hide;
end;

procedure TForm13.TabControl1Change(Sender: TObject);
begin
(FindComponent('fp'+IntToStr(TabControl1.TabIndex)) as TFlowPanel).BringToFront;
end;

end.
