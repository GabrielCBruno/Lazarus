unit Modelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ColorBox;

type

  { TModeloF }

  TModeloF = class(TForm)
    btnEnviar: TButton;
    btnTeste: TButton;
    edtEntrada: TEdit;
    FindDialog1: TFindDialog;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
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

