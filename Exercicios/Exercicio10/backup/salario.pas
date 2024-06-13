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
    Label16: TLabel;
    Label17: TLabel;
    lblSaidaJan: TLabel;
    lblSaidaFev: TLabel;
    lblSaidaNov: TLabel;
    lblSaidaOut: TLabel;
    lblSaidaMai: TLabel;
    lblSaidaAbril: TLabel;
    lblSaidaMar: TLabel;
    lblSaidaJul: TLabel;
    lblSaidaJun: TLabel;
    lblSaidaAgo: TLabel;
    lblSaidaSet: TLabel;
    lblSaidaDez: TLabel;
    lblSalarioLiqJan: TLabel;
    lblSalarioLiqFev: TLabel;
    lblSalarioLiqOut: TLabel;
    lblSalarioLiqDez: TLabel;
    lblSalarioLiqMar: TLabel;
    lblSalarioLiqMai: TLabel;
    lblSalarioLiqJun: TLabel;
    lblSalarioLiqAgo: TLabel;
    lblSalarioLiqNov: TLabel;
    lblSalarioLiqAbril: TLabel;
    lblSalarioLiqJul: TLabel;
    lblSalarioLiqSet: TLabel;
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
    procedure btnCalcularSalarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
      procedure calcularSalarioLiq();
  end;

var
  SalarioF: TSalarioF;

implementation

{$R *.lfm}

{ TSalarioF }

procedure TSalarioF.calcularSalarioLiq();
var
  soma, salLiq, salBru, percentual : Double;
begin
  // Calculo do Salário liquido, Soma do bruto + liquido e Impressão no label.
  salBru := StrToFloat(SalBrutoJan.Text);
  percentual := StrToFloat(descontoJan.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqJan.Caption:= FloatToStr(salLiq);
  lblSaidaJan.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoFev.Text);
  percentual := StrToFloat(descontoFev.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqFev.Caption:= FloatToStr(salLiq);
  lblSaidaFev.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoMar.Text);
  percentual := StrToFloat(descontoMar.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqMar.Caption:= FloatToStr(salLiq);
  lblSaidaMar.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoAbril.Text);
  percentual := StrToFloat(descontoAbril.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqAbril.Caption:= FloatToStr(salLiq);
  lblSaidaAbril.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoMai.Text);
  percentual := StrToFloat(descontoMai.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqMai.Caption:= FloatToStr(salLiq);
  lblSaidaMai.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoJun.Text);
  percentual := StrToFloat(descontoJun.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqJun.Caption:= FloatToStr(salLiq);
  lblSaidaJun.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoJul.Text);
  percentual := StrToFloat(descontoJul.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqJul.Caption:= FloatToStr(salLiq);
  lblSaidaJul.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoAgo.Text);
  percentual := StrToFloat(descontoAgo.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqAgo.Caption:= FloatToStr(salLiq);
  lblSaidaAgo.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoSet.Text);
  percentual := StrToFloat(descontoSet.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqSet.Caption:= FloatToStr(salLiq);
  lblSaidaSet.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoOut.Text);
  percentual := StrToFloat(descontoOut.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqOut.Caption:= FloatToStr(salLiq);
  lblSaidaOut.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoNov.Text);
  percentual := StrToFloat(descontoNov.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqNov.Caption:= FloatToStr(salLiq);
  lblSaidaNov.Caption:= FloatToStr(soma);
  //
  salBru := StrToFloat(SalBrutoDez.Text);
  percentual := StrToFloat(descontoDez.Text);
  salLiq := salBru - (salBru * (percentual/100));
  soma := salBru + salLiq;
  lblSalarioLiqDez.Caption:= FloatToStr(salLiq);
  lblSaidaDez.Caption:= FloatToStr(soma);
  //
end;

procedure TSalarioF.FormCreate(Sender: TObject);
begin

end;

procedure TSalarioF.btnCalcularSalarioClick(Sender: TObject);
begin
   calcularSalarioLiq();
end;

end.

