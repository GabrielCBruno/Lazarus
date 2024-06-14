unit Modelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TModeloF }

  TModeloF = class(TForm)
    btnEnviar: TButton;
    edtEntrada: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnEnviarClick(Sender: TObject);
  private

  public

  end;

var
  ModeloF: TModeloF;

implementation

{$R *.lfm}

{ TModeloF }

procedure TModeloF.btnEnviarClick(Sender: TObject);
var
  numero : Integer;
  Frutas : array [0..4] of String;
  i : Integer;
begin
  {Frutas[0] := 'Banana';
  Frutas[1] := 'Mamão';
  Frutas[2] := 'Uva';
  Frutas[3] := 'Goiaba';
  Frutas[4] := 'Abacate';

  ShowMessage(Frutas[4]);
  numero := 20;
  while numero >=0 do
  begin
       ShowMessage('O número atual é: ' + IntToStr(numero));
       //ShowMessage('Fruta: ' + Frutas[numero]);
       numero:= numero - 1;
  end;}
  for i:=10 downto 0 do;
  begin
    ShowMessage('Estamos na posição: ' + IntToStr(i));
  end;
  ShowMessage('Acabou');
end;

end.

