unit CadCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo, dmPrincipal;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    dsCategoria: TDataSource;
    DBeditId: TDBEdit;
    DBeditDesc: TDBEdit;
    lblID: TLabel;
    lblDesc: TLabel;
    qryCategoria: TZQuery;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public
      function validarDBEdits () : Boolean;
  end;

var
  CadCategoriaF: TCadCategoriaF;
  DBEdits : array [0..1] of TDBEdit;
implementation

{$R *.lfm}

{ TCadCategoriaF }

function TCadCategoriaF.validarDBEdits () : Boolean;
var
  i : Integer;
  val : Boolean;
begin
     //Função que irá validar os campos verificando se estão prenchidos.
     DBedits[0] := DBeditId;
     DBedits[1] := DBeditDesc;
     val := true;
     for i := 0 to 1 do
     begin
          if DBedits[i].Text = '' then
          begin
               val := false;
          end;
     end;
     if val = false then
     begin
          ShowMessage('Por Favor prencha todos os campos!!!');
          Result := false;
     end
     else
     begin
          Result := true;
     end;
end;

procedure TCadCategoriaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qryCategoria.Close;
  CloseAction := caFree;
end;

procedure TCadCategoriaF.bitbtnFecharClick(Sender: TObject);
begin
  CadCategoriaF.Close;
end;

procedure TCadCategoriaF.bitbtnExcluirClick(Sender: TObject);
begin
     if (validarDBEdits() = true) then
     begin
          If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
          begin
               qryCategoria.Delete;
               pagPrincipal.ActivePage := pagPesquisa;
          end;
     end
     else
     begin
          ShowMessage('Escolha primeiro uma linha para excluir!!!');
     end;
end;

procedure TCadCategoriaF.bitbtnCancelarClick(Sender: TObject);
begin
  qryCategoria.Cancel;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadCategoriaF.bitbtnGravarClick(Sender: TObject);
begin
  if validarDBEdits() = true then
  begin
    qryCategoria.Post;
    pagPrincipal.ActivePage := pagPesquisa;
  end;
end;

procedure TCadCategoriaF.bitbtnNovoClick(Sender: TObject);
begin
  qryCategoria.Insert;
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadCategoriaF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
     if edtPesquisar.Text = '' then
     begin
          qryCategoria.Close;
          qryCategoria.SQL.Text := 'select * from categoria_produto;';
          qryCategoria.Open;
     end
     else
     begin
          qryCategoria.Close;
          cod := StrToInt(edtPesquisar.Text);
          qryCategoria.SQL.Text := 'select * from categoria_produto where categoriaprodutoid = ' + IntToStr(cod) + ';';
          qryCategoria.Open;
     end;
end;

procedure TCadCategoriaF.DBGridPrincipalDblClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := pagCadastro;
end;


procedure TCadCategoriaF.FormCreate(Sender: TObject);
begin
    qryCategoria.Open;
    pagPrincipal.ActivePage := pagPesquisa;
end;

end.

