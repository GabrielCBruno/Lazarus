program prjSCO;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, MenuPrincipal, CadModelo, CadCategoria, dmPrincipal,
CadCliente, CadProduto, CadUsuario, unit1;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TCadClienteF, CadClienteF);
  Application.CreateForm(TCadProdutoF, CadProdutoF);
  Application.CreateForm(TCadUsuarioF, CadUsuarioF);
  Application.Run;
end.

