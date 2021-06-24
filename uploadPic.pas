unit uploadPic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, FileCtrl;

type
  TForm28 = class(TForm)
    FileListBox1: TFileListBox;
    Image1: TImage;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    fName : string;
  end;

var
  Form28: TForm28;

implementation
uses frmProducts;

{$R *.dfm}

procedure TForm28.Button1Click(Sender: TObject);
begin
//
fName := FileListBox1.FileName;
frmProducts.picName := fName;
frmProducts.Form27.Image1.Picture.LoadFromFile(fName);
frmProducts.Form27.changedp := True;
Self.Hide;
frmProducts.Form27.Enabled := True;
frmProducts.Form27.BringToFront;
end;

procedure TForm28.FileListBox1Change(Sender: TObject);
begin
if FileListBox1.FileName<>'' then
  Begin
    Image1.Picture.Assign(nil);
    Image1.Picture.LoadFromFile(FileListBox1.FileName);
  End;
end;

procedure TForm28.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TForm28.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := True;
Self.Hide;
frmProducts.Form27.Enabled := True;
frmProducts.Form27.BringToFront;
end;

procedure TForm28.FormCreate(Sender: TObject);
begin
Position := poDesktopCenter;
FileListBox1.directory := (ExtractFilePath(ParamStr(0))+ 'media\products\');
end;

procedure TForm28.FormShow(Sender: TObject);
begin
fName := '';
end;

end.
