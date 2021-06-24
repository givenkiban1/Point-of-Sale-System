unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, dbConn_u, DBGrids, pngimage, DB,
  ADODB, unit19, UserAcc, unit29;

type
  TForm8 = class(TForm)
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
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    Label4: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    BitBtn4: TBitBtn;
    GridPanel2: TGridPanel;
    BitBtn3: TBitBtn;
    Button5: TButton;
    GridPanel3: TGridPanel;
    Button3: TButton;
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clearAll;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Account : TAccount;
    procedure updateStat;
    procedure fixDb;
  end;

var
  Form8: TForm8;
  searching: Boolean = False;
  sorting: Boolean = False;
  searchquery : string = '';
implementation

uses unit17;
{$R *.dfm}

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := -1;
  ComboBox2.ItemIndex := -1;
  ComboBox3.ItemIndex := -1;
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox1.Text:='';

  Edit1.Clear;
  fixDb;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
//
  if (ComboBox2.ItemIndex > -1) and (Edit1.Text<>'') then
    begin

        searching := true;
        sorting := false;
        updateStat;

        ADOQuery1.Close;
        ADOQuery1.SQL.text := 'Select * from tblSuppliers WHERE ' + ComboBox2.Text + ' LIKE ' + QuotedStr('%'+Edit1.Text+'%');
        searchquery :=ADOQuery1.SQL.text;
        ADOQuery1.Open;

        DBGrid1.Columns[0].Width := 100;
        DBGrid1.Columns[1].Width := 150;
        DBGrid1.Columns[2].Width := 150;
        DBGrid1.Columns[3].Width := 200;
        DBGrid1.Columns[4].Width := 200;
        DBGrid1.Columns[5].Width := 200;
        DBGrid1.Columns[6].Width := 100;
        DBGrid1.Columns[7].Width := 70;
    end
  else
    ShowMessage('You need to select a field and enter search value ');

end;

procedure TForm8.BitBtn3Click(Sender: TObject);
begin
fixDb;
end;

procedure TForm8.BitBtn4Click(Sender: TObject);
begin
  if (ComboBox1.ItemIndex > -1) and (ComboBox3.ItemIndex > -1) then
  begin
    ADOQuery1.Close;
    sorting := true;
    if searching then
    begin
      if MessageDlg('Do you wish to sort the search results ?', mtWarning,
        [mbYes, mbNo], 0) = 6 then
        ADOQuery1.SQL.text := searchquery + 'ORDER BY ' + ComboBox1.Text + ' ' +
          ComboBox3.Text
      else
      begin
        ADOQuery1.SQL.Text :=
          'Select * from tblSuppliers ORDER BY ' + ComboBox1.Text + ' ' +
          ComboBox3.Text;
        searchquery:='';
        searching := False;
      end;
    end
    else
    ADOQuery1.SQL.Text := 'Select * from tblSuppliers ORDER BY ' + ComboBox1.Text + ' ' +ComboBox3.Text;

    updateStat;

    //else



    ADOQuery1.Open;

    DBGrid1.Columns[0].Width := 100;
    DBGrid1.Columns[1].Width := 150;
    DBGrid1.Columns[2].Width := 150;
    DBGrid1.Columns[3].Width := 200;
    DBGrid1.Columns[4].Width := 200;
    DBGrid1.Columns[5].Width := 200;
    DBGrid1.Columns[6].Width := 100;
    DBGrid1.Columns[7].Width := 70;
    sorting := True;
  end
  else
    ShowMessage
      ('You need to select both a field and an ORDER in order to sort');
end;

procedure TForm8.Button1Click(Sender: TObject);
var
  x: Integer;
  siD: Integer;
begin
  //
  x := ADOQuery1.recNo;
  siD := ADOQuery1['SupplierID'];
  if MessageDlg('Are you sure you wish to delete record ' + IntToStr(x),
    mtWarning, [mbYes, mbNo], 0) = 6 then
  begin
    try
      ADOQuery1.Connection.BeginTrans;
      ADOQuery1.Close;
      ADOQuery1.SQL.Text := 'DELETE FROM tblSuppliers where supplierID = ' + IntToStr
        (siD);
      if ADOQuery1.ExecSQL > 0 then
        ShowMessage('Record No. ' + IntToStr(x) + ' deleted')
      else
        ShowMessage(
          'ERROR DELETING RECORD. TRY AGAIN LATER, HOWEVER IF PROBLEM PERSISTS CONTACT ADMINISTRATOR');
      ADOQuery1.Connection.CommitTrans;
      fixDb;
    except on E: Exception do
      begin
        ADOQuery1.Connection.RollbackTrans;
        ShowMessage('There has been an error, contact IT department.');
        fixDb;
        exit;
      end;
    end;

  end
  else
    ShowMessage('No record deleted.');

end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  unit19.Form19.Panel2.Caption := 'UPDATE VENDOR';
  with unit19.Form19 do
  begin
    edtFn.Text := ADOQuery1['firstName'];
    edtSn.Text := ADOQuery1['Surname'];
    ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(ADOQuery1['Gender']);
    edtEm.Text := ADOQuery1['Email'];
    edtCo.Text := ADOQuery1['Company'];
    edtCell.Text := ADOQuery1['MobileNumber'];
    edtAdd.Text := ADOQuery1['Address'];
    CheckBox1.Checked := ADOQuery1['Account_Status'];
    vID := ADOQuery1['SupplierID'];
  end;
  unit19.Form19.Show;
  self.Enabled := False;

end;

procedure TForm8.Button3Click(Sender: TObject);
begin
with unit29.Form29 do
  begin
    item := self.ADOQuery1['Company'];
    productID:= -1;
    suppID:= self.ADOQuery1['SupplierID'];
    self.Enabled := False;
    from := self;
    Form29.Show;
  end;
end;

procedure TForm8.Button5Click(Sender: TObject);
begin
  unit19.Form19.Panel2.Caption := 'CREATE NEW VENDOR';
  unit19.Form19.Show;
  self.Enabled := False;
end;

procedure TForm8.clearAll;
var
  i: Integer;
  obj: TObject;
begin

  for i := 0 to self.ComponentCount - 1 do
  begin
    obj := (self.Components[i] as TObject);
    if (obj is TEdit) then (obj as TEdit)
      .Clear
    else if (obj is TComboBox) then
    begin (obj as TComboBox)
      .Clear; (obj as TComboBox)
      .ItemIndex := -1
    end
    else if (obj is TCheckBox) then (obj as TCheckBox)
      .Checked := False;
  end;

  self.SetFocus;
  self.Button5.SetFocus;
  unit17.Form15.Show;
  Unit8.Form8.Hide;
end;

procedure TForm8.fixDb;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'Select * from tblSuppliers';
  ADOQuery1.Open;

  DBGrid1.Columns[0].Width := 100;
  DBGrid1.Columns[1].Width := 150;
  DBGrid1.Columns[2].Width := 150;
  DBGrid1.Columns[3].Width := 200;
  DBGrid1.Columns[4].Width := 200;
  DBGrid1.Columns[5].Width := 200;
  DBGrid1.Columns[6].Width := 100;
  DBGrid1.Columns[7].Width := 70;

end;

procedure TForm8.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin

if (NewHeight>=460) and (NewWidth>=800)  then
  Resize := True
else Resize := False;

end;

procedure TForm8.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose := False;
Image2Click(self);
end;

procedure TForm8.FormCreate(Sender: TObject);
var
  i: Integer;
begin
(Sender as TForm).Position := poScreenCenter;
(Sender as TForm).DefaultMonitor := dmMainForm;
  fixDb;
  for i := 0 to ADOQuery1.FieldCount - 1 do
  begin
    ComboBox1.Items.Add(ADOQuery1.Fields[i].FieldName);
    ComboBox2.Items.Add(ADOQuery1.Fields[i].FieldName);
  end;

end;

procedure TForm8.FormShow(Sender: TObject);
begin
  BitBtn3.SetFocus;
  fixDb;
end;

procedure TForm8.Image2Click(Sender: TObject);
begin
  clearAll;
end;

procedure TForm8.updateStat;
begin
  if searching = False then
  begin
    ComboBox2.ItemIndex := -1;
    Edit1.Clear;
  end;

  if sorting = False then
  begin
    ComboBox1.ItemIndex := -1;
    ComboBox3.ItemIndex := -1;
  end;
end;

end.
