unit Consumo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TConsumoF }

  TConsumoF = class(TForm)
    btnCalcularCusto: TButton;
    edtCustoFab: TEdit;
    edtCustoFab1: TEdit;
    edtCustoFab2: TEdit;
    edtCustoFab3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnCalcularCustoClick(Sender: TObject);
    procedure edtCustoFabChange(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  ConsumoF: TConsumoF;

implementation

{$R *.lfm}

{ TConsumoF }

procedure TConsumoF.btnCalcularCustoClick(Sender: TObject);
var

begin

end;


end.

