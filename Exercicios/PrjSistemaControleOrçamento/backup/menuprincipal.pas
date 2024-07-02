unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, CadCategoria, Cadcliente, CadProduto, CadUsuario, CadOrcamento;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Orcamento: TMenuItem;
    submiClientes: TMenuItem;
    submiCliente: TMenuItem;
    submiProdutos: TMenuItem;
    submiUsuarios: TMenuItem;
    submiCatergoria: TMenuItem;
    miSobre: TMenuItem;
    miSair: TMenuItem;
    miRelatorios: TMenuItem;
    miCadastrar: TMenuItem;
    miVendas: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure OrcamentoClick(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure submiCatergoriaClick(Sender: TObject);
    procedure submiClienteClick(Sender: TObject);
    procedure submiProdutosClick(Sender: TObject);
    procedure submiUsuariosClick(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }

procedure TMenuPrincipalF.miSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMenuPrincipalF.OrcamentoClick(Sender: TObject);
begin
  CadOrcamentoF := TCadOrcamentoF.Create(Self);
  CadOrcamentoF.ShowModal;
end;

procedure TMenuPrincipalF.submiCatergoriaClick(Sender: TObject);
begin
    CadCategoriaF := TCadCategoriaF.Create(Self);
    CadCategoriaF.ShowModal;
end;

procedure TMenuPrincipalF.submiClienteClick(Sender: TObject);
begin
  CadClienteF := TCadClienteF.Create(Self);
  CadClienteF.ShowModal;
end;

procedure TMenuPrincipalF.submiProdutosClick(Sender: TObject);
begin
   CadProdutoF := TCadProdutoF.Create(Self);
   CadProdutoF.ShowModal;
end;

procedure TMenuPrincipalF.submiUsuariosClick(Sender: TObject);
begin
  CadUsuarioF := TCadUsuarioF.Create(Self);
  CadUsuarioF.ShowModal;
end;

end.

