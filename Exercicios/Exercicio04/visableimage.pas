unit VisableImage;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ColorBox;

type

  { TVisableImageF }

  TVisableImageF = class(TForm)
    btnVisivel: TButton;
    imgPrincipal: TImage;
    Label1: TLabel;
    procedure btnVisivelClick(Sender: TObject);
  private

  public

  end;

var
  VisableImageF: TVisableImageF;

implementation

{$R *.lfm}

{ TVisableImageF }

procedure TVisableImageF.btnVisivelClick(Sender: TObject);
begin
    if (imgPrincipal.Visible = true) then
       begin
       imgPrincipal.Visible:= false;
       end
    else
        begin
       imgPrincipal.Visible:= true;
        end;
end;

end.

