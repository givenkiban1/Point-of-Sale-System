program POS_p;



uses
  Forms,
  Unit5 in 'Unit5.pas' {Form5},
  dbConn_u in 'dbConn_u.pas' {DataModule1: TDataModule},
  db_management in 'db_management.pas',
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9},
  Unit11 in 'Unit11.pas' {Form11},
  Unit12 in 'Unit12.pas' {Form12},
  Unit13 in 'Unit13.pas' {Form13},
  Unit14 in 'Unit14.pas' {Form14},
  Unit16 in 'Unit16.pas' {Form16},
  Unit17 in 'Unit17.pas' {Form15},
  productDetails in 'productDetails.pas' {Form18},
  stockitems in 'stockitems.pas',
  Unit19 in 'Unit19.pas' {Form19},
  Unit21 in 'Unit21.pas' {reportPage},
  Unit22 in 'Unit22.pas' {Form22},
  payments in 'payments.pas' {Form23},
  Unit20 in 'Unit20.pas' {Form20},
  aboutPage_u in 'aboutPage_u.pas' {AboutPage},
  Unit1 in 'Unit1.pas' {Form1},
  dashboard_u in 'dashboard_u.pas' {Form2},
  Unit24 in 'Unit24.pas' {Form24},
  customerForm in 'customerForm.pas' {Form25},
  Unit26 in 'Unit26.pas' {Form26},
  frmProducts in 'frmProducts.pas' {Form27},
  uploadPic in 'uploadPic.pas' {Form28},
  Unit29 in 'Unit29.pas' {Form29};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Title := 'GINTEC - UMBILO PLAZA POS';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm27, Form27);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TreportPage, reportPage);
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TAboutPage, AboutPage);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm24, Form24);
  Application.CreateForm(TForm25, Form25);
  Application.CreateForm(TForm26, Form26);
  Application.CreateForm(TForm28, Form28);
  Application.CreateForm(TForm29, Form29);
  Application.Run;
end.
