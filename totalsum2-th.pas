program totalsum2_th;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}cthreads,{$ENDIF} // Must be the first unit for thread support on UNIX/macOS
  math, sysutils, classes;

type
  TSumaThread = class(TThread)
  private
    FBlock: Integer;
    FResult: Int64;
  protected
    procedure Execute; override;
  public
    constructor Create(n: Integer);
    property Result: Int64 read FResult;
  end;

constructor TSumaThread.Create(n: Integer);
begin
  inherited Create(False);
  FBlock := n;
end;

procedure TSumaThread.Execute;
var
  i: Integer;
  s: Int64;
begin
  FResult := 0;
  for i := 1 to FBlock do
  begin
    s := trunc(sqrt(i));
    FResult := FResult + s;
  end;
end;

var
  threads: array[1..3] of TSumaThread;
  total: Int64;
  expected: Int64;
  i: Integer;

begin
  total := 0;
  expected := 63244053298881;
  writeln('Pascal (Threads):');

  for i := 1 to 3 do
    threads[i] := TSumaThread.Create(1000000000);

  for i := 1 to 3 do
  begin
    threads[i].WaitFor;
    total := total + threads[i].Result;
    threads[i].Free;
  end;

  writeln(Format('3×suma(1000000000) = %d', [total]));
  if total <> expected then
    writeln(StdErr, Format('ERROR: wrong result! (%d)', [total]));
end.
