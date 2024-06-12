unit alteracao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TalteracaoF }

  TalteracaoF = class(TForm)
    btnTransformar: TButton;
    edtText: TEdit;
    RadB1: TRadioButton;
    RadB2: TRadioButton;
    RadB3: TRadioButton;
    RadB4: TRadioButton;
    procedure btnTransformarClick(Sender: TObject);
  private

  public

  end;

var
  alteracaoF: TalteracaoF;

implementation

{$R *.lfm}

{ TalteracaoF }

procedure TalteracaoF.btnTransformarClick(Sender: TObject);
var pwdrimeiraLetra, restodotexto : String;
begin
  //Todas as letras maiúsculas
  if RadB1.Checked then
     edtText.Text:= UpperCase(edtText.Text);

  //Todas as letras minúsculas
  if RadB2.Checked then
     edtText.Text := LowerCase(edtText.Text);

  //Somente Primeira letra maiúscula.
  if RadB3.Checked then
  begin
     restodotexto := Copy(edtText.Text,2,Length(edtText.Text));
     edtText.Text:= UpperCase(edtText.Text[1]) + restodotexto;
  end;
  //Somente primeira letra minúscula.
  if RadB4.Checked = True then
  begin
     primeiraLetra:= Copy(edtText.Text,1,1);
     restodotexto:= Copy(edtText.Text,2,Length(edtText.text));
     edtText.Text:= LowerCase(primeiraLetra) + restodotexto;
  end;;
end;

end.

