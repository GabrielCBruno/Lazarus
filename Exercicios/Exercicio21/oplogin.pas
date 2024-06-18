unit OpLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TOpLoginF }

  TOpLoginF = class(TForm)
    btnEntrar: TButton;
    btnCancelar: TButton;
    btnEsqueciSenha: TButton;
    edtEmail: TEdit;
    edtSenha: TEdit;
    lblEmail: TLabel;
    lblSenha: TLabel;
    lblTitulo: TLabel;
  private

  public

  end;

var
  OpLoginF: TOpLoginF;

implementation

{$R *.lfm}

end.

