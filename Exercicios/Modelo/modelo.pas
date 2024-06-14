unit Modelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TModeloF }

  TModeloF = class(TForm)
    btnEnviar: TButton;
    edtEntrada: TEdit;
    Label1: TLabel;
    Label2: TLabel;
  private

  public

  end;

var
  ModeloF: TModeloF;

implementation

{$R *.lfm}

end.

