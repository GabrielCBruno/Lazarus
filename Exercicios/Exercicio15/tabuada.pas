unit Tabuada;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TTabuadaF }

  TTabuadaF = class(TForm)
    btnCalcTabuada: TButton;
    CBTabuada: TComboBox;
    Label1: TLabel;
    memoTabuada: TMemo;
    procedure btnCalcTabuadaClick(Sender: TObject);
  private

  public

  end;

var
  TabuadaF: TTabuadaF;

implementation

{$R *.lfm}

{ TTabuadaF }

procedure TTabuadaF.btnCalcTabuadaClick(Sender: TObject);
var
  i, num, res : Integer;
  msg : String;
begin
  memoTabuada.Clear;
  msg := '';
  num := StrToInt(CBTabuada.Text);
  for i:= 0 to 10 do
  begin
     res := num * i;
     msg := IntToStr(num) + 'x' + i.ToString() + ': ' + res.ToString();
     memoTabuada.Append(msg);
  end;
end;

end.

