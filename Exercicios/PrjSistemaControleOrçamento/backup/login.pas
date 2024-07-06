unit login;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ZDataset, ZAbstractRODataset, dmPrincipal, MenuPrincipal;

type

  { TloginF }

  TloginF = class(TForm)
    bitbtnEntrar: TBitBtn;
    bitbtnSair: TBitBtn;
    dsUsuarios: TDataSource;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    qryUsuarios: TZQuery;
    qryUsuariossenha: TZRawStringField;
    qryUsuariosusuario: TZRawStringField;
    procedure bitbtnEntrarClick(Sender: TObject);
    procedure bitbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public
     procedure TloginF.validarCampos ();
  end;

var
  loginF: TloginF;

implementation

{$R *.lfm}

{ TloginF }

procedure TloginF.validarCampos ();
begin

end;

procedure TloginF.bitbtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TloginF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  qryUsuarios.Close;
end;

procedure TloginF.FormCreate(Sender: TObject);
begin
  qryUsuarios.Open;
end;

procedure TloginF.bitbtnEntrarClick(Sender: TObject);
var
  usuario, senha : String;
begin
  usuario := qryUsuariosusuario.AsString;
  senha := qryUsuariossenha.AsString;
  if (edtUsuario.Text = usuario) and (edtSenha.Text = senha) then
  begin
     MenuPrincipalF := TMenuPrincipalF.Create(Self);
     MenuPrincipalF.ShowModal;
     Close;
  end
  else
  begin
    ShowMessage('Usuário ou senha incorretos!');
  end;
end;

end.

