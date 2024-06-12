unit calcArea;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TcalcAreaF }

  TcalcAreaF = class(TForm)
    btnCalcArea: TButton;
    edtRaio: TEdit;
    edtArea: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnCalcAreaClick(Sender: TObject);
  private

  public
        function calcularAreaCirculo (Raio: Double) : Double;
  end;

var
  calcAreaF: TcalcAreaF;

Const
  PI = 3.1515;

implementation

{$R *.lfm}

{ TcalcAreaF }

function TcalcAreaF.calcularAreaCirculo (Raio: Double) : Double;
begin

end;

procedure TcalcAreaF.btnCalcAreaClick(Sender: TObject);
begin

end;

end.

