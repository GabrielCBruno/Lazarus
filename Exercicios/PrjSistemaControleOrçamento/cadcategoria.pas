unit CadCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    dsCategoria: TDataSource;
    DBedtDesc: TDBEdit;
    DBedtId: TDBEdit;
    lblID: TLabel;
    lblDesc: TLabel;
    qryCategoria: TZQuery;
    //procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    //procedure lblIDClick(Sender: TObject);
    //procedure pagPrincipalChange(Sender: TObject);
  private

  public

  end;

var
  CadCategoriaF: TCadCategoriaF;

implementation

{$R *.lfm}

{ TCadCategoriaF }

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
  If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    qryCategoria.Delete;
    pagPrincipal.ActivePage := pagPesquisa;
  end;
end;

procedure TCadCategoriaF.bitbtnCancelarClick(Sender: TObject);
begin
  qryCategoria.Cancel;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadCategoriaF.bitbtnGravarClick(Sender: TObject);
begin
  qryCategoria.Post;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadCategoriaF.bitbtnNovoClick(Sender: TObject);
begin
  qryCategoria.Insert;
  pagPrincipal.ActivePage := pagCadastro;
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

