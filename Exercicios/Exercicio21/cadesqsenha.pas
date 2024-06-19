unit CadEsqSenha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MenuPrincipal;

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
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  CadEsqSenhaF: TCadEsqSenhaF;

implementation

{$R *.lfm}

{ TCadEsqSenhaF }

procedure TCadEsqSenhaF.FormCreate(Sender: TObject);
begin

end;

procedure TCadEsqSenhaF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TCadEsqSenhaF.btnEntrarClick(Sender: TObject);
var
  user, password : String;
begin
  user := edtEmail.Text;
  password:= edtSenhaNova.Text;
  if (password <> edtConfirmarSenha.Text) OR (user <> 'admin') then
  begin
    ShowMessage('As senhas não Coincidem ou usuário inexistente.');
  end
  else
  begin
    MenuPrincipalF := TMenuPrincipalF.Create(Self);
    MenuPrincipalF.ShowModal;
  end;
end;

procedure TCadEsqSenhaF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction:= caFree;
end;

end.

