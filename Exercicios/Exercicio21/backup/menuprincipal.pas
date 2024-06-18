unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, CadClientes, CadProduto, CadUsuarios, CadFornecedor;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    MainMenu: TMainMenu;
    Cadastros: TMenuItem;
    Manutencao: TMenuItem;
    Cliente: TMenuItem;
    Fornecedor: TMenuItem;
    Vendedor: TMenuItem;
    Usuario: TMenuItem;
    Produto: TMenuItem;
    Sair: TMenuItem;
    Sobre: TMenuItem;
    procedure ClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FornecedorClick(Sender: TObject);
    procedure ProdutoClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure UsuarioClick(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }

procedure TMenuPrincipalF.FormCreate(Sender: TObject);
begin

end;

procedure TMenuPrincipalF.FornecedorClick(Sender: TObject);
begin
  CadFornecedorF := TCadFornecedorF.Create(Self);
  CadFornecedorF.ShowModal;
end;

procedure TMenuPrincipalF.ProdutoClick(Sender: TObject);
begin

  CadProdutosF := TCadProdutosF.Create(Self);
  CadProdutosF.ShowModal;
end;

procedure TMenuPrincipalF.ClienteClick(Sender: TObject);
begin
  CadClientesF := TCadClientesF.Create(Self);
  CadClientesF.ShowModal;
end;

procedure TMenuPrincipalF.SairClick(Sender: TObject);
begin
  Close;
end;

procedure TMenuPrincipalF.UsuarioClick(Sender: TObject);
begin
  CadUsuariosF := TCadUsuariosF.Create(Self);
  CadUsuariosF.ShowModal;
end;

end.

