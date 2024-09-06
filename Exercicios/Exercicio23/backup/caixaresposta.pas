unit caixaResposta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TcaixaRespostaF }

  TcaixaRespostaF = class(TForm)
    btnSalvar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  caixaRespostaF: TcaixaRespostaF;

implementation

uses
  blocoNotas;

{$R *.lfm}

{ TcaixaRespostaF }

procedure TcaixaRespostaF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TcaixaRespostaF.btnSalvarClick(Sender: TObject);
begin

end;

procedure TcaixaRespostaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

end.

