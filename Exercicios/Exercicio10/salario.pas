unit Salario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TSalarioF }

  TSalarioF = class(TForm)
    btnCalcularSalario: TButton;
    descontoAbril: TEdit;
    descontoAbril1: TEdit;
    descontoAgo1: TEdit;
    descontoDez1: TEdit;
    descontoFev1: TEdit;
    descontoJan1: TEdit;
    descontoJul1: TEdit;
    descontoJun1: TEdit;
    descontoMai1: TEdit;
    descontoMar1: TEdit;
    descontoNov1: TEdit;
    descontoOut1: TEdit;
    descontoSet1: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    SalBrutoAgo: TEdit;
    descontoAgo: TEdit;
    SalBrutoDez: TEdit;
    descontoDez: TEdit;
    descontoFev: TEdit;
    descontoJan: TEdit;
    descontoJul: TEdit;
    descontoJun: TEdit;
    descontoMai: TEdit;
    descontoMar: TEdit;
    SalBrutoTotal: TEdit;
    SalBrutoNov: TEdit;
    descontoNov: TEdit;
    SalBrutoOut: TEdit;
    descontoOut: TEdit;
    SalBrutoSet: TEdit;
    SalBrutoMai: TEdit;
    SalBrutoJan: TEdit;
    SalBrutoFev: TEdit;
    SalBrutoAbril: TEdit;
    SalBrutoJun: TEdit;
    SalBrutoJul: TEdit;
    SalBrutoMar: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    descontoSet: TEdit;
    SalLiquidoTotal1: TEdit;
    procedure btnCalcularSalarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  SalarioF: TSalarioF;

implementation

{$R *.lfm}

{ TSalarioF }

procedure TSalarioF.calcularSalarioLiq ();
var
  somaB, somaL, salLiq, salBru, percentual : Double;
begin
  somaB := 0;
  somaL :=0;
  //
  salBru := StrToFloat(SalBrutoJan.Text);
  percentual := StrToFloat(descontoJan.Text);
  salLiq := salBru + (salBru * (percentual/100));
end;

procedure TSalarioF.FormCreate(Sender: TObject);
begin

end;

procedure TSalarioF.btnCalcularSalarioClick(Sender: TObject);
begin

end;

end.

