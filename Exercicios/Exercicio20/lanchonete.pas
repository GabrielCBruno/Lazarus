unit Lanchonete;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBCtrls;

type
  PedidoDados = record
         editsQuant : array[0..5] of Tedit;
         valor : Double;
  end;

  { TLanchoneteF }

  TLanchoneteF = class(TForm)
    btnProcessarPedido: TButton;
    CheckBoxEntrega: TCheckBox;
    ckgCardapio: TCheckGroup;
    edtBauruOvo: TEdit;
    edtRefrigerante: TEdit;
    edtCheseburguer: TEdit;
    edtHamburger: TEdit;
    edtCachorroQuente: TEdit;
    edtBauruSimples: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblSaida: TLabel;
    procedure btnProcessarPedidoClick(Sender: TObject);
    //procedure edtRefrigeranteChange(Sender: TObject);
  private

  public
      procedure processarPedido ();
      procedure popularArray();
  end;

var
  LanchoneteF: TLanchoneteF;
  pedido : array[0..5] of PedidoDados;

implementation

{$R *.lfm}

{ TLanchoneteF }

procedure TLanchoneteF.popularArray();
var
  i : integer;
begin
   pedido[0].editsQuant[0] := edtCachorroQuente;
   pedido[0].valor:= 12.00;

   pedido[1].editsQuant[1] := edtBauruSimples;
   pedido[1].valor:= 13.00;

   pedido[2].editsQuant[2] := edtBauruOvo;
   pedido[2].valor:= 15.00;

   pedido[3].editsQuant[3] := edtHamburger;
   pedido[3].valor := 12.00;

   pedido[4].editsQuant[4] := edtCheseburguer;
   pedido[4].valor := 13.00;

   pedido[5].editsQuant[5] := edtRefrigerante;
   pedido[5].valor := 5.00;
   //Validação dos campos
   for i := 0 to 5 do
   begin
     if pedido[i].editsQuant[i].Text = '' then
     begin
       pedido[i].editsQuant[i].Text:= IntToStr(0);
     end;
   end;
end;

procedure TLanchoneteF.processarPedido ();
var
  Total : Double;
  i : Integer;
  msg : String;
begin
     Total := 0;
     for i := 0 to 5 do
     begin
       if ckgCardapio.Checked[i] = true then
       begin
            Total := Total + (pedido[i].valor * StrToInt(pedido[i].editsQuant[i].Text));
       end;
     end;
     if CheckBoxEntrega.Checked = true then
     begin
          //Caso o cliente opte por receber o pedido, terá que pagar R$ 4,00 pela entrega.
          if Total <> 0 then
             Total := Total + 4.0;
     end;
     msg := 'R$ ' + FloatToStr(Total) + ',00.';
     lblSaida.Caption:= msg;
end;

procedure TLanchoneteF.btnProcessarPedidoClick(Sender: TObject);
begin
   popularArray();
   processarPedido();
end;

end.

