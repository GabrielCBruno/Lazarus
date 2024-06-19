unit OpLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadEsqSenha, MenuPrincipal;

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
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure btnEsqueciSenhaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  OpLoginF: TOpLoginF;

implementation

{$R *.lfm}

{ TOpLoginF }

procedure TOpLoginF.btnEsqueciSenhaClick(Sender: TObject);
begin
   CadEsqSenhaF := TCadEsqSenhaF.Create(Self);
   CadEsqSenhaF.ShowModal;
end;

procedure TOpLoginF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

procedure TOpLoginF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TOpLoginF.btnEntrarClick(Sender: TObject);
var
    user, password : String;
begin
  user := edtEmail.Text;
  password := edtSenha.Text;
  if (user = 'admin') AND (password = '123456') then
  begin
    MenuPrincipalF := TMenuPrincipalF.Create(Self);
    MenuPrincipalF.ShowModal;
  end
  else
  begin
    ShowMessage('Usuário ou Senha Inválidos!!!');
  end;
end;

end.

