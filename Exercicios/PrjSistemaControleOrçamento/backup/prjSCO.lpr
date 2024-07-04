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
  CadItemOrc, unit1;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.CreateForm(TCadOrcamentoF, CadOrcamentoF);
  Application.CreateForm(TrelClientesF, relClientesF);
  Application.CreateForm(TCadItemOrcF, CadItemOrcF);
  Application.Run;
end.

