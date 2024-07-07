unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.PaintBox1Paint(Sender: TObject);
var
  StartColor, EndColor: TColor;
begin
  // Cores inicial e final do degradê
  StartColor := clSkyBlue;
  EndColor := clNavy;

  // Desenha o degradê na área do PaintBox
  PaintBox1.Canvas.GradientFill(PaintBox1.ClientRect, StartColor, EndColor, gdVertical);
end;

end.

