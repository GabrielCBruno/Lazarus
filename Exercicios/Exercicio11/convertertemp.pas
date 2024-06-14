unit ConverterTemp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TConverterTempF }

  TConverterTempF = class(TForm)
    btnConverterTemp: TButton;
    edtCelc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblSaida: TLabel;
    procedure btnConverterTempClick(Sender: TObject);
  private

  public
      function converterTemp(temp : Double) : Double;
  end;

var
  ConverterTempF: TConverterTempF;

implementation

{$R *.lfm}

{ TConverterTempF }

function TConverterTempF.converterTemp(temp : Double) : Double;
begin
     Result := (temp * 1.8) + 32;
end;

procedure TConverterTempF.btnConverterTempClick(Sender: TObject);
var
  temperatura : Double;
begin
  temperatura := converterTemp(StrToFloat(edtCelc.Text));
  lblSaida.Caption:= FloatToStr(temperatura);
end;

end.

