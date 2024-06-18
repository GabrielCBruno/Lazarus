unit CadVendedores;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadVendedoresF }

  TCadVendedoresF = class(TCadModeloF)
    edtCPF: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtEndereco1: TEdit;
    edtID: TEdit;
    edtNomeFantasia: TEdit;
    edtPercentual: TEdit;
    edtNumero: TEdit;
    edtRazaoSocial: TEdit;
    edtRazaoSocial1: TEdit;
    lblBairro: TLabel;
    lblCPF: TLabel;
    lblEmail: TLabel;
    lblPercentual: TLabel;
    lblEndereco: TLabel;
    lblID: TLabel;
    lblNomeFantasia: TLabel;
    lblNumero: TLabel;
    lblRazaoSocial: TLabel;
    lblTelefone: TLabel;
    lblTitulo: TLabel;
  private

  public

  end;

var
  CadVendedoresF: TCadVendedoresF;

implementation

{$R *.lfm}

end.

