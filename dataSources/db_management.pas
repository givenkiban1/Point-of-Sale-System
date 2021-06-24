unit db_management;

interface

uses dbConn_u , SysUtils, Messages, Dialogs;

type
TPOSQuery = class(TObject)

private
F : TextFile;
function getLastUser : string;
const BACKUP = 'dataSources/backup.txt';

procedure writeToFile(location, Contents : String ; ResetVar : Boolean);
//    FILE @ POS=1 : for last logged in user
const FILE_NAMES : array[1..4] of string =( 'sresu.dll','','','');
public
lastUser : String;

constructor create;
function userExists(staffUserName , staffPassword : String) : Boolean;
function createEmployee(fName , surname, gender, email,said , password : String;
  AccStat ,Admin :Boolean ; hWage :Real): String;

function createVendor(fName , surname, company, email, address , phoneNo, Gender: String;
  AccStat : Boolean): String;

function updateVendor(vendorID: Integer; fName , surname, company, email, address , phoneNo, Gender: String;
  AccStat : Boolean): String;

function updateEmployee(empID , fName , surname, gender, email,said , password : String;
  AccStat ,Admin :Boolean ; hWage :Real ; dFired : Variant): String;

procedure maintainDB;
//function createSale();

end;

implementation

{ TPOSQuery }

constructor TPOSQuery.create;
begin
lastUser := getLastUser;

end;


function TPOSQuery.createEmployee(fName, surname, gender, email, said,
  password: String; AccStat, Admin: Boolean; hWage :Real): String;
var
  userName : string;
  account,c :string;
  x:Integer;
  ans : Boolean;
begin
//
ans := False;
if Admin then account:='Admin' else account:='Emply';
userName:=fName[1]+surname[1]+account;

with dbConn_u.DataModule1 do
  begin
    qryLogin.Close;
    qryLogin.SQL.Text:='Select EmployeeID from tblEmployees where '+
      'EmployeeID = "%'+userName+'%" ORDER BY EmployeeID ASC';
    qryLogin.Open;

    if qryLogin.RecordCount=0 then
      userName:=userName+'1'
    else
    begin
      c:= qryLogin['EmployeeID'];
      x:= StrToInt(Copy(c , 8, length(c)-7));
      userName:=userName+IntToStr(x+1);
    end;

    qryLogin.Close;
    qryLogin.SQL.Text:='INSERT INTO tblEmployees VALUES(';
    qryLogin.SQL.Add(QuotedStr(userName)+','+QuotedStr(fName)+','+QuotedStr(surname)+',');
    qryLogin.SQL.Add(QuotedStr(gender)+','+QuotedStr(email)+','+QuotedStr(said)+',');
    qryLogin.SQL.Add(QuotedStr(password)+','+BoolToStr(AccStat)+',#'+DateToStr(Now)+'#,Null,');
    qryLogin.SQL.Add(BoolToStr(Admin)+','+FloatToStr(hWage)+')');
    ShowMessage(qryLogin.SQL.Text);

    if qryLogin.ExecSQL>0 then ans:=True
      else ans:=False;
    qryLogin.Close;

  end;
  if ans then Result:=userName else Result:='';

end;

function TPOSQuery.createVendor(fName, surname, company, email, address,
  phoneNo, Gender: String; AccStat: Boolean): String;

var
  no : Integer;
  s : String;
  suppID : String;
begin
with dbConn_u.DataModule1 do
    begin
      qryLogin.Close;
      qryLogin.SQL.Text:='SELECT supplierID from tblSuppliers ORDER BY supplierID DESC';
      qryLogin.Open;
      qryLogin.First;

      s := qryLogin['supplierID'];
      ShowMessage(s);
      no := StrToInt(s);
      suppID := IntToStr(no+1);
      ShowMessage(suppID);
      loginQuery.Close;

      loginQuery.SQL.Text:='INSERT INTO tblSuppliers VALUES(';

      loginQuery.SQL.Add(':sid,:fn,:sn,:co,:e,:add,:num, :acc, :gen )');

      loginQuery.Parameters.ParamValues['sid'] := suppID;
      loginQuery.Parameters.ParamValues['fn'] := fName;
      loginQuery.Parameters.ParamValues['sn'] := surname;
      loginQuery.Parameters.ParamValues['co'] := company;
      loginQuery.Parameters.ParamValues['e'] := email;
      loginQuery.Parameters.ParamValues['add'] := address;
      loginQuery.Parameters.ParamValues['num'] := phoneNo;
      loginQuery.Parameters.ParamValues['acc'] := AccStat;
      loginQuery.Parameters.ParamValues['gen'] := Gender;

      ShowMessage(loginQuery.SQL.Text);

      if loginQuery.ExecSQL>0 then
        Result := suppID
      else
        Result := '';


    end;

end;

function TPOSQuery.getLastUser: string;
var fn,ln : string;
begin
fn := ExtractFilePath(ParamStr(0))+'dataSources/'+FILE_NAMES[1] ;
if FileExists(fn) then
begin
  AssignFile(F , fn);
  Reset(F);
  ln:='';

  while Not Eof(F) do
    begin
      Readln(F, ln);
    end;
  CloseFile(F);
  Result := copy(ln , 1 , pos('#',ln)-1);
end
  else
    Result := 'Enter username';

end;

procedure TPOSQuery.maintainDB;
var txt : TextFile;
    line : string;
    i : integer;
begin
//This is a method created to maintain the database.
//if application closed, without employee getting to logout, then
//once application starts, this method will get last recorded datetime in
//our backup txt file and assign that time as the time when employee was last
//logged on.
AssignFile(txt, BACKUP);
if FileExists(BACKUP) then
  begin
    Reset(txt);
    while not eof(txt) do
      Readln(txt, line);
    if line <> '' then

    with dbConn_u.DataModule1.qryMaintenance do
      begin
      Close;
      TableName := 'tblAttendance';
      Open;
      Filtered := False;
      Filter := 'ClockOutTime = Null';
      Filtered := True;
      if RecordCount=1 then
        begin
          First;
          i := FieldByName('RecordNo').AsInteger;
        end;
      Filtered:=False;
      Edit;
      FieldByName('ClockOutTime').Value := StrToDateTime(line);
      Post;
      ShowMessage('Change Made');

       Close;
      end;
  end
else Rewrite(txt);
CloseFile(txt);

end;

function TPOSQuery.updateEmployee(empID , fName, surname, gender, email,
  said, password: String; AccStat, Admin: Boolean; hWage: Real ; dFired : Variant): String;
begin
with dbConn_u.DataModule1 do
    begin
      loginQuery.Close;
      loginQuery.SQL.Text:='UPDATE tblEmployees SET firstName = '+ QuotedStr(fName) +', Surname = '+QuotedStr(surname)+',';
      loginQuery.SQL.Add('Gender = '+QuotedStr(gender)+', Email = '+QuotedStr(email)+', SAID = '+QuotedStr(said)+', Password = '+QuotedStr(password)+',');
      loginQuery.SQL.Add('ACCOUNT_STATUS = '+BoolToStr(AccStat, True)+', Admin = '+BoolToStr(AccStat, True)+', HourlyWage = '+FloatToStr(hWage)+'  WHERE EmployeeID = '+QuotedStr(empID));

      ShowMessage(loginQuery.SQL.Text);

      if loginQuery.ExecSQL>0 then
        Result := 'EMPLOYEE PROFILE UPDATED'
      else
        Result := 'ERROR WHILST UPDATING EMPLOYEE PROFILE, TRY LATER.  ';


    end;
end;

function TPOSQuery.updateVendor(vendorID: Integer; fName, surname, company, email,
  address, phoneNo, Gender: String; AccStat: Boolean): String;
begin
//
with dbConn_u.DataModule1 do
    begin
      loginQuery.Close;
      loginQuery.SQL.Text:='UPDATE tblSuppliers SET firstName = :fn, Surname = :sn,';
      loginQuery.SQL.Add('Gender = :gen, Email = :e, Company = :co, MobileNumber = :num,');
      loginQuery.SQL.Add('Address = :add, Account_Status = :acc WHERE SupplierID = :sid');

      loginQuery.Parameters.ParamValues['sid'] := vendorID;
      loginQuery.Parameters.ParamValues['fn'] := fName;
      loginQuery.Parameters.ParamValues['sn'] := surname;
      loginQuery.Parameters.ParamValues['co'] := company;
      loginQuery.Parameters.ParamValues['e'] := email;
      loginQuery.Parameters.ParamValues['add'] := address;
      loginQuery.Parameters.ParamValues['num'] := phoneNo;
      loginQuery.Parameters.ParamValues['acc'] := AccStat;
      loginQuery.Parameters.ParamValues['gen'] := Gender;

      ShowMessage(loginQuery.SQL.Text);

      if loginQuery.ExecSQL>0 then
        Result := 'VENDOR PROFILE UPDATED'
      else
        Result := 'ERROR WHILST UPDATING VENDOR PROFILE, TRY LATER.  ';


    end;

end;

function TPOSQuery.userExists(staffUserName, staffPassword : String): Boolean;
var count : Integer;
begin
//                                            .

with dbConn_u.DataModule1 do
    begin

      loginQuery.Close;
      loginQuery.SQL.Text:='SELECT EmployeeID,Password FROM tblEmployees WHERE EmployeeID';
      loginQuery.SQL.Add(' LIKE :UNAME AND Password LIKE :PASS ');
      loginQuery.Parameters.ParamValues['UNAME'] := staffUserName;
      loginQuery.Parameters.ParamValues['PASS'] := staffPassword;
      loginQuery.Open;

      count :=loginQuery.RecordCount;
      loginQuery.Close;

      if count=1 then
        begin
          writeToFile(ExtractFilePath(ParamStr(0))+'dataSources/'+FILE_NAMES[1] , staffUserName+'#'+DateTimeToStr(Now), False);
          Result := True;
        end
      else Result := False;

    end;
end;

procedure TPOSQuery.writeToFile(location, Contents: String; ResetVar: Boolean);
begin
  AssignFile(F, location);
  if (FileExists(location) and (ResetVar=False)) then
          Append(F)
  else Rewrite(F);

  Writeln(F , sLineBreak+Contents);
  CloseFile(F);
end;

end.
