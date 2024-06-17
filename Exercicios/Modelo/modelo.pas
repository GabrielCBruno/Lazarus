unit Modelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ColorBox;

type

  { TModeloF }

  TModeloF = class(TForm)
    btnEnviar: TButton;
    edtEntrada: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  ModeloF: TModeloF;

implementation

{$R *.lfm}

{ TModeloF }

procedure TModeloF.btnEnviarClick(Sender: TObject);
begin

end;

procedure TModeloF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  //Limpa a memória.
  CloseAction := caFree;
end;

end.

