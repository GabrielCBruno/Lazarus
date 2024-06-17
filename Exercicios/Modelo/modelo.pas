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

end.

