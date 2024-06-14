unit IdadeDias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TIdadeDiasF }

  TIdadeDiasF = class(TForm)
    btnConverterIdade: TButton;
    edtIdade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblSaida: TLabel;
    procedure btnConverterIdadeClick(Sender: TObject);
  private

  public
      procedure calcularAnoMesesDias (var Dias, Meses, Anos : Integer);
  end;

var
  IdadeDiasF: TIdadeDiasF;

implementation

{$R *.lfm}

{ TIdadeDiasF }

procedure TIdadeDiasF.calcularAnoMesesDias (var Dias, Meses, Anos : Integer);
var
  dive : Integer;
begin
   if edtIdade.Text = '' then
   begin
     Dias := 0;
     Meses := 0;
     Anos := 0;
   end
   else
   begin
     dive := 13054;
     Dias := StrToInt(edtIdade.Text);
     Anos := dive / 365;
     //Meses := idade * 12;
   end;
end;

procedure TIdadeDiasF.btnConverterIdadeClick(Sender: TObject);
var
  msg : String;
  idade, meses, dias : Integer;
begin
     calcularAnoMesesDias(dias, meses, idade);
     msg := '';
     msg := msg + 'Idade: ' + idade.ToString + #10 + 'Dias: ' + dias.ToString + #10 + 'Meses: ' + meses.ToString;
     lblSaida.Caption:= msg;
end;

end.

