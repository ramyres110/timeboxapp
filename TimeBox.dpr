program TimeBox;

uses
  Vcl.Forms,
  UMain in 'src\UMain.pas' {FrmMain},
  UStrUtils in 'src\utils\UStrUtils.pas',
  UNumberUtils in 'src\utils\UNumberUtils.pas';

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
