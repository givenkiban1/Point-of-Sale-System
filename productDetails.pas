unit productDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TForm18 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Timer1: TTimer;
    Panel4: TPanel;
    Label4: TLabel;
    Panel5: TPanel;
    procedure Panel4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel4MouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure resetAll;
    procedure getNames;
    procedure Panel4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    callerID : TForm;
    arrPics : array of string;
    location : String;
  end;

var
  Form18: TForm18;
  x : Integer = 0;

implementation
uses unit13,unit12;
{$R *.dfm}

procedure TForm18.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize := False;
end;

procedure TForm18.FormCreate(Sender: TObject);
begin
Panel4.Color:=clBtnFace;
Panel4.Font.Color:=clBlack;
self.Position:= poDesktopCenter;
resetAll;
end;

procedure TForm18.getNames;
var p,num,xx:integer;
    loci : string;
begin
loci:=location;
num := 0;
if pos(';', loci)>0 then
  begin
    p:=pos(';', loci);
    //getting number of filenames seperated by the ";"-semi-colon delimiter
    while p>0 do
      begin
        delete(loci,1,p);
        Inc(num);
        p:=pos(';', loci);
      end;
    if loci<>'' then Inc(num);

    SetLength(arrPics, num);

    xx:=0;
    loci:=location;
    p:=pos(';', loci);

    while p>0 do
      begin
        arrPics[xx]:= copy(loci,1,p-1);
        delete(loci,1,p);
        p:=pos(';', loci);
        Inc(xx);
      end;
    arrPics[xx]:=loci;
    Timer1.Enabled:=True;
    try
    Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +'media/dbImages/'+arrPics[0]);
    except on E: Exception do
      begin
        ShowMessage('Error, Image could not be loaded.');
        Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\media\icons\not_found.jpg');
        Timer1.Enabled := False;
      end;
    end;
  end
else
  begin
    SetLength(arrPics,1);
    arrPics[0]:=location;
    Timer1.Enabled:=false;
    try
    Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +'media/dbImages/'+arrPics[0]);
    except on E: Exception do
      begin
        ShowMessage('Error, Image could not be loaded.');
        Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\media\icons\not_found.jpg');
      end;
    end;
  end;
end;

procedure TForm18.Panel4Click(Sender: TObject);
begin
callerID.Enabled:=True;
Timer1.Enabled:= false;
form18.Hide;
resetAll;
end;

procedure TForm18.Panel4MouseLeave(Sender: TObject);
begin
Panel4.Color:=clBtnFace;
Panel4.Font.Color:=clBlack;
end;

procedure TForm18.Panel4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Panel4.Color:=clRed;
Panel4.Font.Color:=clWhite;
end;

procedure TForm18.resetAll;
var y:integer;
begin
Panel3.Caption:='PRODUCT NAME';
Panel2.Caption:='COST : $$';
Panel1.Caption:='BY COMPANY/BRAND  NAME';
Timer1.Enabled:=false;
x:=0;

if length(arrPics)>0 then

for y:=0 to length(arrPics)-1 do
  arrPics[y] := '';
location:='';
//and the picture too
end;

procedure TForm18.Timer1Timer(Sender: TObject);
begin
Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+ 'media/dbImages/'+arrPics[x]);
if x<Length(arrPics)-1 then Inc(x) else x:=0;
end;

end.
