unit dbConn_u;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDataModule1 = class(TDataModule)
    dbProvider: TADOConnection;
    loginQuery: TADOQuery;
    ADOTable1: TADOTable;
    qryLogin: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    qryMaintenance: TADOTable;
    updateTbl: TADOTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    defaultLocation : string;
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
dbProvider.Connected := False;
dbProvider.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
      ExtractFilePath(ParamStr(0))+'dataSources\db\umbiloplaza.mdb'+
      ';Persist Security Info=False';
dbProvider.Connected := True;

end;


end.
