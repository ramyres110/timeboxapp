unit UAppUtils;

interface

type

TAppUtils = class(TObject)

end;


function GetApplicationName: string;
function GetVersaoArq: string;

implementation

uses
  System.Types, Winapi.Windows, System.SysUtils;

function GetApplicationName: string;
begin
  Result := 'TimeBox';
end;


/// REF: https://www.devmedia.com.br/controlando-a-versao-da-sua-aplicacao/3348
function GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);

  GetMem(VerInfo, VerInfoSize);

  GetFileVersionInfo(PChar(ParamStr(0)), 0,VerInfoSize, VerInfo);

  VerQueryValue(VerInfo, '\', Pointer(VerValue),VerValueSize);

  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;

  FreeMem(VerInfo, VerInfoSize);
end;

end.
