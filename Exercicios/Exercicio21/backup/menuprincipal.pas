unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    MainMenu: TMainMenu;
    Cadastros: TMenuItem;
    Manutencao: TMenuItem;
    Sair: TMenuItem;
    Sobre: TMenuItem;
    procedure FormCreate(Sender: TObject);
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

end.

