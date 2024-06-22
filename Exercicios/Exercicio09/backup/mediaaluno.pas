unit MediaAluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TMediaAlunoF }

  TMediaAlunoF = class(TForm)
    btnCalcMedia: TButton;
    edtNome: TEdit;
    edtNota1: TEdit;
    edtNota2: TEdit;
    edtNota3: TEdit;
    edtNota4: TEdit;
    edtNumFaltas: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblSaida: TLabel;
    procedure btnCalcMediaClick(Sender: TObject);
  private

  public
       function calcularMedia () : Double;
  end;

var
  MediaAlunoF: TMediaAlunoF;

Const
  mediaAprov = 60;
  numFaltas = 55;

implementation

{$R *.lfm}

{ TMediaAlunoF }

function TMediaAlunoF.calcularMedia () : Double;
var
  soma: Double;
begin
   //Função que irá calcular e retornar a média das 4 notas de um aluno.
   soma :=0;
   soma := soma + StrToFloat(edtNota1.Text);
   soma := soma + StrToFloat(edtNota2.Text);
   soma := soma + StrToFloat(edtNota3.Text);
   soma := soma + StrToFloat(edtNota4.Text);
   Result := soma/4;
end;

procedure TMediaAlunoF.btnCalcMediaClick(Sender: TObject);
var
  mediaFinal : Double;
  faltasFinal : Integer;
  msg : String;
begin
   msg := '';
   mediaFinal := calcularMedia();
   faltasFinal := StrToInt(edtNumFaltas.Text);
   if (mediaFinal >= 60) AND (faltasFinal < 55) then
   begin
     //Aprovado
      msg := 'O Aluno ' + edtNome.Text + ' ficou com a seguinte média ' + FloatToStr(mediaFinal) + '. O aluno está APROVADO.';
      lblSaida.Caption:= msg;
   end
   else
   Begin
     //Reprovado
     msg := 'O Aluno ' + edtNome.Text + ' ficou com a seguinte média ' + FloatToStr(mediaFinal) + '. O aluno está REPROVADO.';
     lblSaida.Caption:= msg;
   end;
end;

end.

