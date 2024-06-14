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
      procedure calcularAnoMesesDias ();
  end;

var
  IdadeDiasF: TIdadeDiasF;
  Meses, Dias, Idade : Integer;

implementation

{$R *.lfm}

{ TIdadeDiasF }

procedure TIdadeDiasF.calcularAnoMesesDias ();
begin
   if edtIdade.Text = '' then
   begin
     Dias := 0;
     Meses := 0;
     Idade := 0;
   end
   else
   begin
     //Dias := 1202;
     Dias := StrToInt(edtIdade.Text);
     Idade :=  Dias div 365;
     Meses := Idade * 12;
   end;
end;

procedure TIdadeDiasF.btnConverterIdadeClick(Sender: TObject);
var
  msg : String;
begin
     calcularAnoMesesDias();
     msg := '';
     msg := msg + 'Idade: ' + idade.ToString + #10 + 'Dias: ' + dias.ToString + #10 + 'Meses: ' + meses.ToString;
     lblSaida.Caption:= msg;
end;

end.

