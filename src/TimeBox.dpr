program TimeBox;

uses
  Vcl.Forms,
  USettings in 'entities\USettings.pas',
  UStrUtils in 'utils\UStrUtils.pas',
  UNumberUtils in 'utils\UNumberUtils.pas',
  UAppUtils in 'utils\UAppUtils.pas',
  UMain in 'forms\UMain.pas' {FrmMain},
  UFrmSettings in 'forms\UFrmSettings.pas' {FrmSettings},
  UFrmAbstract in 'forms\UFrmAbstract.pas' {FrmAbstract},
  UFrmAbout in 'forms\UFrmAbout.pas' {FrmAbout},
  UDmMain in 'datamodules\UDmMain.pas' {DmMain: TDataModule};

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TimeBox';

  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDmMain, DmMain);

  Application.Run;
end.
