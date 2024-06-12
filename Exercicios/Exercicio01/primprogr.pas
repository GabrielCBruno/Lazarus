unit PrimProgr;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TPrimProgrF }

  TPrimProgrF = class(TForm)
    btnMensagem: TButton;
    procedure btnMensagemClick(Sender: TObject);
  private

  public

  end;

var
  PrimProgrF: TPrimProgrF;

implementation

{$R *.lfm}

{ TPrimProgrF }

procedure TPrimProgrF.btnMensagemClick(Sender: TObject);
begin
  ShowMessage('Meu Primeiro Programa');
end;

end.

