unit customerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, ExtDlgs, ComCtrls, Math, unit24,
  dbConn_u,
  DB, ADODB;

type
  TForm25 = class(TForm)
    pnlLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    imgBtnTogglePassword: TImage;
    dateItem: TLabel;
    Label4: TLabel;
    btnLogin: TButton;
    edtUName: TEdit;
    edtPassword: TEdit;
    dateTime: TTimer;
    pnlSignUp: TScrollBox;
    Label7: TLabel;
    Button1: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtFName: TEdit;
    edtSurname: TEdit;
    edtEmail: TEdit;
    edtSAID: TEdit;
    edtPassword2: TEdit;
    Button2: TButton;
    Label9: TLabel;
    Label8: TLabel;
    pnlSuccess: TPanel;
    Label18: TLabel;
    lblCardNumber: TLabel;
    Label14: TLabel;
    edtPassCode: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    rgGender: TRadioGroup;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DateTimePicker1: TDateTimePicker;
    OpenPictureDialog1: TOpenPictureDialog;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Panel1: TPanel;
    Button3: TButton;
    Button6: TButton;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    qryAll: TADOQuery;
    ADOTable1: TADOTable;
    procedure dateTimeTimer(Sender: TObject);
    procedure imgBtnTogglePasswordClick(Sender: TObject);
    procedure togglePassword;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Label19Click(Sender: TObject);
    procedure Label19MouseLeave(Sender: TObject);
    procedure Label19MouseEnter(Sender: TObject);
    procedure Label20MouseEnter(Sender: TObject);
    procedure Label20MouseLeave(Sender: TObject);
    procedure LinkLabel1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure edtEmailChange(Sender: TObject);
    procedure edtSAIDChange(Sender: TObject);
    procedure edtPassword2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DateTimePicker1UserInput
      (Sender: TObject; const UserString: string; var DateAndTime: TDateTime;
      var AllowChange: Boolean);
    procedure Image1Click(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label20Click(Sender: TObject);
  private
    { Private declarations }
    function validate: Boolean;
  public
    { Public declarations }
    procedure clearAll;
    procedure createUser;
  end;

var
  Form25: TForm25;
  passwordshowing: Boolean = false;
  changedP: Boolean = false;
  success: Boolean = false;
  defaultImage: String = 'media\icons\Rounded-31-128.png';

implementation

uses dashboard_u;
{$R *.dfm}

procedure TForm25.btnLoginClick(Sender: TObject);
var userName,passWord : string;
begin
userName := edtUName.Text;
passWord := edtPassword.Text;
if (userName<>'') and (passWord<>'') then
  begin
    qryAll.Close;
    qryAll.SQL.Text := 'SELECT CustomerID, Email, Password, ACCOUNT_STATUS from tblCustomers'+
    ' Where ((CustomerID Like '+QuotedStr(userName) +') OR (Email Like '+ QuotedStr(userName)+'))'+
    ' AND StrComp(Password,'+ QuotedStr(passWord)+',0 ) = 0';

    qryAll.Open;

    if (qryAll.RecordCount=1) then
      begin
        if (qryAll['ACCOUNT_STATUS']) then
          begin
            ShowMessage('YOU HAVE SUCCESSFULLY LOGGED IN.');
            unit24.Form24.arrDetails[1] := qryAll['CustomerID'];
            unit24.Form24.arrDetails[2] := qryAll['Password'];
            unit24.Form24.fetchDetails;
            unit24.Form24.Show;
            form2.Hide;
            clearAll;
            self.Hide;
            form2.Enabled := True;
          end
        else
          begin
            ShowMessage('Sorry, but it seems like your account has been disabled. Please go and see the manager.');
          end;

      end
    else ShowMessage('YOUR ACCOUNT IS NOT FOUND OR (EMAIL OR USERNAME) ENTERED IS INCORRECT. REMEMBER THAT THE PASSWORD IS CASE SENSITIVE');
  end
else ShowMessage('ERROR! ENTER BOTH (EMAIL OR USERNAME) AND PASSWORD. ');

qryAll.Close;
end;

procedure TForm25.Button1Click(Sender: TObject);
begin
  if validate then
  begin
    ShowMessage('Thank you for your compliance');
    Beep;
    createUser;
  end
  else
  begin
    Windows.Beep(942, 200);
    ShowMessage('Error! You have entered some incorrect values.');
  end;

end;

procedure TForm25.Button3Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute(Handle) then
  begin
    // ShowMessage(OpenPictureDialog1.FileName);
    Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    Image2.Refresh;
    changedP := True;
  end;
end;

procedure TForm25.Button6Click(Sender: TObject);
begin
  Image2.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + defaultImage);
  changedP := false;
end;

procedure TForm25.clearAll;
var
  i: integer;
begin

  for i := 32 to 37 do
    begin
      ((FindComponent('Label' + IntToStr(i)) as TObject) as TLabel).Hide;
    end;

  edtUName.Clear;
  edtPassword.Clear;
  edtFName.Clear;
  edtSurname.Clear;
  edtEmail.Clear;
  edtSAID.Clear;
  edtPassword2.Clear;
  edtPassCode.Clear;

  changedP := false;
  success := False;
  passwordshowing := False;
  togglePassword;

  lblCardNumber.Caption := '';
  edtPassCode.Text := '';

end;

procedure TForm25.createUser;
var
  y, m, sum, len, xx, prevNo, newNo: integer;
  nn, n, x, i, acc: string;
  b: Boolean;
  CustId: String;
  // variables to store user's input
  z, fPic, fGen, fName, fSurname, fEmail, fID, fPass: String;
  fDob: TDate;

begin
  //
  Randomize;

  fGen := rgGender.Items.Strings[rgGender.ItemIndex];
  fName := edtFName.Text;
  fSurname := edtSurname.Text;
  fEmail := edtEmail.Text;
  fID := edtSAID.Text;
  fPass := edtPassword2.Text;
  fDob := DateTimePicker1.Date;

  qryAll.Close;
  qryAll.SQL.Text := 'SELECT CustID from tblCustomers where Email Like '+QuotedStr(fEmail)+
  ' OR SAID = '+ QuotedStr(fID);
  qryAll.Open;


  if (qryAll.RecordCount>0) then
    begin
      ShowMessage('The Email or ID number you have provided already exists and is assigned to another account.'+
      ' If you already have an account, please log in.');
      exit;
    end;

  qryAll.Close;
  qryAll.SQL.Text := 'SELECT PASS_CODE FROM tblCustomers';
  qryAll.Open;

  CustId := 'Cust' + IntToStr(qryAll.RecordCount + 1);

  y := 0;
  repeat
    y := RandomRange(1000, 9999);
    n := IntToStr(y);

    x := '';

    for m := 1 to length(n) do
    begin
      x := x + IntToStr(Ord(n[m]));
    end;
    sum := 0;

    // all will be lesser than 100
    // adding all the single digits in m to get a check number
    for m := 1 to length(x) do
      sum := sum + StrToInt(x[m]);

    nn := x;
    len := length(x);
    b := false;
    y := 0;
    i := '';
    while not(b) and not(y = 8) do
    begin
      Application.ProcessMessages;
      xx := Random(len) + 1;

      if (x[xx] <> 'X') then
      begin
        i := i + x[xx];
        x[xx] := 'X';
        y := y + 1;

        if y = len then
          b := True;

      end;
    end;
    acc := i + IntToStr(sum);
  until (y <> 0) and not(qryAll.Locate('PASS_CODE', y, []));
  // save to database
  if changedP then
  begin
    // copy uploaded picture to our folder
    z := ExtractFilePath(ParamStr(0)) + 'media\accounts\' + CustId +
      extractFileExt(OpenPictureDialog1.FileName);

    Image2.Picture.SaveToFile(z);


    if FileExists(z) then
    begin
      success := True;
      ShowMessage('Picture successfully uploaded');
      fPic := ExtractFileName(z);
    end
    else
    begin
      ShowMessage('Error uploading picture, we are allocating you with the default image.');
      fPic := defaultImage;
    end;

  end
  else
    fPic := defaultImage;

  try

  ADOTable1.TableName := 'tblCustomers';
  ADOTable1.Open;

  prevNo := ADOTable1.RecordCount;

  ADOTable1.Insert;
  ADOTable1['CustomerID'] := CustId;
  ADOTable1['firstName'] := fName;
  ADOTable1['Surname'] := fSurname;
  ADOTable1['Gender'] := fGen;
  ADOTable1['Email'] := fEmail;
  ADOTable1['SAID'] := fID;
  ADOTable1['DOB'] := fDob;
  ADOTable1['Password'] := fPass;
  ADOTable1['ACCOUNT_STATUS'] := True;
  ADOTable1['LoyaltyPoints'] := 10;
  ADOTable1['CardNumber'] := acc;
  ADOTable1['Pass_Code'] := StrToInt(n);
  ADOTable1['ProfilePic'] := fPic;
  ADOTable1.Post;

  ADOTable1.Refresh;

  newNo := ADOTable1.RecordCount;
  ADOTable1.Close;

  qryAll.Close;

  qryAll.SQL.Text :=
    'INSERT INTO tblLoyaltyPoints(CustomerID, LoyaltyPoints, Type) ' +
    'VALUES (' + QuotedStr(CustId) + ', 10, "BONUS")';

  if (newNo > prevNo) and (qryAll.ExecSQL>0) then
  begin
    ShowMessage('Success! Your account has been created');
    clearAll;

    lblCardNumber.Caption := acc;
    edtPassCode.Text := n;
    pnlSuccess.BringToFront;
    pnlSignUp.VertScrollBar.Position := 0;

  end
  else
  begin
    ShowMessage(
      'Error, there was a problem while trying to create your account. Please try again later or contact Admin');
    pnlLogin.BringToFront;
    clearAll;
    pnlSignUp.VertScrollBar.Position := 0;
    DataModule1.dbProvider.RollbackTrans;
  end;
  except on E: Exception do
    begin
      DataModule1.dbProvider.RollbackTrans;
    end;
  end;

  ADOTable1.Close;
  qryAll.Close;
end;

procedure TForm25.DateTimePicker1UserInput
  (Sender: TObject; const UserString: string; var DateAndTime: TDateTime;
  var AllowChange: Boolean);
begin
  //

end;

procedure TForm25.dateTimeTimer(Sender: TObject);
begin
  dateItem.Caption := DateTimeToStr(now);
  Label17.Caption := DateTimeToStr(now);
end;

procedure TForm25.edtEmailChange(Sender: TObject);
begin
  //
  if not(pos('@', edtEmail.Text) > 0) then
    edtEmail.Color := clRed
  else
    edtEmail.Color := clLime;
end;

procedure TForm25.edtPassword2Change(Sender: TObject);
begin
  if length(edtPassword2.Text) >= 7 then
    edtPassword2.Color := clLime
  else
    edtPassword2.Color := clRed;
end;

procedure TForm25.edtSAIDChange(Sender: TObject);
begin
  if (length(edtSAID.Text) in [0 .. 3]) then
    edtSAID.Color := clRed
  else if (length(edtSAID.Text) in [4 .. 6]) then
    edtSAID.Color := clBackground
  else if (length(edtSAID.Text) in [7 .. 10]) then
    edtSAID.Color := clYellow
  else if (length(edtSAID.Text) in [11, 12]) then
    edtSAID.Color := clSkyBlue
  else if (length(edtSAID.Text) = 13) then
    edtSAID.Color := clLime;

end;

procedure TForm25.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  self.Hide;
  dashboard_u.form2.Enabled := True;
  dashboard_u.form2.BringToFront;
end;

procedure TForm25.FormCreate(Sender: TObject);
begin
  Position := poDesktopCenter;
  pnlLogin.BringToFront;


  pnlSignUp.VertScrollBar.Position := 0;
  // restricting user input

  edtSAID.MaxLength := 13;
  edtSAID.NumbersOnly := True;
  edtPassword2.MaxLength := 16;
  clearAll;
end;

procedure TForm25.FormShow(Sender: TObject);
begin
//
pnlSignUp.VertScrollBar.Position := 0;
end;

procedure TForm25.Image1Click(Sender: TObject);
begin
  pnlLogin.BringToFront;
end;

procedure TForm25.imgBtnTogglePasswordClick(Sender: TObject);
begin
  togglePassword;
end;

procedure TForm25.Label19Click(Sender: TObject);
begin
  pnlSignUp.BringToFront;
end;

procedure TForm25.Label19MouseEnter(Sender: TObject);
begin
  Label19.Font.Color := clBlack;
end;

procedure TForm25.Label19MouseLeave(Sender: TObject);
begin
  Label19.Font.Color := clMenuHighlight;
end;

procedure TForm25.Label20Click(Sender: TObject);
begin
ShowMessage('Hi, it is unfortunate that you have forgotten your password. Please contact the Admin or Manager of the store.');
end;

procedure TForm25.Label20MouseEnter(Sender: TObject);
begin
  Label20.Font.Color := clBlack;
end;

procedure TForm25.Label20MouseLeave(Sender: TObject);
begin
  Label20.Font.Color := clMenuHighlight;
end;

procedure TForm25.LinkLabel1Click(Sender: TObject);
begin
  pnlSignUp.BringToFront;
end;

procedure TForm25.togglePassword;
begin
  if passwordshowing = True then
  begin
    passwordshowing := false;
    edtPassword.PasswordChar := chr(0);
    imgBtnTogglePassword.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+ 'media\icons\lock-128.png');
  end
  else
  begin
    passwordshowing := True;
    edtPassword.PasswordChar := '�';
    imgBtnTogglePassword.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+ 'media\icons\unlocked-128.png');
  end;
end;

function TForm25.validate: Boolean;
var
  vPass, vGender, vEmail, vID: Boolean;
  temp: String;
  atPos, n: integer;
  cDate: String;
  yearNow, yearBirth, x, x1, i, numCaps, numSmall, numNum, numAlpha,
    numCorrect: integer;
  yN, y, y1, m, m1, d, d1: word;
begin
  //
  // verifying ID
  // since we've already limited edtSAID to only accepting
  // numbers, we don't have to check that they've entered
  // numbers, now we only validate to see that there are 13 digits
  // and that the date of birth we get from first 6 digits of
  // id number correspond to that of which the user entered in
  // datetimepicker.
  // also checking at the same time that their age is >= 16 as
  // that is the requirement for user to sign up.
  if (length(edtSAID.Text) = 13) then
  begin
    cDate := Copy(edtSAID.Text, 1, 6);

    // decode the date of today of now into y/m/d
    DecodeDate(now, y, m, d);
    yN := y;

    DecodeDate(DateTimePicker1.Date, y, m, d);

    y1 := StrToInt(cDate[1] + cDate[2]);
    m1 := StrToInt(cDate[3] + cDate[4]);
    d1 := StrToInt(cDate[5] + cDate[6]);

    // this if statement checks if the dob from date matches that of id

    x := StrToInt(Copy(IntToStr(y), 3, 2));

    x1 := StrToInt(Copy(IntToStr(yN), 3, 2));

    yearNow := yN;

    if (x = y1) and (m1 = m) and (d1 = d) then
    begin

      if y1 > x1 then
        yearBirth := 1900 + y1
      else
        yearBirth := 2000 + y1;

      if yearBirth = y then
        if ((yearNow - yearBirth) >= 16) then
          vID := True
        else
          vID := false;

    end
    else
      vID := false;
  end
  else
    vID := (length(edtSAID.Text) = 13);

  if vID then
    Label32.Visible := false
  else
    Label32.Visible := True;

  vGender := (rgGender.ItemIndex > -1);
  if vGender then
    Label35.Hide
  else
    Label35.Show;

  { VERIFYING/VALIDATING EMAIL }
  // firstly, i capture the value entered by user and keep
  // it in temp. now all i have to check in order for
  // email to be valid is that @ is present, and that there is
  // only one @ sign. also that the length > 0

  temp := edtEmail.Text;

  atPos := pos('@', temp);

  // if the length is greater than 0 and an @ sign is found - also
  // not as first character
  // then the code inside begin end statement will be executed
  // else we already conclude that the email is invalid

  if (length(temp) > 0) and (atPos > 0) then
  begin
    n := 1;
    Delete(temp, 1, atPos);
    atPos := pos('@', temp);

    // now that the conditions specified in if statement are true
    // this means the provided email is sort of valid
    // all we have to check 4 now is that the email
    // does not have another @ sign and that there is text found
    // after the @ sign

    if (atPos > 0) or (temp = '') then
      vEmail := false
    else
      vEmail := True;

  end
  else
    vEmail := false;

  /// validate password
  ///

  numCaps := 0;
  numSmall := 0;
  numNum := 0;
  numCorrect := 0;

  if (length(edtPassword2.Text) >= 7) then
  begin
    for i := 1 to length(edtPassword2.Text) do
    begin
      if edtPassword2.Text[i] in ['A' .. 'Z', 'a' .. 'z', '0' .. '9'] then
        Inc(numCorrect);

      if edtPassword2.Text[i] in ['A' .. 'Z'] then
      begin
        Inc(numCaps);
        Inc(numAlpha);
      end
      else if edtPassword2.Text[i] in ['a' .. 'z'] then
      begin
        Inc(numSmall);
        Inc(numAlpha);
      end
      else if edtPassword2.Text[i] in ['0' .. '9'] then
        Inc(numNum);
    end;
    if (numCaps >= 1) and (numSmall >= 1) and (numAlpha >= 5) and (numNum >= 2)
      and (numCorrect = (numNum + numAlpha)) and
      (numCorrect = length(edtPassword2.Text)) then

      vPass := True

    else
      vPass := false;

  end
  else
    vPass := false;

  if vEmail then
    Label34.Hide
  else
    Label34.Show;

  if (edtSurname.Text <> '') then
    Label36.Hide
  else
    Label36.Show;

  if (edtFName.Text <> '') then
    Label37.Hide
  else
    Label37.Show;

  if vPass then
    Label21.Font.Color := clMenuHighlight
  else
    Label21.Font.Color := clRed;

  Result := (edtFName.Text <> '') and (edtSurname.Text <> '')
    and vEmail and vID and vGender and vPass;
end;

end.
