unit CadProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadProdutosF }

  TCadProdutosF = class(TCadModeloF)
    cbTipoProduto: TComboBox;
    edtDescSimples: TEdit;
    edtID: TEdit;
    edtValorVenda: TEdit;
    lblID: TLabel;
    lblDescSimples: TLabel;
    lblDescComposta: TLabel;
    lblTipoProduto: TLabel;
    lblValorVenda: TLabel;
    lblTitulo: TLabel;
    memoDescComposta: TMemo;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadProdutosF: TCadProdutosF;

implementation

{$R *.lfm}

{ TCadProdutosF }

procedure TCadProdutosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction:= caFree;
end;

end.

