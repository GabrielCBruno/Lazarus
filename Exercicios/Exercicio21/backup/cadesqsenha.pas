unit CadEsqSenha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCadEsqSenhaF }

  TCadEsqSenhaF = class(TForm)
    btnEntrar: TButton;
    btnCancelar: TButton;
    edtEmail: TEdit;
    edtConfirmarSenha: TEdit;
    edtSenhaNova: TEdit;
    lblEmail: TLabel;
    lblTitulo: TLabel;
    lblSenhaNova: TLabel;
    lblConfirmarSenha: TLabel;
  private

  public

  end;

var
  CadEsqSenhaF: TCadEsqSenhaF;

implementation

{$R *.lfm}

end.

