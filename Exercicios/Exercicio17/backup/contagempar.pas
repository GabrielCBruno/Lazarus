unit ContagemPar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TContagemParF }

  TContagemParF = class(TForm)
    btnGerar: TButton;
    Label1: TLabel;
    lblSaida: TLabel;
    procedure btnGerarClick(Sender: TObject);
  private

  public

  end;

var
  ContagemParF: TContagemParF;

implementation

{$R *.lfm}

{ TContagemParF }

procedure TContagemParF.btnGerarClick(Sender: TObject);
var
  i, q : Integer;
  msg : String;
begin
  q := 0;
  i := 0;
  msg := '';
  while q <= 3 do
  begin
       if i mod 2 = 0 then
       begin
         Inc(q);
       end;
       msg := msg + IntToStr(i) + ', ';
       Inc(i);
  end;
  lblSaida.Caption:= msg;
end;

end.

