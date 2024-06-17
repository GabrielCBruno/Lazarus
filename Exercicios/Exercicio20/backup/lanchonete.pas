unit Lanchonete;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBCtrls;

type

  { TLanchoneteF }

  TLanchoneteF = class(TForm)
    btnProcessarPedido: TButton;
    CheckBoxEntrega: TCheckBox;
    CheckGrupCardapio: TCheckGroup;
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
  private

  public
      procedure processarPedido ();
      procedure popularArray();
  end;

var
  LanchoneteF: TLanchoneteF;
  editsQuant : array[0..5] of Tedit;

implementation

{$R *.lfm}

{ TLanchoneteF }

procedure TLanchoneteF.popularArray();
var
  i : integer;
begin
   editsQuant[0] := edtCachorroQuente;
   editsQuant[1] := edtBauruSimples;
   editsQuant[2] := edtBauruOvo;
   editsQuant[3] := edtHamburger;
   editsQuant[4] := edtCheseburguer;
   editsQuant[5] := edtRefrigerante;
   //Validação dos campos
   for i := 0 to 5 do
   begin
     if editsQuant[i].Text = '' then
     begin
       editsQuant[i].Text:= IntToStr(0);
     end;
   end;
end;

procedure TLanchoneteF.processarPedido ();
var
  Total : Double;
begin
     Total := 0;
end;

procedure TLanchoneteF.btnProcessarPedidoClick(Sender: TObject);
begin
   popularArray();
   //processarPedido();
end;

end.

