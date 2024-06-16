unit Consumo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TConsumoF }

  TConsumoF = class(TForm)
    btnCalcularCusto: TButton;
    edtCustoFab: TEdit;
    edtPorcDistribuidor: TEdit;
    edtPercImposto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblSaida: TLabel;
    procedure btnCalcularCustoClick(Sender: TObject);
  private

  public
     procedure calcularCustoFinal();
  end;

var
  ConsumoF: TConsumoF;

implementation

{$R *.lfm}

{ TConsumoF }

procedure TConsumoF.calcularCustoFinal();
var
  custoFab, custoFinal : Double;
  distribuidor, imposto : Integer;
begin
  custoFab := StrToFloat(edtCustoFab.Text);
  distribuidor:= StrToInt(edtPorcDistribuidor.Text);
  imposto:= StrToInt(edtPercImposto.Text);
  custoFinal:= custoFab + (custoFab * (distribuidor + imposto))/100;
  lblSaida.Caption:= 'R$: ' + custoFinal.ToString();
end;

procedure TConsumoF.btnCalcularCustoClick(Sender: TObject);
begin
    calcularCustoFinal ();
end;


end.

