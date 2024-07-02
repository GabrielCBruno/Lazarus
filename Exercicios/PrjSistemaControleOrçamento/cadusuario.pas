unit CadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo, dmPrincipal;

type

  { TCadUsuarioF }

  TCadUsuarioF = class(TCadModeloF)
    dsUsuario: TDataSource;
    DBEdit3: TDBEdit;
    DBeditID: TDBEdit;
    DBEdit2: TDBEdit;
    DBeditNome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
       procedure povoarArray ();
       function validarCampos () : Boolean;
  end;

var
  CadUsuarioF: TCadUsuarioF;
  vetor : array of TDBEdit;

implementation

{$R *.lfm}

{ TCadUsuarioF }

procedure TCadUsuarioF.povoarArray ();
var
  i, Count: Integer;
begin
  Count := 0;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
    begin
      Inc(Count);
      SetLength(vetor, Count);
      vetor[Count - 1] := TDBEdit(Components[i]);
    end;
  end;
end;

function TCadUsuarioF.validarCampos () : Boolean;
var
  i : Integer;
  val : Boolean;
begin
  val := true;
  for i := 0 to High(vetor) do
  begin
    if vetor[i].Text = '' then
    begin
      val := false;
    end;
  end;
  if val = false then
  begin
       ShowMessage('Por favor, prencha todos os campos!');
  end;
  Result := val;
end;

procedure TCadUsuarioF.bitbtnFecharClick(Sender: TObject);
begin
  CadUsuarioF.Close;
end;

procedure TCadUsuarioF.bitbtnGravarClick(Sender: TObject);
begin
  if (validarCampos() = true) then
  begin
       dmPrincipal.DataModule1.qryUsuario.Post;
       pagPrincipal.ActivePage := pagPesquisa;
  end;
end;

procedure TCadUsuarioF.bitbtnCancelarClick(Sender: TObject);
begin
    dmPrincipal.DataModule1.qryUsuario.Cancel;
    pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadUsuarioF.bitbtnExcluirClick(Sender: TObject);
begin
  if (validarCampos = true) then
     begin
          If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
          begin
               dmPrincipal.DataModule1.qryUsuario.Delete;
               pagPrincipal.ActivePage := pagPesquisa;
          end;
     end;
end;

procedure TCadUsuarioF.bitbtnNovoClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryUsuario.Insert;
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadUsuarioF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
  if edtPesquisar.Text <> '' then
  begin
       cod := StrToInt(edtPesquisar.Text);
       dmPrincipal.DataModule1.qryUsuario.Close;
       dmPrincipal.DataModule1.qryUsuario.SQL.Text := 'select * from usuarios where id = ' + IntToStr(cod) + ';';
       dmPrincipal.DataModule1.qryUsuario.Open;
  end
  else
  begin
    dmPrincipal.DataModule1.qryUsuario.Close;
    dmPrincipal.DataModule1.qryUsuario.SQL.Text := 'select * from usuarios;';
    dmPrincipal.DataModule1.qryUsuario.Open;
  end;
end;

procedure TCadUsuarioF.DBGridPrincipalDblClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadUsuarioF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  dmPrincipal.DataModule1.qryUsuario.Close;
  SetLength(vetor, 0);
  CloseAction := caFree;
end;

procedure TCadUsuarioF.FormShow(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryUsuario.Open;
  povoarArray();
  pagPrincipal.ActivePage := pagPesquisa;
end;

end.

