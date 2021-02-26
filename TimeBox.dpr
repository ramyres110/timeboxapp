program TimeBox;

uses
  Vcl.Forms,
  UMain in 'src\UMain.pas' {FrmMain},
  UStrUtils in 'src\utils\UStrUtils.pas',
  UNumberUtils in 'src\utils\UNumberUtils.pas',
  UFrmSettings in 'src\forms\UFrmSettings.pas' {FrmSettings},
  UFrmAbstract in 'src\forms\UFrmAbstract.pas' {FrmAbstract},
  UAppUtils in 'src\utils\UAppUtils.pas',
  UFrmAbout in 'src\forms\UFrmAbout.pas' {FrmAbout},
  USettings in 'src\entities\USettings.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TimeBox';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
