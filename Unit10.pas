unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, pngimage,dbConn_u, DB,
  ADODB, UserAcc;

type
  TForm10 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    Image2: TImage;
    Label4: TLabel;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    procedure Image2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Account : TAccount;
  end;

var
  Form10: TForm10;

implementation
uses unit17;

{$R *.dfm}

procedure TForm10.Button5Click(Sender: TObject);
begin
//
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form15.show;
form10.hide;
end;

procedure TForm10.Image2Click(Sender: TObject);
begin
//         dbConn_u,
form15.show;
form10.hide;
end;

end.