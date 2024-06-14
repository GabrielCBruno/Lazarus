unit Evento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TEventoF }

  TEventoF = class(TForm)
    btnCalcularTempo: TButton;
    edtEntrada: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblSaida: TLabel;
    procedure btnCalcularTempoClick(Sender: TObject);
  private

  public
      procedure CalcularTempo ();
  end;

var
  EventoF: TEventoF;

implementation

{$R *.lfm}

{ TEventoF }

procedure TEventoF.CalcularTempo ();
var
  segundos, horas, minutos : integer;
begin
  segundos := StrToInt(edtEntrada.Text);
  minutos := segundos div 60;
  horas := minutos div 60;
  lblSaida.Caption:= 'Horas: ' + horas.ToString + #10 + 'Minutos: ' + minutos.ToString + #10 + 'Segundos: ' + segundos.ToString;
end;

procedure TEventoF.btnCalcularTempoClick(Sender: TObject);
begin
   CalcularTempo();
end;

end.

