unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, ComCtrls, userAcc;

type
  TForm14 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Button5: TButton;
    Panel12: TPanel;
    Button2: TButton;
    Button6: TButton;
    Panel13: TPanel;
    Label13: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Panel15: TPanel;
    Label17: TLabel;
    Edit9: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Edit10: TEdit;
    Label20: TLabel;
    Button3: TButton;
    Button7: TButton;
    Button8: TButton;
    Image1: TImage;
    RichEdit1: TRichEdit;
    Panel23: TPanel;
    Panel22: TPanel;
    Panel14: TPanel;
    Panel19: TPanel;
    Edit11: TEdit;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Button9: TButton;
    Button4: TButton;
    Panel18: TPanel;
    Timer1: TTimer;
    Label21: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure clearAll;
    procedure Timer1Timer(Sender: TObject);
    function isValid(x : String) : Boolean;
    procedure Edit11Change(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    receiptID : String;
    balance : Real;
  public
    { Public declarations }
    Account : TAccount;
  end;

var
  Form14: TForm14;
  PayMethod : String = '';
  CustomerID : STring;
  cost : real = 0;
  complete, pay : Boolean;
  amount : real = 0;
implementation
uses unit12, dashboard_u, dbConn_u;
{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
Panel1.BringToFront;
end;

procedure TForm14.Button4Click(Sender: TObject);
begin
//clear everything
Panel1.BringToFront;
CustomerID := 'None';
pay := False;
panel20.Caption := '';
Edit11.Enabled := True;
Edit11.Clear;
end;

procedure TForm14.Button6Click(Sender: TObject);
begin

if (length(edit7.Text) = 10) and (length(edit8.Text)=4) then
  begin
    with dbConn_u.DataModule1 do
      begin
         ADOQuery2.Close;
         ADOQuery2.SQL.Text := 'SELECT * FROM tblCustomers WHERE CardNumber = '+ QuotedStr(Edit7.Text)
         +' AND PASS_CODE = ' + Edit8.Text;
         ADOQuery2.Open;

         if ADOQuery2.RecordCount=1 then
          begin
            ShowMessage('WELCOME '+ ADOQuery2['firstName']);
            if (ADOQuery2['LoyaltyPoints']/0.9)> cost then
              begin
                pay := True;
                CustomerID := ADOQuery2['CustomerID'];
                balance := ADOQuery2['LoyaltyPoints'];
                Edit11.Enabled := False;
                Edit11.Text := FloatToStr(cost);
                Panel5.BringToFront;
                ShowMessage('PROCEEDING >>> NOW SIMPLY PRESS "MAKE PAYMENT"');
              end
            else ShowMessage('Error, you have insufficient funds.')
          end
         else ShowMessage('INVALID CARD NUMBER OR PASS CODE');
      end;
  end;

end;

procedure TForm14.Button9Click(Sender: TObject);
var dbCost : real;
    x : integer;
    Fn, ln : string;
begin
//
if Edit11.Text<>'' then
  begin
    amount := StrToFloat(Edit11.Text);
    if amount>=cost then
      begin
        RichEdit1.Lines.Add('');

        with dbConn_u.DataModule1 do
        begin
          if panel20.Caption='CMS' then
            begin
              fn := ADOQuery2['firstName'];
              ShowMessage('For being part of our customer membership system, we are giving you 5% off each item baught.');
              RichEdit1.Lines.Add('AMOUNT PAID'+#9+ FloatToStrF(amount*0.95, ffCurrency, 7 ,2));
              RichEdit1.Lines.Add('Thank you '+ ADOQuery2['firstName']);

            end
          else RichEdit1.Lines.Add('AMOUNT PAID'+#9+ FloatToStrF(amount, ffCurrency, 7 ,2));




          try
              dbProvider.BeginTrans;
              for x := 1 to unit12.numR-1 do
                begin
                  adoQuery2.close;
                  if panel20.Caption='CMS' then
                  adoQuery2.sql.text := 'INSERT INTO tblReceipts(ReceiptID, StockID, ProductCost, Quantity) VALUES('+quotedStr(receiptID)+','+
                      unit12.form12.StringGrid1.Cells[3,x] + ','+ FloatToStr(StrToFloat(unit12.form12.StringGrid1.Cells[1,x])*StrToInt(unit12.form12.StringGrid1.Cells[2,x])*0.95) +','+unit12.form12.StringGrid1.Cells[2,x]+')'
                else
                  adoQuery2.sql.text := 'INSERT INTO tblReceipts(ReceiptID, StockID, ProductCost, Quantity) VALUES('+quotedStr(receiptID)+','+
                      unit12.form12.StringGrid1.Cells[3,x] + ','+ FloatToStr(StrToFloat(unit12.form12.StringGrid1.Cells[1,x])*StrToInt(unit12.form12.StringGrid1.Cells[2,x])) +','+unit12.form12.StringGrid1.Cells[2,x]+')';
                  adoQuery2.execSql;

                  //update STock Count

                  adoquery2.close;
                  adoquery2.sql.text := 'UPDATE tblStock SET Quantity = (Quantity - '+ unit12.form12.StringGrid1.Cells[2,x]+') WHERE StockID = '+ unit12.form12.StringGrid1.Cells[3,x];
                  adoquery2.execSql;
                end;

              //calculate total of sale
              adoquery2.close;
              adoquery2.sql.text :='SELECT SUM(ProductCost) as COST from tblReceipts WHERE ReceiptID = '+quotedStr(receiptID)+' GROUP BY ReceiptID';
              adoquery2.open;
              dbCost := adoquery2['COST'];

              //create sale record
              adoquery2.close;
              adoquery2.sql.text := 'INSERT INTO tblSales(ReceiptID , CustomerID, EmployeeID, transactionDate, totalAmount)';
              adoquery2.sql.add(' VALUES('+quotedStr(receiptID)+','+ quotedStr(customerID)+ ',' + quotedStr(Account.getEmployeeID));
              adoquery2.sql.add(' , #'+DateToStr(Now)+'#,'+ floattostr(dbCost)+')');
              adoquery2.execSql;
              if Panel20.Caption = 'CMS' then
                begin
                  //FOR LOYALTY POINTS TRANSACTION
                  ADOQuery2.Close;
                  ADOQuery2.SQL.Text := 'INSERT INTO tblLoyaltyPoints(CustomerID, LoyaltyPoints, Type, ReceiptID) VALUES('+
                    QuotedStr(CustomerID) + ','+ FloatToStr(dbCost*0.9) +' , "PURCHASE",'+ QuotedStr(receiptID)+')';
                  ADOQuery2.ExecSQL;


                  //create notification
                  ln := 'YOU HAVE JUST MADE A SALE @ UMBILO PLAZA . TOTAL COST OF SALE, WITH 5% DISCOUNT ON ALL ITEMS,  = '+
                  FloatToStr(dbCost*0.9) + ' Points AND RECEIPT ID = '+receiptID+'. YOUR BALANCE IS '+ FloatToStr(Balance - dbCost*0.9)+' Points.';

                  ADOTable1.Close;
                  ADOTable1.TableName := 'tblNotifications';
                  ADOTable1.Filtered := False;
                  ADOTable1.Open;

                  ADOTable1.Insert;
                  ADOTable1['By']:= 'SYSTEM';
                  ADOTable1['ToWhom']:= CustomerID;
                  ADOTable1['Message']:= ln;
                  ADOTable1.Post;
                  ADOTable1.Close;

                  //FOR TBLCUSTOMERS
                  ADOQuery2.Close;
                  ADOQuery2.SQL.Text :='UPDATE tblCustomers SET LoyaltyPoints = '+ FloatToStr(balance - dbCost)+' WHERE CustomerID = ' + QuotedStr(CustomerID) ;
                  ADOQuery2.ExecSQL;

                  ShowMessage('Thank you '+ fN+' for being a loyal customer. Muchly Appreciated');
                end;
                CustomerID := 'None';
                pay := False;
                panel20.Caption := '';
                Edit11.Enabled := True;
                Edit11.Clear;
              dbProvider.CommitTrans;

        except on E: Exception do
        begin
          dbProvider.RollbackTrans;
          ShowMessage('Error, Sale could not be completed');
          exit;
        end;
        end;
        end;

        //
        RichEdit1.SelAttributes.Style := [fsUnderline, fsBold];
        RichEdit1.SelAttributes.Color := clGreen;
        RichEdit1.Lines.add('TOTAL CHANGE = '+#9+FloatToStrF(amount - cost , ffCurrency, 7 ,2)) ;
        //store in db, get name of cashier or admin using system
        panel22.Hide;
        complete := True;
        CustomerID := 'None';
        pay := False;
        panel20.Caption := '';
        Edit11.Enabled := True;
        Edit11.Clear;
      end

    else ShowMessage('Insufficient Amount of Money');
  end;

end;

procedure TForm14.clearAll;
var i:integer;
    obj : TObject;
begin

for i := 0 to self.ComponentCount-1 do
  begin
    obj := (self.Components[i] as TObject);
    if  (obj is TEdit) then
        (obj as TEdit).Clear
    else
    if  (obj is TComboBox) then
        begin
            (obj as TComboBox).Clear;
            (obj as TComboBox).ItemIndex:=-1
        end
    else
    if (obj is TRadioGroup ) then
        (obj as TRadioGroup).ItemIndex:=-1;
  end;
RichEdit1.Clear;
Panel19.Caption:='';
panel20.Caption:='';
panel21.Caption := '';
panel22.Show;
cost := 0;
CustomerID:='None';

end;

procedure TForm14.Edit11Change(Sender: TObject);
begin
if (Edit11.Text<>'') and (isValid (Edit11.Text))
  then
    begin
      Panel21.Caption := FloatToStrF( StrToFloat(Edit11.Text) - cost, ffCurrency, 7 ,2);
    end
  else Panel21.Caption:='0';

end;

procedure TForm14.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
if not (ord(key) in [8,ord('.'),48..57]) then
  key := chr(0);
end;

procedure TForm14.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TForm14.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if not complete then
  if MessageDlg('By leaving this page you are cancelling the payment.Are you sure you wish to leave this page?',
    mtConfirmation, [mbYes,mbNo],-1)= 6 then
        begin
          CanClose := False;
          clearAll;
          form12.show;
          form14.Hide;
          Form12.BitBtn1Click(self);
        end
    else CanClose:=False
  else
    begin
      clearAll;
      form12.show;
      Form12.BitBtn1Click(self);
      unit12.Form12.updateStock;
      form14.Hide;
    end;

end;

procedure TForm14.FormCreate(Sender: TObject);
begin
panel1.BringToFront;
self.Position:=poDesktopCenter;
complete := False;
Edit7.NumbersOnly := True;
Edit8.NumbersOnly := True;
Edit8.MaxLength := 4;
Edit7.MaxLength := 10;
CurrencyString := 'R';
end;

procedure TForm14.FormShow(Sender: TObject);
var x,w : integer;
    y,z : String ;
begin
Edit11.Enabled := True;
Edit11.Clear;
pay := False;

panel1.BringToFront;
complete := False;
with dbConn_u.DataModule1 do
    begin
      adoQuery2.close;
      adoQuery2.sql.text :='SELECT * from tblSales WHere (TransactionDate) = #'+DateToSTr(Now)+'# ORDER BY SaleIndex DESC';
      adoQuery2.open;
      receiptID:= DateToSTr(Now)+'#'+IntToStr(ADOQuery2.RecordCount+1);
    end;

CurrencyString :='R';
RichEdit1.Clear;
RichEdit1.Paragraph.TabCount :=1;
RichEdit1.Paragraph.Tab[0] := Round((RichEdit1.Width) /2);

RichEdit1.SelAttributes.Style := [fsUnderline, fsBold];
RichEdit1.SelAttributes.Size := 30;
RichEdit1.SelAttributes.Color := clBackground;

RichEdit1.Paragraph.Alignment:= taCenter;
RichEdit1.Lines.Add('~ UMBILO PLAZA ~');
RichEdit1.Lines.Add('');
RichEdit1.Paragraph.Alignment:= taRightJustify;

RichEdit1.SelAttributes.Size := 16;
RichEdit1.SelAttributes.Color := clBlack;

RichEdit1.Lines.Add('147 Prospect Road');
RichEdit1.Lines.Add('Umbilo');
RichEdit1.Lines.Add('Durban');
RichEdit1.Lines.Add('4001');
RichEdit1.Lines.Add('');

RichEdit1.Paragraph.Alignment:= taLeftJustify;
RichEdit1.Lines.Add('CASHIER NAME : '+ Account.getName+' '+Account.getSurname);
RichEdit1.Lines.Add('RECEIPT ID :'+ receiptID);
RichEdit1.Lines.Add('DATE : '+ DateTimeToStr(Now));

RichEdit1.Lines.Add('');

RichEdit1.SelAttributes.Style := [fsUnderline, fsBold];
RichEdit1.Lines.Add('PRODUCTS'+#9+'COST');
cost := 0;
with unit12.Form12 do
for x := 1 to unit12.numR-1 do
  begin
    RichEdit1.SelAttributes.Size := 10;
    cost := Cost + StrToFloat(StringGrid1.Cells[1,x])*StrToInt(StringGrid1.Cells[2,x]);
    RichEdit1.Lines.Add(StringGrid1.Cells[0,x]+' X '+StringGrid1.Cells[2,x] +#9+ FloatToStrF(StrToFloat(StringGrid1.Cells[1,x])*StrToInt(StringGrid1.Cells[2,x]), ffCurrency, 7, 2));
    //create query string
  end;

RichEdit1.SelAttributes.Style := [fsUnderline, fsBold];
RichEdit1.Lines.Add('');
RichEdit1.SelAttributes.Size := 16;
RichEdit1.SelAttributes.Color := clRed;
RichEdit1.Lines.add('TOTAL COST'+#9+FloatToStrF(cost , ffCurrency, 7 ,2)) ;
Panel19.Caption  := FloatToStrF(cost , ffCurrency, 7 ,2);
end;

procedure TForm14.Image1Click(Sender: TObject);
begin
if MessageDlg('By leaving this page you are cancelling the payment.Are you sure you wish to leave this page?',
    mtConfirmation, [mbYes,mbNo],-1)= 6 then
      begin
        form12.show;
        form14.Hide;
      end;


end;

function TForm14.isValid(x : String): Boolean;
begin
Result := (StrToFloat(x) > cost);
end;

procedure TForm14.Panel10Click(Sender: TObject);
begin
panel4.BringToFront;
PayMethod := panel10.Caption;
Panel20.Caption := PayMethod;

end;
//19 - amount due - 20 method - 21 - change
procedure TForm14.Panel7Click(Sender: TObject);
begin
panel2.BringToFront;
PayMethod := panel7.Caption;
Panel20.Caption := PayMethod;
end;

procedure TForm14.Panel8Click(Sender: TObject);
begin
panel3.BringToFront;
Panel20.Caption := 'CMS';

CustomerID := 'None';
pay := False;
Edit11.Enabled := True;
balance := 0;
Edit11.Clear;
end;

procedure TForm14.Panel9Click(Sender: TObject);
begin
panel5.BringToFront;
Panel20.Caption := 'CASH';

CustomerID:='None';
pay := False;
balance := 0;
Edit11.Enabled := True;
Edit11.Clear;
end;

procedure TForm14.Timer1Timer(Sender: TObject);
begin
//
end;

end.
