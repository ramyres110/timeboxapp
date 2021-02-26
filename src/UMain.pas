unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons,
  System.Classes, UFrmAbstract;

type
  TFrmMain = class(TFrmAbstract)
    PnlMain: TPanel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    New1: TMenuItem;
    N2: TMenuItem;
    Settings1: TMenuItem;
    btnPlayPause: TSpeedButton;
    btnRestart: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    TimerMain: TTimer;
    procedure Exit1Click(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerMainTimer(Sender: TObject);
  private
    { Private declarations }
    FStrTimeout: string;
    FIsPlaying: boolean;
    FHour: integer;
    FMin: integer;
    FSec: integer;

    procedure start();
    procedure pause();
    procedure restart();
    procedure countTime();
    procedure updateTimer();

    procedure openSettings();

    function ValidateStrTime(pStr: string):boolean;

    function getStrTimeout: string;
    procedure setStrTimeout(const Value: string);

    function getIsPlaying: boolean;
    procedure setIsPlaying(const Value: boolean);

    procedure loadStrTimeout;
    function getRestSeconds():integer;
  public
    { Public declarations }
    property strTimeout: string read getStrTimeout write setStrTimeout;
    property isPlaying: boolean read getIsPlaying write setIsPlaying;

    property hour: integer read Fhour write Fhour;
    property min: integer read Fmin write Fmin;
    property sec: integer read Fsec write Fsec;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses UStrUtils, UNumberUtils;

procedure TFrmMain.btnPlayPauseClick(Sender: TObject);
begin
  if(getIsPlaying)then
  begin
    pause;
  end
  else
  begin
    start;
  end;
end;

procedure TFrmMain.btnRestartClick(Sender: TObject);
begin
  restart;
end;

procedure TFrmMain.countTime;
begin
  if(getRestSeconds() = 0) then
  begin
    pause;
  end;

  if(sec > 0) then
  begin
    sec := sec - 1;
    if(sec = 0) and (min > 0) then
    begin
      sec := 59;
      min := min - 1;
      if(min = 0)and (hour > 0)then
      begin
        min := 59;
        hour := hour - 1;
      end;
    end;
  end;

  updateTimer;
end;

procedure TFrmMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  restart;
end;

function TFrmMain.getIsPlaying: boolean;
begin
  Result := FIsPlaying;
end;

function TFrmMain.getRestSeconds: integer;
begin
  Result := (60*60*hour) + (60*min) + sec;
end;

function TFrmMain.getStrTimeout: string;
begin
  Result := FStrTimeout;
end;

procedure TFrmMain.loadStrTimeout;
var
  strNums: TStrings;
begin
  if(FStrTimeout = EmptyStr)then
  begin
    FHour := 0;
    FMin := 0;
    FSec := 0;
    exit;
  end;

  strNums := TStringList.Create;
  try
    ExtractStrings([':'],[],PChar(FStrTimeout),strNums);
    FHour := StrToInt(strNums[0]);
    FMin := StrToInt(strNums[1]);
    FSec := StrToInt(strNums[2]);
  finally
    strNums.Free;
  end;
end;

procedure TFrmMain.New1Click(Sender: TObject);
begin
  pause;
  restart;
end;

procedure TFrmMain.openSettings;
begin
  setStrTimeout(InputBox('TimeBox','Informe the timeout (Format 00:00:00):',''));
end;

procedure TFrmMain.pause;
begin
  btnPlayPause.Caption := 'Play';
  btnRestart.Enabled := True;
  setIsPlaying(False);
end;

procedure TFrmMain.restart;
begin
  pause;
  loadStrTimeout;
  updateTimer;
  btnRestart.Enabled := False;
end;

procedure TFrmMain.setIsPlaying(const Value: boolean);
begin
  FIsPlaying := Value;
  TimerMain.Enabled := Value;
end;

procedure TFrmMain.setStrTimeout(const Value: string);
begin
  if(ValidateStrTime(Value))then
  begin
    FStrTimeout := Value;
    loadStrTimeout;
    updateTimer;
  end;
end;

procedure TFrmMain.Settings1Click(Sender: TObject);
begin
  openSettings;
end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
  openSettings;
end;

procedure TFrmMain.start;
begin
  if(getRestSeconds() > 0) then
  begin
    btnPlayPause.Caption := 'Pause';
    btnRestart.Enabled := False;
    setIsPlaying(True);
  end;
end;

procedure TFrmMain.TimerMainTimer(Sender: TObject);
begin
  countTime;
end;

procedure TFrmMain.updateTimer;
var
  strTime: string;
begin
  if(getRestSeconds = 0) or (getRestSeconds >= 30) then
  begin
    PnlMain.Color := clWhite;
    PnlMain.Font.Color := clBlack;
  end
  else if(getRestSeconds < 30) and (getRestSeconds >= 10) then
  begin
    PnlMain.Color := clYellow;
    PnlMain.Font.Color := clBlack;
  end
  else if(getRestSeconds < 10) and (getRestSeconds > 0) then
  begin
    PnlMain.Color := clRed;
    PnlMain.Font.Color := clWhite;
  end;

  strTime := zeroComplete(hour,2,TpDirectionLeft)+':'+
             zeroComplete(min,2,TpDirectionLeft)+':'+
             zeroComplete(sec,2,TpDirectionLeft);
  PnlMain.Caption := strTime;
end;

function TFrmMain.ValidateStrTime(pStr: string): boolean;
var
  strNums: TStrings;
  strHour, strMin, strSec: Integer;
begin
  Result := False;
  if(pStr = EmptyStr)then
  begin
    ShowMessage('The time can not be empty');
    exit;
  end;

  if(Length(pStr) <> 8) or (countSubstring(pStr,':') <> 2)then //00:00:00
  begin
    ShowMessage('The time should be formated as 00:00:00');
    exit;
  end;

  strNums := TStringList.Create;
  try
    ExtractStrings([':'],[],Pchar(pStr),strNums);
    if(strNums.Count = 3)then
    begin
      try
        strHour := StrToInt(strNums[0]);
        if(strHour > 99)then
        begin
          raise Exception.Create('Hour cannot be greater than 99');
        end;

        strMin := StrToInt(strNums[1]);
        if(strMin > 59)then
        begin
          raise Exception.Create('Minutes cannot be greater than 59');
        end;

        strSec := StrToInt(strNums[2]);
        if(strSec > 59)then
        begin
          raise Exception.Create('Seconds cannot be greater than 59');
        end;

        Result := True;
      except on E: Exception do
        ShowMessage('The time should be formated as 00:00:00');
      end;
    end;
  finally
    strNums.Free;
  end;
end;

end.
