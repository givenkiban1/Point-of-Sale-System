unit aboutPage_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TAboutPage = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    readFrom, heading: String;
    procedure displayAll;
  end;

var
  AboutPage: TAboutPage;

implementation

uses dashboard_u;

{$R *.dfm}

procedure TAboutPage.displayAll;
var
  txt: TextFile;
  line: string;
begin
//with this procedure, we are going to be displaying the textfile which has been requested
//depending on whether the user asked to see information about
//developers or the shop itself.

  RichEdit1.Clear;
  RichEdit1.SelAttributes.Name := 'System';
  RichEdit1.SelAttributes.Size := 20;
  RichEdit1.SelAttributes.Style := [];
  //ShowMessage(ExtractFilePath(ParamStr(0))+ readFrom);
  if FileExists(ExtractFilePath(ParamStr(0))+ readFrom) then
  begin

    RichEdit1.SelAttributes.Style := [fsUnderline, fsBold, fsItalic];
    RichEdit1.SelAttributes.Size := 30;
    RichEdit1.SelAttributes.Name := 'Timid';
    RichEdit1.Lines.Add(heading);
    RichEdit1.SelAttributes.Style := [fsItalic];
    RichEdit1.SelAttributes.Size := 15;
    RichEdit1.SelAttributes.Name := 'Times New Roman';

    AssignFile(txt, ExtractFilePath(ParamStr(0))+ readFrom);
    Reset(txt);
    while not eof(txt) do
    begin
      Readln(txt, line);
      RichEdit1.Lines.Add(line);
    end;
    CloseFile(txt);
  end
  else
  //in the case that the requested file is missing or damaged, we simply show an error message
    RichEdit1.Lines.Add(
      'The required File is missing or has been damaged. Please Contact Admin');
end;

procedure TAboutPage.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//we hide this form and return to previous form.
CanClose := False;
dashboard_u.form2.show;
self.Hide;
end;

procedure TAboutPage.FormCreate(Sender: TObject);
begin
Position := poScreenCenter;
end;

procedure TAboutPage.FormResize(Sender: TObject);
begin
//whenever user tries to resize the form, we refresh so
//that everything is still intact.
RichEdit1.Refresh;
end;

procedure TAboutPage.FormShow(Sender: TObject);
begin
//when ever the form shows up, we call this method
//which will handle the loading and displaying of the
//relevant textfile which has information about
//what the user wants to read.
displayAll;
end;

end.
