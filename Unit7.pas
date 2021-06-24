unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage,dbConn_u,db_management, ComCtrls;

type
  TForm7 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    edtPassword: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    Label8: TLabel;
    ComboBox1: TComboBox;
    imgBtnTogglePassword: TImage;
    Label9: TLabel;
    edtWage: TEdit;
    Label7: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure togglePassword;
    procedure imgBtnTogglePasswordClick(Sender: TObject);
    procedure clearAll;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    empID : String;
  end;

var
  Form7: TForm7;
  passwordShowing : Boolean;
  POSQuery : TPOSQuery;
  oldString : String;
  arrEdits : array[1..5] of TEdit;

implementation
uses unit6;
{$R *.dfm}

procedure TForm7.Button2Click(Sender: TObject);
var
  fName, surname, gender, email, said,
  password: String; AccStat, Admin: Boolean;
  resp : string;
  hwage : Real;
  x,n : integer;
begin
//EXTRACTING USER DATA

fName:= Edit1.Text;
surname:=Edit2.Text;
gender:=ComboBox1.Items[ComboBox1.ItemIndex];
email:=Edit4.Text;
said:=Edit5.Text;
password:=edtPassword.Text;
AccStat:= CheckBox1.Checked;
Admin:= CheckBox2.Checked;
try
hwage := StrToFloat(edtWage.Text);
except on E: Exception do
  begin
    ShowMessage('You have entered an invalid Number for your salary. Make sure you enter the numbers correctly.');
    edtWage.Clear;
    Exit;
  end;
end;


if Length(said)<>13 then
  begin
    ShowMessage('South African ID is of invalid length. Enter correct value.');
    edit5.Clear;
    Exit;
  end;

//validate that the employeeID consists of valid digits only.
n := 0;//no of chars that are digits
for x := 1 to length(said) do
  begin
    if said[x] in ['0'..'9'] then
      n := n+ 1;
  end;

if n <> length(said) then
//meaning that the no of chars that are digits are not equal to the
//no of chars entered by user
  begin
    ShowMessage('Error with your South African ID. Make sure that you are only entering digits');
    edit5.Clear;
    Exit;
  end;

if Not(Length(password) in [8..20]) then
//minimum password length is 8 chars, max is 20. if anything other than that
//is entered then it's considered an invalid password.
  begin
    ShowMessage('minimum password length is 8 chars, max is 20. You have entered an Invalid Password. Correct that first.');
    edtPassword.Clear;
    Exit;
  end;

if not (Pos('@', email)>0) then
//if there's no @ sign in email, then it's invalid.
//incase if you're wondering, what if user tries to enter more than one @ sign.
//well, in the onpress and onkeyup event for the edit that captures emails,
//i have written code that only allows one @ sign to be entered.

  begin
    ShowMessage('You have entered an invalid email. It should be of the format below : someone@gmail.com');
    Edit4.Clear;
    Exit;
  end;

//check that data is correct- Validation

if not (
(fName<>'') and (surname<>'') and (gender<>'') and (email<>'') and (said<>'') and
(password<>'') and (hwage>0)
) then


POSQuery := TPOSQuery.create;

if Panel2.Caption = 'CREATE NEW EMPLOYEE' then
    begin
        resp:= POSQuery.createEmployee(fName,surname,gender,email,said,password,AccStat, Admin,hwage);

        if resp<>'' then
          ShowMessage('Employee Account Has been created. The Employee ID is '+resp)
        else
        ShowMessage('Error while creating Employee Account. If error persists, please contact admin.');
        //also have a profile for vendors, like from vendors page, manager can view all products supplied
    end
    else
    begin
        resp:= POSQuery.updateEmployee(empID,fName,surname,gender,email,said,password,AccStat, Admin,hwage);
        ShowMessage(resp);
    end;
clearAll;
unit6.Form6.Enabled:=true;
Form7.hide;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
clearAll;
end;

procedure TForm7.clearAll;
var i:integer;
    obj : TObject;
begin

for i := 0 to Form7.ComponentCount-1 do
  begin
    obj := (Form7.Components[i] as TObject);
    if  (obj is TEdit) then
        (obj as TEdit).Text:=''
    else
    if  (obj is TComboBox) then
        (obj as TComboBox).ItemIndex:=0
    else
    if (obj is TCheckBox) then
        (obj as TCheckBox).Checked:=false;
  end;

passwordShowing:=false;

togglePassword;

i:=1;
arrEdits[i].setFocus;
unit6.Form6.Enabled:=true;
Form7.hide;
end;

procedure TForm7.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
//
if key = '@' then
  if pos('@', oldString)>0 then key := chr(0);

oldString:= Edit4.Text;

end;

procedure TForm7.Edit4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if ord('@') = Key then
  if pos('@', oldString)>0 then key := 0;

oldString:= Edit4.Text;
end;

procedure TForm7.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := False;
Button3Click(self);
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
oldString := edit4.Text;
(Sender as TForm).Position:=poScreenCenter;
(Sender as TForm).DefaultMonitor := dmMainForm;
passwordShowing := False;
togglePassword;
POSQuery:=TPOSQuery.create;
arrEdits[1]:=Edit1;
arrEdits[2]:=Edit2;
arrEdits[3]:=Edit4;
arrEdits[4]:=Edit5;
arrEdits[5]:=edtPassword;
end;

procedure TForm7.imgBtnTogglePasswordClick(Sender: TObject);
begin
togglePassword;
end;

procedure TForm7.togglePassword;
begin
if passwordShowing = True then
    begin
      passwordShowing := False;
      edtPassword.PasswordChar := chr(0);
      imgBtnTogglePassword.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+ 'media/icons/lock-128.png');
    end
else
    begin
      passwordShowing := True;
      edtPassword.PasswordChar := '�';
      imgBtnTogglePassword.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+ 'media/icons/unlocked-128.png');
    end;
end;

end.

{ code that might be useful
for i := 1 to length(arrEdits) do
  arrEdits[i].clear;

ComboBox1.ItemIndex:=0;
CheckBox1.Checked:=false;
CheckBox2.Checked:=false;
}


