unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, pngimage, ExtCtrls,Unit8,unit6,unit11,unit10;

type
  TForm15 = class(TForm)
    GridPanel1: TGridPanel;
    Panel2: TPanel;
    Image2: TImage;
    Panel10: TPanel;
    Panel3: TPanel;
    Image3: TImage;
    Panel13: TPanel;
    Panel4: TPanel;
    Image4: TImage;
    Panel14: TPanel;
    Panel23: TPanel;
    Image12: TImage;
    Panel24: TPanel;
    Panel5: TPanel;
    Image5: TImage;
    Panel11: TPanel;
    Panel6: TPanel;
    Image6: TImage;
    Panel15: TPanel;
    Panel8: TPanel;
    Image8: TImage;
    Panel16: TPanel;
    procedure Panel11Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Panel16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.Panel10Click(Sender: TObject);
begin
unit11.Form11.Show;
Form15.hide;
end;

procedure TForm15.Panel11Click(Sender: TObject);
begin
//
unit8.Form8.Show;
Form15.hide;
end;

procedure TForm15.Panel14Click(Sender: TObject);
begin
unit10.Form10.Show;
Form15.hide;
end;

procedure TForm15.Panel15Click(Sender: TObject);
begin
//Form2.Color:=RGB(255,140,0);
unit6.Form6.Show;
Form15.Hide;
end;

procedure TForm15.Panel16Click(Sender: TObject);
begin
//ShowMessage(); colorto
//255,140,0
end;

end.
