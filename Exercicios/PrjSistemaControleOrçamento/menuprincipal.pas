unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, CadCategoria, Cadcliente;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
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
    procedure miSairClick(Sender: TObject);
    procedure submiCatergoriaClick(Sender: TObject);
    procedure submiClienteClick(Sender: TObject);
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

procedure TMenuPrincipalF.submiCatergoriaClick(Sender: TObject);
begin
    CadCategoriaF := TCadCategoriaF.Create(Self);
    CadCategoriaF.ShowModal;
end;

procedure TMenuPrincipalF.submiClienteClick(Sender: TObject);
begin
  CadclienteF := TCadclienteF.Create(Self);
  CadclienteF.showModal;
end;

end.

