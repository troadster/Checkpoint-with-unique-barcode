unit CPP_Func;

interface

uses SysUtils;

type
  TFormat = record
    Time: string;
    Group: string;
    Name: string;
  end;

function TxtToNum(txt: string): string;
function FormatData(Text: string): TFormat;
function NumToTxt(txt: string): string;
function DateToUNIX(DelphiTime: TDateTime): LongWord;
function UNIXToDate(UnixTime: LongWord): TDateTime;
function BoolToStr(bool: boolean): string;
function Number(str: string): boolean;

implementation

function Number(str: string): boolean;
var
  alf: string;
  i: integer;
begin
  alf := '0123456789';
  i := 0;
  Result := true;
  while i <> Length(str) do
  begin
    Inc(i);
    if Pos(str[i], alf) = 0 then
    begin
      i := Length(str);
      Result := false;
    end;
  end;

end;

function BoolToStr(bool: boolean): string;
begin
  if bool then
    Result := 'True'
  else
    Result := 'False';
end;

function TxtToNum(txt: string): string;
var
  i: integer;
  s, s2: string;
begin
  s := txt;
  for i := 1 to Length(s) do
    s2 := s2 + inttostr(Ord(s[i]));
  Result := s2;
end;

function DateToUNIX(DelphiTime: TDateTime): LongWord;
begin
  Result := Round((DelphiTime - 25569) * 86400);
end;

function UNIXToDate(UnixTime: LongWord): TDateTime;
begin
  Result := (UnixTime / 86400) + 25569;
end;

function FormatData(Text: string): TFormat;
var
  i: integer;
  gr, s: string;
begin
  s := Text;
  Result.Time := Copy(s, 0, 10);
  Delete(s, 1, 10);
  gr := Copy(s, 0, 20);
  while gr[1] = '0' do
    Delete(gr, 1, 1);
  Result.Group := gr;
  Delete(s, 1, 20);
  Result.Name := s;
end;

function NumToTxt(txt: string): string;
var
  i: integer;
  s, s2: string;
begin
  if Length(txt) mod 2 = 0 then
  begin
    i := 1;
    while i <= Length(txt) do
    begin
      s2 := txt[i] + txt[i + 1];
      if (s2 = '10') or (s2 = '11') then
      begin
        s := s + chr(StrToInt(s2 + txt[i + 2] + txt[i + 3]));
        i := i + 4
      end
      else
      begin
        s := s + chr(StrToInt(s2));
        i := i + 2;
      end;
    end;
    Result := s;
  end
  else
    Result := 'Err';

end;

end.
