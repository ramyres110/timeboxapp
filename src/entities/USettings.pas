unit USettings;

interface

type

  TpCountTime = (TpCountTimeDown, TpCountTimeUp);

  TSettings = class
  private
    FDefaultFilePath: string;
    FDefaultTimeout: string;
    FCountTime: TpCountTime;
  public
    constructor Create;
    destructor Destroy;

    procedure loadSettings(pFilePath: string = '');
    procedure save;

    property DefaultFilePath: string read FDefaultFilePath write FDefaultFilePath;
    property DefaultTimeout: string read FDefaultTimeout write FDefaultTimeout;
    property CountTime: TpCountTime read FCountTime write FCountTime;
  end;

implementation

uses IniFiles, System.SysUtils, Vcl.Forms;

{ TSettings }

constructor TSettings.Create;
begin
  inherited;
  FDefaultFilePath := ExtractFilePath(Application.ExeName)+'settings.ini';
  loadSettings();
end;

destructor TSettings.Destroy;
begin
  inherited;
end;


procedure TSettings.loadSettings(pFilePath: string);
var
  ArqIni: TIniFile;
begin
  if(pFilePath <> EmptyStr)then
  begin
    DefaultFilePath := pFilePath;
  end;

  ArqIni := TIniFile.Create(DefaultFilePath);
  try
    DefaultTimeout := ArqIni.ReadString('Settings', 'DefaultTime', '00:00:00');
    CountTime := TpCountTime(StrToInt(ArqIni.ReadString('Settings', 'CountTime','0')));
  finally
    ArqIni.Free;
  end;
end;

procedure TSettings.save;
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(DefaultFilePath);
  try
    ArqIni.WriteString('Settings', 'DefaultTime', DefaultTimeout);
    ArqIni.WriteString('Settings', 'CountTime', IntToStr(Ord(CountTime)));
  finally
    ArqIni.Free;
  end;

end;


end.
