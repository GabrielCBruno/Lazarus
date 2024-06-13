unit CalcMedia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCalcMediaF }

  TCalcMediaF = class(TForm)
    btnCalcMedia: TButton;
    edtPessoa1: TEdit;
    edtPessoa2: TEdit;
    edtPessoa3: TEdit;
    edtPessoa4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblSaida: TLabel;
    procedure btnCalcMediaClick(Sender: TObject);
  private

  public
        function calcularMedia () : Double;
  end;

var
  CalcMediaF: TCalcMediaF;

implementation

{$R *.lfm}

{ TCalcMediaF }

function TCalcMediaF.calcularMedia () : Double;
var
  media, soma : Double;
begin
    soma := 0;
    soma := soma + StrToFloat(edtPessoa1.Text);
    soma := soma + StrToFloat(edtPessoa2.Text);
    soma := soma + StrToFloat(edtPessoa3.Text);
    soma := soma + StrToFloat(edtPessoa4.Text);
    media := soma/4;
    Result := media;
end;

procedure TCalcMediaF.btnCalcMediaClick(Sender: TObject);
begin
    //edtMedia.Text:= FloatToStr(calcularMedia());
    lblSaida.Caption := FloatToStr(calcularMedia());
end;

end.

