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
  private

  public

  end;

var
  CaptFormF: TCaptFormF;

implementation

{$R *.lfm}

end.

