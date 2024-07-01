unit CadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, CadModelo;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadOrcamentoF: TCadOrcamentoF;

implementation

{$R *.lfm}

{ TCadOrcamentoF }

procedure TCadOrcamentoF.bitbtnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TCadOrcamentoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

end;

end.

