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
     function validarCampos () : Boolean;
  end;

var
  loginF: TloginF;

implementation

{$R *.lfm}

{ TloginF }

function TloginF.validarCampos () : Boolean;
begin
  if (edtUsuario.Text = '') and (edtSenha.Text = '') then
  begin
       ShowMessage('Por Favor preencha os campos!');
       Result := false;
  end
  else
  begin
       Result := true;
  end;
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
    if (validarCampos = true) then
    begin
      usuario := edtUsuario.Text;
      senha := edtSenha.Text;
      qryUsuarios.Close;
      qryUsuarios.SQL.Text := 'select usuario, senha from usuarios where usuario = ''' + usuario + ''' and senha = ''' + senha + ''';';
      qryUsuarios.Open;
      if (usuario = qryUsuariosusuario.AsString) and (senha = qryUsuariossenha.AsString) then
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
end;

end.

