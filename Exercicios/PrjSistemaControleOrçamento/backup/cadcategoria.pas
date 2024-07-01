unit CadCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, CadModelo, dmPrincipal, ZDataset, CadProduto;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    dsCategoria: TDataSource;
    DBeditId: TDBEdit;
    DBeditDesc: TDBEdit;
    lblID: TLabel;
    lblDesc: TLabel;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBeditIdChange(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public
      procedure povoarArray ();
      function validarCampos () : Boolean;
  end;

var
  CadCategoriaF: TCadCategoriaF;
  vetor: array of TDBEdit;
implementation

{$R *.lfm}

{ TCadCategoriaF }

procedure TCadCategoriaF.povoarArray ();
var
  i, Count: Integer;
begin
  //Procedimento que irá guardar o endereço de todos os TDBEdit do form em um array
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

function TCadCategoriaF.validarCampos () : Boolean;
var
  i : Integer;
  val : Boolean;
begin
  {Função que irá validar os campos, retornando true caso todos os campos
  tenham sido preenchidos ou false caso um ou mais campos estejam em branco.}
  val := true;
  for i := 0 to Length(vetor) -1 do
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

procedure TCadCategoriaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dmPrincipal.DataModule1.qryCategoria.Close;
  SetLength(vetor, 0);
  CloseAction := caFree;
end;

procedure TCadCategoriaF.bitbtnFecharClick(Sender: TObject);
begin
  CadCategoriaF.Close;
end;

procedure TCadCategoriaF.bitbtnExcluirClick(Sender: TObject);
begin
     if (validarCampos() = true) then
     begin
          If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
          begin
               dmPrincipal.DataModule1.qryCategoria.Open;
               pagPrincipal.ActivePage := pagPesquisa;
          end;
     end;
end;

procedure TCadCategoriaF.bitbtnCancelarClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryCategoria.Cancel;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadCategoriaF.bitbtnGravarClick(Sender: TObject);
begin
  if (validarCampos() = true) then
  begin
       dmPrincipal.DataModule1.qryCategoria.Post;
       pagPrincipal.ActivePage := pagPesquisa;
  end;
end;

procedure TCadCategoriaF.bitbtnNovoClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryCategoria.Insert;
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadCategoriaF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
     if edtPesquisar.Text = '' then
     begin
          dmPrincipal.DataModule1.qryCategoria.Close;
          dmPrincipal.DataModule1.qryCategoria.SQL.Text := 'select * from categoria_produto;';
          dmPrincipal.DataModule1.qryCategoria.Open;
     end
     else
     begin
          dmPrincipal.DataModule1.qryCategoria.Close;
          cod := StrToInt(edtPesquisar.Text);
          dmPrincipal.DataModule1.qryCategoria.SQL.Text := 'select * from categoria_produto where categoriaprodutoid = ' + IntToStr(cod) + ';';
          dmPrincipal.DataModule1.qryCategoria.Close;
     end;
end;

procedure TCadCategoriaF.DBeditIdChange(Sender: TObject);
begin

end;

procedure TCadCategoriaF.DBGridPrincipalDblClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := pagCadastro;
end;


procedure TCadCategoriaF.FormCreate(Sender: TObject);
begin
    dmPrincipal.DataModule1.qryCategoria.Open;
    povoarArray();
    pagPrincipal.ActivePage := pagPesquisa;
end;

end.

