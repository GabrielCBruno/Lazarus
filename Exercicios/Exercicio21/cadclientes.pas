unit CadClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadClientesF }

  TCadClientesF = class(TCadModeloF)
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
    rbFeminino: TRadioButton;
    rbMasculino: TRadioButton;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadClientesF: TCadClientesF;

implementation

{$R *.lfm}

{ TCadClientesF }

procedure TCadClientesF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction:= caFree;
end;

end.

