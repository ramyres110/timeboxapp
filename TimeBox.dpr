program TimeBox;

uses
  Vcl.Forms,
  UMain in 'src\UMain.pas' {FrmMain},
  UStrUtils in 'src\utils\UStrUtils.pas',
  UNumberUtils in 'src\utils\UNumberUtils.pas',
  USettings in 'src\forms\USettings.pas' {FrmSettings},
  UFrmAbstract in 'src\forms\UFrmAbstract.pas' {FrmAbstract},
  UAppUtils in 'src\utils\UAppUtils.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TimeBox';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmSettings, FrmSettings);
  Application.CreateForm(TFrmAbstract, FrmAbstract);
  Application.Run;
end.
