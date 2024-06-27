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
  Forms, MenuPrincipal, CadModelo
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  //Application.CreateForm(TCadProdutosF, CadProdutosF);
  Application.Run;
end.

