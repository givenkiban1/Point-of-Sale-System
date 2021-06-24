unit POS_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, Menus ,unit12, db_management, unit9 ;

type
  TForm1 = class(TForm)
    btnLogin: TButton;
    Panel1: TPanel;
    edtUName: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    imgBtnTogglePassword: TImage;
    textSlide: TTimer;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    AboutDevelopers1: TMenuItem;
    HowtousethisSoftware1: TMenuItem;
    AboutThisSoftware1: TMenuItem;
    SubmitReview1: TMenuItem;
    Other1: TMenuItem;
    ViewStore1: TMenuItem;
    ContactDetails1: TMenuItem;
    Donthaveanaccount1: TMenuItem;
    dateTime: TTimer;
    dateItem: TLabel;
    General1: TMenuItem;
    ExitApplication1: TMenuItem;
    procedure imgBtnTogglePasswordClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure togglePassword;
    procedure textSlideTimer(Sender: TObject);
    procedure dateTimeTimer(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure logIn;
  public
    { Public declarations }
    callerID : TObject;
    DestinationID: TObject;
  end;

var
  Form1: TForm1;
  passwordShowing : Boolean;
  lblArray : array[1..5] of TLabel;
  prevPos, currPos : Integer;
  POSQuery : TPOSQuery;

implementation

uses dashboard_u;

{$R *.dfm}

procedure TForm1.btnLoginClick(Sender: TObject);
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
    ShowMessage('Welcome '+edtUName.Text);
    Form1.Hide;
    {if user is tryna login, then destinationid=nill}

    logIn;
    dashboard_u.Form2.Enabled:=True;
    dashboard_u.Form2.Show;


    {
    if (callerID<>nil) and (DestinationID<>nil) then
        begin
          //meaning that user wants to go to some page after clocking in

        end
    else
        begin
          dashboard_u.Form2.clockedIn := False;
        end;
    //{check whether they're permitted to view these pages
    (callerID as TForm).Enabled:=True;
    ShowMessage((DestinationID as TForm).Name);
    (DestinationID as TForm).Show;
    //}
  end
  else
  begin
    ShowMessage('Your username or password does not match'+#13+
    ' any record in our database');
    dashboard_u.Form2.clockedIn := False;
    (callerID as TForm).Enabled:=True;
    Form1.Hide;
  end;

end;

procedure TForm1.dateTimeTimer(Sender: TObject);
begin
dateItem.Caption := DateTimeToStr(now);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//initializing system variables
self.Position:=poDesktopCenter;
passwordShowing := False;
togglePassword;
POSQuery := TPOSQuery.create;
edtUName.Text := POSQuery.lastUser;

//populating lblArray
lblArray[1]:= lbl1;
lblArray[2]:= lbl2;
lblArray[3]:= lbl3;
lblArray[4]:= lbl4;
lblArray[5]:= lbl5;
prevPos := 5;
currPos := 1;
end;

procedure TForm1.imgBtnTogglePasswordClick(Sender: TObject);
begin
togglePassword;
end;

procedure TForm1.logIn;
begin
  dashboard_u.Form2.clockedIn := True;
  dashboard_u.Form2.Caption:='You are logged in '+edtUName.Text;


  with unit9.Form9 do
    begin

    end;
end;

procedure TForm1.textSlideTimer(Sender: TObject);
begin
if currPos<=5 then
  begin
    lblArray[currPos].Visible := True;
    lblArray[prevPos].Visible := False;
    lblArray[currPos].Font.Color := RGB(RANDOM(INFINITE) , RANDOM(INFINITE) , RANDOM(INFINITE));
    currPos := currPos + 1 ;
    prevPos := currPos-1;
  end
  else
  begin
    currPos := 1;
    prevPos := 5;
  end;

end;

procedure TForm1.togglePassword;
begin
if passwordShowing = True then
    begin
      passwordShowing := False;
      edtPassword.PasswordChar := chr(0);
      imgBtnTogglePassword.Picture.LoadFromFile('media\icons\lock-128.png');
    end
else
    begin
      passwordShowing := True;
      edtPassword.PasswordChar := '�';
      imgBtnTogglePassword.Picture.LoadFromFile('media\icons\unlocked-128.png');
    end;
end;

end.
