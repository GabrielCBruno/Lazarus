unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, CadClientes, CadProduto, CadUsuarios, CadFornecedor, CadVendedores, OpSobre;

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
    procedure FornecedorClick(Sender: TObject);
    procedure ProdutoClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure UsuarioClick(Sender: TObject);
    procedure VendedorClick(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }

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

procedure TMenuPrincipalF.SobreClick(Sender: TObject);
begin
    OpSobreF := TOpSobreF.Create(Self);
    OpSobreF.ShowModal;
end;


procedure TMenuPrincipalF.UsuarioClick(Sender: TObject);
begin
  CadUsuariosF := TCadUsuariosF.Create(Self);
  CadUsuariosF.ShowModal;
end;

procedure TMenuPrincipalF.VendedorClick(Sender: TObject);
begin
  CadVendedoresF := TCadVendedoresF.Create(Self);
  CadVendedoresF.ShowModal;
end;

end.

