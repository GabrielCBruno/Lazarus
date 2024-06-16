unit Intervalo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TIntervaloF }

  TIntervaloF = class(TForm)
    btnGerarCont: TButton;
    edtNum1: TEdit;
    edtNum2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    memoSaida: TMemo;
    procedure btnGerarContClick(Sender: TObject);
  private

  public
     function contagemRegressiva () : String;
  end;

var
  IntervaloF: TIntervaloF;

implementation

{$R *.lfm}

{ TIntervaloF }

function TIntervaloF.contagemRegressiva () : String;
var
  num1, num2, i : Integer;
  msg : String;
begin
  num1 := StrToInt(edtNum1.Text);
  num2 := StrToInt(edtNum2.Text);
  msg := '';
  if num1 > num2 then
  begin
       //Caso o primeiro número seja maior que o segundo.
       for i := num1 downto num2 do
       begin
            msg := msg + IntToStr(i) + ', ';
       end;
  end
  else
  begin
       //Caso o segundo número seja maior que o primeiro.
       if num1 < num2 then
       begin
            for i := num2 downto num1 do
            begin
                 msg := msg + IntToStr(i) + ', ';
            end;
       end
       else
       begin
            //Caso os dois números sejam iguais.
            msg := IntToStr(num1);
       end;
  end;
  Result := msg;
end;

procedure TIntervaloF.btnGerarContClick(Sender: TObject);
var
  msgF : String;
begin
     memoSaida.Clear;
     msgF := contagemRegressiva();
     memoSaida.Caption:= msgF;
end;

end.

