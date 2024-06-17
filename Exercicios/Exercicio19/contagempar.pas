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
    if i = 5 then
    begin
      break;
    end;
  end;
  i := 0;
  while i <= 10 do
  begin
       ShowMessage(IntToStr(i));
       if i = 5 then
       begin
            break;
       end;
       Inc(i);
  end;
  i := 0;
  repeat
        ShowMessage(IntToStr(i));
        if i = 5 then
        begin
             break;
        end;
        Inc(i);
  until i > 10; //Vai ficar repetindo até que a condição seja falsa;
end;

procedure TContagemParF.btnGerarClick(Sender: TObject);
begin
   Contar();
end;

end.

