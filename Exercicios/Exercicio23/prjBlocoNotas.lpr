program prjBlocoNotas;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, blocoNotas, caixaResposta
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TblocoNotasF, blocoNotasF);
  Application.CreateForm(TcaixaRespostaF, caixaRespostaF);
  Application.Run;
end.

