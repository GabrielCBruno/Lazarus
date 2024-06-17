unit MenuPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, Modelo;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    Sair: TMenuItem;
    menuPrincipalComponente: TMainMenu;
    Abrir: TMenuItem;
    ModeloNovo: TMenuItem;

    procedure ModeloNovoClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }

procedure TMenuPrincipalF.SairClick(Sender: TObject);
begin
     //Fecha o programa.
     Close;
end;

procedure TMenuPrincipalF.ModeloNovoClick(Sender: TObject);
begin
     //Cria o formulário.
     ModeloF := TModeloF.Create(Self);
     //Abre o formulário.
     ModeloF.ShowModal;
end;

end.

