unit UStrUtils;

interface

uses System.SysUtils;


function countSubstring(pText, pSubString : string): integer;

implementation

function countSubstring(pText, pSubString : string): integer;
var
  offset: integer;
begin
  Result := 0;
  if(pText = EmptyStr)then
  begin
    exit;
  end;

  offset := Pos(pSubstring, pText, 1);
  while offset <> 0 do
  begin
    inc(Result);
    offset := Pos(pSubstring, pText, offset + length(pSubstring));
  end;
end;

end.
