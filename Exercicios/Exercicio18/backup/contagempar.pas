unit ContagemPar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TContagemParF }

  TContagemParF = class(TForm)
    btnGerar: TButton;
    Label1: TLabel;
    procedure btnGerarClick(Sender: TObject);
  private

  public
     procedure Contar();
  end;

var
  ContagemParF: TContagemParF;

implementation

{$R *.lfm}

{ TContagemParF }

procedure TContagemParF.Contar();
var
  //msg : String;
  i : integer;
begin
  //msg := '';
  for i := 0 to 10 do
  begin
    ShowMessage(IntToStr(i));
  end;
  i := 0;
  while i <= 10 do
  begin
       ShowMessage(IntToStr(i));
       Inc(i);
  end;
  i := 0;
  repeat
        ShowMessage(IntToStr(i));
        Inc(i);
  until i > 10;
end;

procedure TContagemParF.btnGerarClick(Sender: TObject);
begin
   Contar();
end;

end.

