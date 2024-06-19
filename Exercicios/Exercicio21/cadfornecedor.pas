unit CadFornecedor;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadFornecedorF }

  TCadFornecedorF = class(TCadModeloF)
    edtCPF: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtEndereco1: TEdit;
    edtID: TEdit;
    edtNomeFantasia: TEdit;
    edtNumero: TEdit;
    edtRazaoSocial: TEdit;
    edtRazaoSocial1: TEdit;
    lblBairro: TLabel;
    lblCPF: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblID: TLabel;
    lblNomeFantasia: TLabel;
    lblNumero: TLabel;
    lblRazaoSocial: TLabel;
    lblTelefone: TLabel;
    lblTitulo: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadFornecedorF: TCadFornecedorF;

implementation

{$R *.lfm}

{ TCadFornecedorF }

procedure TCadFornecedorF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

end.

