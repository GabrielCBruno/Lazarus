unit CaptForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCaptFormF }

  TCaptFormF = class(TForm)
    btnMudarCapt: TButton;
    editEntrar: TEdit;
    Label1: TLabel;
    procedure btnMudarCaptClick(Sender: TObject);
  private

  public

  end;

var
  CaptFormF: TCaptFormF;

implementation

{$R *.lfm}

{ TCaptFormF }

procedure TCaptFormF.btnMudarCaptClick(Sender: TObject);
begin
     CaptFormF.Caption:= editEntrar.Caption;
end;

end.

