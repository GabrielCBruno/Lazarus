unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  CadCategoria, Cadcliente, CadProduto, CadUsuario, CadOrcamento, relClientes,
  relProdutos, relCategoria, sobre, relOrcamento;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    RelatorioProduto: TMenuItem;
    RelatorioOrcamento: TMenuItem;
    RelatorioCategoria: TMenuItem;
    Orcamento: TMenuItem;
    RelatorioCliente: TMenuItem;
    submiCliente: TMenuItem;
    submiProdutos: TMenuItem;
    submiUsuarios: TMenuItem;
    submiCatergoria: TMenuItem;
    miSobre: TMenuItem;
    miSair: TMenuItem;
    miRelatorios: TMenuItem;
    miCadastrar: TMenuItem;
    miVendas: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure miSobreClick(Sender: TObject);
    procedure RelatorioCategoriaClick(Sender: TObject);
    procedure RelatorioOrcamentoClick(Sender: TObject);
    procedure RelatorioProdutoClick(Sender: TObject);
    procedure OrcamentoClick(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure submiCatergoriaClick(Sender: TObject);
    procedure submiClienteClick(Sender: TObject);
    procedure RelatorioClienteClick(Sender: TObject);
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

procedure TMenuPrincipalF.RelatorioProdutoClick(Sender: TObject);
begin
  relProdutosF := TrelProdutosF.Create(Self);
  relProdutosF.ShowModal;
end;

procedure TMenuPrincipalF.RelatorioCategoriaClick(Sender: TObject);
begin
  relCategoriaF := TrelCategoriaF.Create(Self);
  relCategoriaF.ShowModal;
end;

procedure TMenuPrincipalF.RelatorioOrcamentoClick(Sender: TObject);
begin
  relOrcamentoF := TrelOrcamentoF.Create(Self);
  relOrcamentoF.ShowModal;
end;

procedure TMenuPrincipalF.miSobreClick(Sender: TObject);
begin
   sobreF := TsobreF.Create(Self);
   sobreF.ShowModal;
end;

procedure TMenuPrincipalF.Button1Click(Sender: TObject);
var
  data : TDateTime;
  dataEdt : String;
begin
   data := now;
   dataEdt := FormatDateTime('dd/mm/yyyy', data);
   ShowMessage('teste: ' + dataEdt);
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

procedure TMenuPrincipalF.RelatorioClienteClick(Sender: TObject);
begin
    relClientesF := TrelClientesF.Create(Self);
    relClientesF.ShowModal;
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

