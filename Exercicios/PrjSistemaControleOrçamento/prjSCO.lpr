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
  Forms, zcomponent, MenuPrincipal, CadModelo, CadCategoria, DMPrincipal;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDMPrincipalF, DMPrincipalF);
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  //Application.CreateForm(TCadProdutosF, CadProdutosF);
  Application.Run;
end.

