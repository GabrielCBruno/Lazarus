unit corFundo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ColorBox;

type

  { TcorFundoF }

  TcorFundoF = class(TForm)
    btnMudar: TButton;
    CBprincipal: TColorBox;
    lbl1: TLabel;
    procedure btnMudarClick(Sender: TObject);
    procedure CBprincipalChange(Sender: TObject);
  private

  public

  end;

var
  corFundoF: TcorFundoF;

implementation

{$R *.lfm}

{ TcorFundoF }

procedure TcorFundoF.btnMudarClick(Sender: TObject);
begin
      corFundoF.Color:= CBprincipal.Selected;
end;

procedure TcorFundoF.CBprincipalChange(Sender: TObject);
begin
  //corFundoF.Color:= CBprincipal.Selected;
end;

end.

