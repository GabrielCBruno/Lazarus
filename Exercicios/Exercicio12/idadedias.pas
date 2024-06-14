unit IdadeDias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TIdadeDiasF }

  TIdadeDiasF = class(TForm)
    btnConverterIdade: TButton;
    edtIdade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblSaida: TLabel;
    procedure btnConverterIdadeClick(Sender: TObject);
  private

  public
      function calcularIdadeDias () : Integer;
  end;

var
  IdadeDiasF: TIdadeDiasF;

implementation

{$R *.lfm}

{ TIdadeDiasF }

function TIdadeDiasF.calcularIdadeDias () : Integer;
var
  idade : Integer;
  Ano : TDateTime;
begin
   if edtIdade.Text = '' then
   begin
     idade := 0;
     Result := idade;
   end
   else
   begin
     idade := StrToInt(edtIdade.Text);
     Ano := Now;
     ShowMessage(DateToStr(Ano));
   end;
end;

procedure TIdadeDiasF.btnConverterIdadeClick(Sender: TObject);
var
  idadeDias : Integer;
begin
  idadeDias := calcularIdadeDias();
end;

end.

