unit UNumberUtils;

interface

type
  TpDirection = (TpDirectionLeft, TpDirectionRight);

function zeroComplete(number, count: Integer; direction: TpDirection): string;

implementation

uses
  System.SysUtils;

function zeroComplete(number, count: Integer; direction: TpDirection): string;
var
  I, len: Integer;
begin
  Result := IntToStr(number);
  len := Length(Result);
  if(len >= count)then
  begin
    exit;
  end;
  for I := len to count - 1 do
  begin
    if(direction = TpDirectionLeft)then
    begin
      Result := '0'+Result;
    end
    else
    begin
      Result := Result+'0';
    end;
  end;
end;

end.
