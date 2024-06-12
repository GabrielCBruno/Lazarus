unit imgMover;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Arrow,
  StdCtrls, windows;

type

  { TimgMoverF }

  TimgMoverF = class(TForm)
    imgBola: TImage;
    procedure btnBaixoClick(Sender: TObject);
    procedure btnCimaClick(Sender: TObject);
    procedure btnDireitaClick(Sender: TObject);
    procedure btnEsquerdaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  imgMoverF: TimgMoverF;

implementation

{$R *.lfm}

{ TimgMoverF }

procedure TimgMoverF.btnEsquerdaClick(Sender: TObject);
begin
  imgBola.Left:= imgBola.Left - 10;
end;

procedure TimgMoverF.btnCimaClick(Sender: TObject);
begin
   imgBola.Top:= imgBola.Top - 10;
end;

procedure TimgMoverF.btnBaixoClick(Sender: TObject);
begin
   imgBola.Top:= imgBola.Top + 10;
end;

procedure TimgMoverF.btnDireitaClick(Sender: TObject);
begin
     imgBola.Left:= imgBola.Left + 10;
end;

procedure TimgMoverF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
    VK_LEFT: imgBola.Left := imgBola.Left - 10;
    VK_RIGHT: imgBola.Left := imgBola.Left + 10;
    VK_UP: imgBola.Top := imgBola.Top - 10;
    VK_DOWN: imgBola.Top := imgBola.Top + 10;
  end;
end;

end.

