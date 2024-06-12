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
       imgPrincipal.Visible:= false;
    else if (imgPrincipal.Visible == false)
       imgPrincipal.Visible:= true;
end;

end.

