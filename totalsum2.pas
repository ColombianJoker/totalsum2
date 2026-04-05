program totalsum2;

{$mode objfpc}{$H+} // Enables modern Object Pascal mode and long strings

uses
  math, sysutils;

{ Returns the sum of integer (truncated) square roots of numbers up-to n }
function suma(n: Integer): Int64;
var
  i: Integer;
  t: Int64;
  s: Int64;
begin
  t := 0;
  for i := 1 to n do
  begin
    { trunc returns the integer part of the square root }
    s := trunc(sqrt(i));
    t := t + s;
  end;
  suma := t;
end;

var
  block: Integer;
  times: Integer;
  total: Int64;
  expected: Int64;
  i: Integer;

begin
  block := 1000000000;
  times := 3;
  total := 0;
  expected := 63244053298881;

  writeln('Pascal:');

  for i := 1 to times do
  begin
    total := total + suma(block);
  end;

  writeln(Format('%d×suma(%d) = %d', [times, block, total]));

  if total <> expected then
  begin
    writeln(StdErr, Format('ERROR: wrong result! (%d)', [total]));
  end;
end.
