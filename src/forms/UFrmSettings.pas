unit UFrmSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmAbstract, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, USettings;

type
  TFrmSettings = class(TFrmAbstract)
    PnlInfo: TPanel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    DtTmPickDefaultTime: TDateTimePicker;
    Label1: TLabel;
    RgCountTime: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSettings: TFrmSettings;

implementation

{$R *.dfm}

procedure TFrmSettings.FormShow(Sender: TObject);
begin
  inherited;
  DtTmPickDefaultTime.Time := StrToTime(Settings.DefaultTimeout);
  RgCountTime.ItemIndex := Ord(Settings.CountTime);
end;

procedure TFrmSettings.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Settings.DefaultTimeout := TimeToStr(DtTmPickDefaultTime.Time);
  Settings.CountTime := TpCountTime(RgCountTime.ItemIndex);
  Settings.save;

  Close;
end;

end.
