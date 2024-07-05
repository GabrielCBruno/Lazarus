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
  Forms, datetimectrls, zcomponent, MenuPrincipal, CadModelo, CadCategoria,
  dmPrincipal, CadCliente, CadProduto, CadUsuario, CadOrcamento, relClientes,
  CadItemOrc, TelaPesqCliente, relCategoria, sobre, TelaPesqProduto, 
TelaPesqCategoria;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.CreateForm(TTelaPesqProdutoF, TelaPesqProdutoF);
  Application.CreateForm(TTelaPesqCategoriaG, TelaPesqCategoriaG);
  Application.Run;
end.

