unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, db_management;

type
  TForm19 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtFn: TEdit;
    edtSn: TEdit;
    edtEm: TEdit;
    edtCell: TEdit;
    edtCo: TEdit;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    edtAdd: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edtCellKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCellKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    vID : Integer;
  procedure clearAll;
  end;

var
  Form19: TForm19;
  POSQuery : TPOSQuery;


implementation
uses unit8;
{$R *.dfm}

procedure TForm19.Button2Click(Sender: TObject);
var
  fName , surname, gender, email,co , address, cell , resp: String;
  AccStat :Boolean ;

begin
fName := edtFn.Text;
surname := edtSn.Text;
gender := ComboBox1.Items.Strings[ComboBox1.ItemIndex];
email := edtEm.Text;
co := edtCo.Text;
cell := edtCell.Text;
address := edtAdd.Text;
AccStat := CheckBox1.Checked;

//check that data is correct- Validation
if not(
(fName<>'') and (surname<>'') and (gender<>'') and (co<>'') and
(length(cell) = 10) and (address<>'')
) then
  begin
    ShowMessage('Hey there, You need to fill in correct data in all the fields.');
    Exit;
  end;


POSQuery := TPOSQuery.create;

if Panel2.Caption <> 'UPDATE VENDOR' then
    begin
        resp:= POSQuery.createVendor(fName,surname,co,email,address,cell,gender,AccStat);

        if resp<>'' then
          ShowMessage('Vendor has been Added. The Vendor ID For '+co+' = '+resp)
        else
        ShowMessage('Error while creating Vendor. If error persists, please contact admin.');
        //IDEA also have a profile for vendors, like from vendors page, manager can view all products supplied
    end
    else
    begin
        resp:= POSQuery.updateVendor(vID,fName,surname,co,email,address,cell,gender,AccStat);
        ShowMessage(resp);
    end;
clearAll;
unit8.Form8.Enabled :=true;
self.Hide;
end;

procedure TForm19.Button3Click(Sender: TObject);
begin
clearAll;
self.Hide;

end;

procedure TForm19.clearAll;
var i:integer;
    obj : TObject;
begin

for i := 0 to self.ComponentCount-1 do
  begin
    obj := (self.Components[i] as TObject);
    if  (obj is TEdit) then
        (obj as TEdit).Clear
    else
    if  (obj is TComboBox) then
        begin
            (obj as TComboBox).Clear;
            (obj as TComboBox).ItemIndex:=-1
        end
    else
    if (obj is TCheckBox) then
        (obj as TCheckBox).Checked:=false;
  end;

ComboBox1.Items.Add('M');
ComboBox1.Items.Add('F');
self.Hide;
unit8.Form8.Enabled := True;
unit8.Form8.BringToFront;
end;

procedure TForm19.edtCellKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not (key in [VK_BACK, VK_RETURN, 48..57]) then
  key := 0;
end;

procedure TForm19.edtCellKeyPress(Sender: TObject; var Key: Char);
begin

if not (Ord(key) in [VK_BACK, VK_RETURN,48..57]) then
  key := chr(0)

end;

procedure TForm19.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize := False;
end;

procedure TForm19.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := False;
clearAll;
end;

procedure TForm19.FormCreate(Sender: TObject);
begin
Position := poScreenCenter;
end;

end.
