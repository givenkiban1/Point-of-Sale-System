unit stockitems;

interface

type

TStockItem = class(TObject)

private
uStockID, uStockName, uSupplierID, uCompany, uImageFile, uCategory: String;
uQuantity: Integer; uUnitCost : Real;

public
constructor Create(fStockID, fStockName, fSupplierID, fImageFile, fCategory, fCompany: String; fQuantity: Integer; fUnitCost : Real);

//getters - accessor methods
function getStockID : String;
function getStockName : String;
function getSupplierID : String;
function getImageFile : String;
function getCategory : String;
function getQuantity : Integer;
function getUnitCost : Real;
function getCompany : String;

//setters - mutator methods
procedure setStockName( x : String);
procedure setImageFile( x : String);
procedure setCategory( x : String);
procedure setQuantity( x : Integer);
procedure setUnitCost( x : Real);

end;

implementation

{ TStockItem }

constructor TStockItem.Create(fStockID, fStockName, fSupplierID, fImageFile,
  fCategory, fCompany: String; fQuantity: Integer; fUnitCost: Real);
begin
uStockID:= fStockID;
uCompany:= fCompany;
uStockName:= fStockName;
uSupplierID:= fSupplierID;
uImageFile:= fImageFile;
uCategory:= fCategory;
uQuantity:= fQuantity;
uUnitCost:= fUnitCost;
end;

function TStockItem.getCategory: String;
begin
Result := uCategory;
end;

function TStockItem.getCompany: String;
begin
Result := uCompany;
end;

function TStockItem.getImageFile: String;
begin
Result := uImageFile;
end;

function TStockItem.getQuantity: Integer;
begin
Result := uQuantity;
end;

function TStockItem.getStockID: String;
begin
Result := uStockID;
end;

function TStockItem.getStockName: String;
begin
Result := uStockName;
end;

function TStockItem.getSupplierID: String;
begin
Result := uSupplierID;
end;

function TStockItem.getUnitCost: Real;
begin
Result := uUnitCost;
end;

procedure TStockItem.setCategory(x: String);
begin
uCategory := x;
end;

procedure TStockItem.setImageFile(x: String);
begin
uImageFile := x;
end;

procedure TStockItem.setQuantity(x: Integer);
begin
uQuantity := x;
end;

procedure TStockItem.setStockName(x: String);
begin
uStockName := x;
end;

procedure TStockItem.setUnitCost(x: Real);
begin
uUnitCost := x;
end;

end.

