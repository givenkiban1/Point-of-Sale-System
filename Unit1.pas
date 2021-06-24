unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons, pngimage,
  ExtCtrls;

type
  TForm1 = class(TForm)
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Image2: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    GridPanel3: TGridPanel;
    Panel3: TPanel;
    GridPanel2: TGridPanel;
    Label4: TLabel;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure displayAll;
  end;

var
  Form1: TForm1;

implementation
uses unit17;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
//when the reset button is pressed, we initialise every
//input component to their initial state, which is either blank or 0.
  ComboBox1.ItemIndex := -1;
  ComboBox2.ItemIndex := -1;
  ComboBox3.ItemIndex := -1;
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox1.Text:='';
  Panel4.Color := clNone;
  Panel4.Caption :='';
  Panel4.ParentColor := true;
  Edit1.Clear;
  ADOTable1.Filtered := False;
  ADOTable1.Filter := '';
  displayAll;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
//when the user is searching
if (ComboBox2.ItemIndex=4) then
//if they only for date , then we run the code below
  begin
      ADOTable1.Filtered := False;
      ADOTable1.Filter:= ComboBox2.Text + ' LIKE #'+ DateToStr(DateTimePicker1.Date) +'#';
      ADOTable1.Filtered := True;
  end
else
//else , we run the following.
if (ComboBox2.ItemIndex > -1) and (Edit1.Text<>'') then
    begin
      ADOTable1.Filtered := False;
      if ComboBox2.ItemIndex = 0 then
        ADOTable1.Filter:= ComboBox2.Text + ' = '+ Edit1.Text
      else
        ADOTable1.Filter:= ComboBox2.Text + ' LIKE '+ QuotedStr('*'+Edit1.Text+'*');
      ADOTable1.Filtered := True;
    end
else
  //and if they did not pick which field to search in, we
  //cANNOT PROCEED AND THUS REQUEST THEM TO MAKE CHANGES.
    ShowMessage('You need to select a field and enter search value ');
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
//when user is sorting

if (ComboBox1.ItemIndex > -1) and (ComboBox3.ItemIndex > -1) then
//if they have entered both a field and an ORDER, then we sort
  begin
    ADOTable1.Filtered := False;
    ADOTable1.Sort := ComboBox1.Text + ' '+ ComboBox3.Text;
    ADOTable1.Filtered := True;
  end
else ShowMessage('You need to select both a field and an ORDER in order to sort');

end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
//when user presses button to refresh data.
displayAll;
end;

procedure TForm1.Button1Click(Sender: TObject);
var sum : real;
begin
//when user presses button to calculate total sales from
//current data being displayed.
ADOTable1.First;
sum := 0;

while not ADOTable1.Eof do
  begin
    sum := sum + ADOTable1['Amount'];
    ADOTable1.Next;
  end;

Panel4.Caption := 'Total Sales Made = '+FloatToStrF(sum, ffCurrency, 7, 2);
Panel4.Color := clHighlight;

end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin

//
if ComboBox2.ItemIndex=-1 then
  begin
    Edit1.Enabled := false;
    Edit1.Clear;
  end
  else
if ComboBox2.ItemIndex = 4 then
  begin
    DateTimePicker1.Show;
    Edit1.Clear;
    Edit1.Enabled := False;
  end
  else
if ComboBox2.ItemIndex=0 then
  begin
    Edit1.NumbersOnly := True;
  end
  else
  begin
    DateTimePicker1.Hide;
    Edit1.Enabled := True;
    Edit1.NumbersOnly := False;
  end;

end;

procedure TForm1.displayAll;
begin
//this method has been created to dislay all the records
//that are required.
Panel4.Color := clTeal;
Panel4.Caption := '';

DateTimePicker1.DateTime := now;
ADOTable1.Filtered := False;
ADOTable1.Filter := '';

ADOTable1.Close;
ADOTable1.TableName := 'tblTransactions';
ADOTable1.Open;

ADOTable1.Refresh;

DBGrid1.Columns[0].Width := 50;
DBGrid1.Columns[1].Width := 100;
DBGrid1.Columns[2].Width := 150;
DBGrid1.Columns[3].Width := 150;
DBGrid1.Columns[4].Width := 100;
DBGrid1.Columns[5].Width := 100;

end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := false;
Image2Click(self);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i : integer;
begin
CurrencyString := 'R';
(Sender as TForm).Position:=poScreenCenter;
(Sender as TForm).DefaultMonitor := dmMainForm;
displayAll;

ComboBox2.Items.Clear;
ComboBox1.Items.Clear;

//GETTING THE FIELD NAMES FROM DATABASE AND INSERTING THEM IN COMBOBOX
for i := 0 to (ADOTable1.Fields.Count)-1 do
  begin
    ComboBox2.Items.Add(ADOTable1.Fields[i].FieldName);
    ComboBox1.Items.Add(ADOTable1.Fields[i].FieldName);
  end;
ComboBox2.ItemIndex := -1;
ComboBox1.ItemIndex := -1;
ComboBox3.ItemIndex := -1;
DateTimePicker1.Hide;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
//everytime the form shows, we fetch the latest data available
displayAll;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
unit17.Form15.Show;
self.Hide;
end;

end.
