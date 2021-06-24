unit dashboard_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db_management,dbConn_u,unit12,unit17,Unit13,unit11, unit14,unit9, UserAcc,unit6, unit8 , unit20 ,
  unit16, Dialogs, ExtCtrls, StdCtrls, Menus, pngimage, jpeg, aboutPage_u,
  customerForm;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    General1: TMenuItem;
    ExitApplication1: TMenuItem;
    Other1: TMenuItem;
    ViewStore1: TMenuItem;
    ContactDetails1: TMenuItem;
    Help1: TMenuItem;
    AboutDevelopers1: TMenuItem;
    HowtousethisSoftware1: TMenuItem;
    AboutThisSoftware1: TMenuItem;
    Donthaveanaccount1: TMenuItem;
    Logout1: TMenuItem;
    dateTime: TTimer;
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Image1: TImage;
    Panel9: TPanel;
    Panel4: TPanel;
    Image3: TImage;
    Panel5: TPanel;
    Panel7: TPanel;
    Image7: TImage;
    Panel12: TPanel;
    Panel17: TPanel;
    Image9: TImage;
    Panel18: TPanel;
    Panel21: TPanel;
    Image11: TImage;
    Panel22: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    GridPanel2: TGridPanel;
    Panel6: TPanel;
    dateItem: TLabel;
    AboutUmbiloPlaza1: TMenuItem;
    Timer1: TTimer;
    Label4: TLabel;
    Shortcuts1: TMenuItem;
    CtrlF1CashierMode1: TMenuItem;
    CtrlF2ViewStore1: TMenuItem;
    CtrlF3BackOffice1: TMenuItem;
    CtrlF4CustomerMembership1: TMenuItem;
    CtrlF5ViewProfile1: TMenuItem;
    CtrlF6ClockInClockOut1: TMenuItem;
    procedure dateTimeTimer(Sender: TObject);
    procedure Panel9click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image8Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel22Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure ExitApplication1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure ViewStore1Click(Sender: TObject);
    procedure AboutUmbiloPlaza1Click(Sender: TObject);
    procedure AboutDevelopers1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Panel18Click(Sender: TObject);
    procedure CtrlF1CashierMode1Click(Sender: TObject);
    procedure CtrlF2ViewStore1Click(Sender: TObject);
    procedure CtrlF3BackOffice1Click(Sender: TObject);
    procedure CtrlF4CustomerMembership1Click(Sender: TObject);
    procedure CtrlF5ViewProfile1Click(Sender: TObject);
    procedure CtrlF6ClockInClockOut1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Donthaveanaccount1Click(Sender: TObject);
    procedure AboutThisSoftware1Click(Sender: TObject);
  private
    { Private declarations }
    defaultLocation : String;
    const BACKUP = 'dataSources/backup.txt';

  public
    clockedIn : Boolean ;
    permissions : array of string;
    Account : TAccount;
    procedure logOut;
    procedure logIn;
    procedure distributeAll;

    { Public declarations }
{    function LoginSystem : Boolean;  }

  end;

var
  Form2: TForm2;


implementation

{$R *.dfm}

procedure TForm2.AboutDevelopers1Click(Sender: TObject);
begin
aboutPage_u.AboutPage.readFrom := 'dataSources\AboutDev.txt';
aboutPage_u.AboutPage.heading := 'GINTEC DEVELOPERS';
aboutPage_u.AboutPage.Caption := 'ABOUT GINTEC DEVELOPERS';
aboutPage_u.AboutPage.Show;
end;

procedure TForm2.AboutThisSoftware1Click(Sender: TObject);
begin
ShowMessage('Hi there. Welcome to Umbilo Plaza. This software is another'+
' one of many solutions created by GinTec. This is what you call a Point of Sale System Software'+
' which is for supermarkets, and retail stores. if you would like to know more about GinTec developers, then simply go to "About Developers"');
end;

procedure TForm2.AboutUmbiloPlaza1Click(Sender: TObject);
begin
aboutPage_u.AboutPage.readFrom := 'dataSources\AboutUmbiloPlaza.txt';
aboutPage_u.AboutPage.heading := 'UMBILO PLAZA';
aboutPage_u.AboutPage.Caption := 'ABOUT UMBILO PLAZA';
aboutPage_u.AboutPage.Show;
end;

procedure TForm2.CtrlF1CashierMode1Click(Sender: TObject);
begin
Panel9click(self);
end;

procedure TForm2.CtrlF2ViewStore1Click(Sender: TObject);
begin
Panel18Click(self);
end;

procedure TForm2.CtrlF3BackOffice1Click(Sender: TObject);
begin
Panel5Click(self);
end;

procedure TForm2.CtrlF4CustomerMembership1Click(Sender: TObject);
begin
Panel22Click(self);
end;

procedure TForm2.CtrlF5ViewProfile1Click(Sender: TObject);
begin
Panel12Click(self);
end;

procedure TForm2.CtrlF6ClockInClockOut1Click(Sender: TObject);
begin
Image2Click(self);
end;

procedure TForm2.dateTimeTimer(Sender: TObject);
begin
dateItem.Caption := DateTimeToStr(now);
end;

procedure TForm2.distributeAll;
begin
//
unit17.Form15.Account := self.Account;
unit12.Form12.Account := self.Account;
unit9.Form9.Account := self.Account;
unit8.Form8.Account := self.Account;
unit20.Form20.Account := self.Account;
unit14.Form14.Account := self.Account;
unit17.Form15.updateAllAccounts;

with unit9.Form9 do
  begin
    Edit1.Text:=Account.getName;
    Edit2.Text:=Account.getSurname;
    Edit3.Text:=Account.getGender;
    Edit4.Text:=Account.getEmail;
    Edit5.Text:=Account.getID;
    Edit6.Text:=Account.getPassword;
    Caption:='PROFILE OF '+Account.getEmployeeID;
    Panel4.Caption:=Caption;
    if Account.getAdmin then Edit7.Text:='ADMIN' else Edit7.Text:='EMPLOYEE';
    displayData;
  end;
end;

procedure TForm2.Donthaveanaccount1Click(Sender: TObject);
begin
//
ShowMessage('Hey there, Welcome to umbilo plaza. We have 3 types of accounts available here:'+
'Employee Accounts and Customer accounts. To get an employee account, you obviously need to be employeed / work here'+
' however to get a Customer Account, you can easily sign up for it below. Thank You');
end;

procedure TForm2.ExitApplication1Click(Sender: TObject);
begin
if clockedIn then
begin
    if MessageDlg('By closing this application, you are loggin out. Do you wish to continue?',
      mtConfirmation, [mbYes,mbNo],-1)= 6 then
        begin
          with dbConn_u.DataModule1 do
            begin
              logOut;
            end;
          Application.Terminate;
        end

end
else
Application.Terminate;
end;

procedure TForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
if (NewHeight>= 542) and (NewWidth>=785) then
    Resize := True
else Resize := False;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//logout
Application.Terminate;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if clockedIn then //if employee is logged in and they wish
//to close app, we ask for confirmation and that they will log out, else the user just closes app
begin
    if MessageDlg('By closing this application, you are loggin out. Do you wish to continue?',
      mtConfirmation, [mbYes,mbNo],-1)= 6 then
        begin
        //when user agrees and say yes, we then log them out
        // and then close application
        logOut;
        clockedIn := False;
        CanClose := True;
        Application.Terminate;
        end
else CanClose:=False;  //otherwise if they refuse then we don't close anything
end
else CanClose:=True;  // otherwise if user is not logged in , then we simply close application.


end;

procedure TForm2.FormCreate(Sender: TObject);
var x :integer;
begin
Application.MainFormOnTaskBar := False;

(Sender as TForm).Position:=poScreenCenter;
(Sender as TForm).DefaultMonitor := dmMainForm;
clockedIn:=False;
Panel22.Font.Color := RGB(255,140,0);
end;

procedure TForm2.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (Shift= [ssCtrl]) then
  begin
    case key of
      VK_F1 :  Panel9click(self);
      VK_F2 :  Panel18Click(self);
      VK_F3 :  Panel5Click(self);
      VK_F4 :  Panel22Click(self);
      VK_F5 :  Panel12Click(self);
      VK_F6 :  Image2Click(self);
    end;
  end;
end;

procedure TForm2.Panel9click(Sender: TObject);
begin
//
//{
if clockedIn then
  begin
    if Account.getStatus= False then
      begin
        ShowMessage('Hey, you can not access this feature since your account has been blocked. Contact Manager.');
        Exit;
      end;
    form12.show;
    form2.Hide;
  end
else
  begin
    ShowMessage('You need to sign in before continuing.');
    Image2Click(self);
  end;
//}


end;

procedure TForm2.Settings1Click(Sender: TObject);
begin
//
if clockedIn then
  if Account.getAdmin then
    begin
      //take usser to setting's page
    end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var txt : TextFile;
begin

// THIS IS OUR BACK UP SYSTEM
// IN A NUTSHELL, WHAT IT DOES IS SIMPLY SAVE
// THE CURRENT DATE AND TIME IN A BACKUP.TXT
// WHENEVER AN EMPLOYEE IS LOGGED IN SO THAT IF THE SYSTEM
// WERE TO CRASH UNEXPECTEDLY, WHEN THE SYSTEM RESTARTS - OR
// IS OPENED AGAIN, THE LAST SAVED DATE AND TIME WILL
// BE USED AS EMPLOYEE LOG OUT TIME.
if clockedIn=False then
  begin
    timer1.Enabled := False;
  end;
AssignFile(txt, ExtractFilePath(ParamStr(0))+ BACKUP);
Append(txt);
WriteLn(txt , DateTimeToStr(Now));
closefile(txt);
end;

procedure TForm2.ViewStore1Click(Sender: TObject);
begin
//takes user to view the store.
Panel18Click(self);
end;

procedure TForm2.Image2Click(Sender: TObject);
var txt : Textfile;
begin
//
if clockedIn=False Then
  begin
    Form16.Show;
    form16.callerID:=Form2;
    form16.DestinationID:=Nil;
    Form2.Enabled:=False;

    AssignFile(txt, ExtractFilePath(ParamStr(0))+ BACKUP);
    Rewrite(txt);
    CloseFile(txt);

    Timer1.Enabled := True;
  end
else if clockedIn then
  begin
    if MessageDlg('Do you wish to logout?',
    mtConfirmation, [mbYes,mbNo],-1)= 6 then
      begin
      logOut;
      Timer1.Enabled := False;
      end;


  end;

end;

procedure TForm2.Image8Click(Sender: TObject);
var x:OleVariant;
begin
//
              //x:=('sapi','spVoice');
end;

procedure TForm2.logIn;
begin
  //when user log's in, from the other form this function
  //is called to change the clockedin value to true
  // and user is notified that they are logged in.
  Form2.clockedIn := True;
  Form2.Caption:='You are logged in '//+edtUName.Text;
  //fill in the permissions
end;

procedure TForm2.logOut;
var x:Integer;
begin
//when user wishes to log out, this function is called
// also updates the database ClockOutTime Value.
  clockedIn:=False;
  for x := 0 to length(permissions)-1 do begin
    permissions[x]:='';
  end;
  Form2.Caption:='';
  with dbConn_u.DataModule1 do
    begin
      qryLogin.Close;
      qryLogin.SQL.Text:='UPDATE tblAttendance SET ClockOutTime = Now() Where RecordNo = '+ IntToStr(Account.getPosiz);
      qryLogin.ExecSQL;
    end;

  //and also all the other data that we've stored temporarily for user
end;

procedure TForm2.Logout1Click(Sender: TObject);
begin
if clockedIn then
  begin
    Panel12Click(self);
  end;

end;

procedure TForm2.Panel12Click(Sender: TObject);
begin
//
if clockedIn and Account.getStatus then
  begin
    if Account.getStatus= False then
      begin
        ShowMessage('Hey, you can not access this feature since your account has been blocked. Contact Manager.');
        Exit;
      end;

    unit9.Form9.Show;
    Form2.hide;
  end
else
  begin
    ShowMessage('You need to sign in before continuing.');
    Image2Click(self);
  end;
end;

procedure TForm2.Panel13Click(Sender: TObject);
begin
//dealing with payments (of both employees and vendors)
end;

procedure TForm2.Panel18Click(Sender: TObject);
begin
Form13.Show;
form2.Hide;
end;

procedure TForm2.Panel22Click(Sender: TObject);
begin
customerForm.Form25.Show;
self.Enabled := False;
end;

procedure TForm2.Panel5Click(Sender: TObject);
begin
if clockedIn and Account.getStatus then  //and account is of admin
  begin

    if Account.getStatus= False then
      begin
        ShowMessage('Hey, you can not access this feature since your account has been blocked. Contact Manager.');
        Exit;
      end;

    if Account.getAdmin then
      begin
        unit17.Form15.Show;
        Form2.hide;
      end
    else
      ShowMessage('Hey '+ Account.getName+'! Unfortunately you can"t go here, because you"re not an Admin.');

  end
else
  begin
    ShowMessage('You need to sign in before continuing and only Admins can go here.');
    Image2Click(self);
  end;
end;

end.
