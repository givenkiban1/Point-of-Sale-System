unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage,dbConn_u, ExtCtrls, unit12, db_management, userAcc, unit17;

type
  TForm16 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    imgBtnTogglePassword: TImage;
    btnLogin: TButton;
    edtUName: TEdit;
    edtPassword: TEdit;
    dateTime: TTimer;
    dateItem: TLabel;
    Label4: TLabel;
    procedure imgBtnTogglePasswordClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dateTimeTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
    defaultLocation : string;
    procedure togglePassword;
    procedure logIn;
  public
    { Public declarations }
    callerID : TObject;
    DestinationID: TObject;
  end;

var
  Form16: TForm16;
  passwordShowing : Boolean;
  prevPos, currPos : Integer;
  POSQuery : TPOSQuery;


implementation
uses dashboard_u, unit14;
{$R *.dfm}

procedure TForm16.btnLoginClick(Sender: TObject);
var uName , uPass : String;

begin

uName := edtUName.Text;
uPass := edtPassword.Text;
if (uName='') or (uPass='') then
  begin
    ShowMessage('You need to enter both your Username and Password');
    exit;
  end;
if POSQuery.userExists(uName , uPass) then
  begin
    ShowMessage('Welcome '+ uName);
    Form16.Hide;

    logIn;
    dashboard_u.Form2.Enabled:=True;
    dashboard_u.Form2.Show;
    edtPassword.Clear;
    edtUName.Clear;
  end
  else
  begin
    ShowMessage('Your username or password does not match'+#13+
    ' any record in our database');
    dashboard_u.Form2.clockedIn := False;
    dashboard_u.Form2.Enabled:=True;
    Form16.Hide;
    edtPassword.Clear;
  end;

end;

procedure TForm16.dateTimeTimer(Sender: TObject);
begin
dateItem.Caption := DateTimeToStr(now);
end;

procedure TForm16.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TForm16.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := False;
dashboard_u.Form2.clockedIn := False;
dashboard_u.Form2.Enabled:=True;
Form16.Hide;

end;

procedure TForm16.FormCreate(Sender: TObject);
begin
(Sender as TForm).Position:=poScreenCenter;
(Sender as TForm).DefaultMonitor := dmMainForm;
self.Position:=poDesktopCenter;
passwordShowing := False;
togglePassword;
POSQuery := TPOSQuery.create;
POSQuery.maintainDB;

edtUName.Text := POSQuery.lastUser;
end;

procedure TForm16.FormShow(Sender: TObject);
begin
edtUName.Text := POSQuery.lastUser;
edtPassword.SetFocus;
end;

procedure TForm16.imgBtnTogglePasswordClick(Sender: TObject);
begin
togglePassword;
end;

procedure TForm16.logIn;
var
EmployeeID : string;
firstName : string;
Surname : string;
Gender : string;
Email : string;
SAID : string;
Password : string;
ACCOUNT_STATUS : Boolean;
DateHired : TDate;
DateFired : TDate;
Admin : boolean;
hWage : Real;
begin
  dashboard_u.Form2.clockedIn := True;


  with dbConn_u.DataModule1 do
    begin
      qryLogin.close;
      qryLogin.SQL.Text:='SELECT * FROM tblEmployees WHERE EmployeeID';
      qryLogin.SQL.Add(' LIKE '+QuotedStr('%'+ edtUName.Text+'%')+
      ' AND Password LIKE '+QuotedStr('%'+edtPassword.Text+'%'));
      qryLogin.open;

      EmployeeID := qryLogin['EmployeeID'];
      dashboard_u.Form2.Caption:='You are logged in '+ EmployeeID;
      firstName := qryLogin['firstName'];
      Surname := qryLogin['Surname'];
      Gender := qryLogin['Gender'];
      Email := qryLogin['Email'];
      SAID := qryLogin['SAID'];
      Password := qryLogin['Password'];
      ACCOUNT_STATUS := qryLogin['ACCOUNT_STATUS'];
      Admin := qryLogin['Admin'];
      hWage := qryLogin['HourlyWage'];
      DateHired := qryLogin['DateHired'];
      if qryLogin['DateFired']<>Null then
          DateFired := qryLogin['DateFired']
      else DateHired := 0;

      dashboard_u.Form2.Account := TAccount.Create(
        EmployeeID,firstName,Surname,Gender,EmployeeID,SAID,
        Password,ACCOUNT_STATUS,Admin,DateHired,DateFired, hWage);

      qryLogin.Close;
      qryLogin.SQL.Text:='INSERT INTO tblAttendance(EmployeeID,DateOfDay,ClockInTime, Paid)';
      qryLogin.SQL.Add(' VALUES('+QuotedStr(EmployeeID)+', #'+DateToStr(Now)+'#, Now(), False)');
      qryLogin.ExecSQL;

      dashboard_u.Form2.distributeAll;
    end;

end;

procedure TForm16.togglePassword;
begin
if passwordShowing = True then
    begin
      passwordShowing := False;
      edtPassword.PasswordChar := chr(0);
      imgBtnTogglePassword.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+ 'media\icons\lock-128.png');
    end
else
    begin
      passwordShowing := True;
      edtPassword.PasswordChar := '�';
      imgBtnTogglePassword.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+ 'media\icons\unlocked-128.png');
    end;
end;

end.
