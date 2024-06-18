unit OpSobre;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TOpSobreF }

  TOpSobreF = class(TForm)
    lblBancoDados: TLabel;
    lblAnoDesenv: TLabel;
    lblEmpresa: TLabel;
    lblSistema: TLabel;
    lblLinguagem: TLabel;
  private

  public

  end;

var
  OpSobreF: TOpSobreF;

implementation

{$R *.lfm}

end.

