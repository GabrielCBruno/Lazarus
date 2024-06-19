unit Medias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin;

type

  { TMediasF }

  TMediasF = class(TForm)
    btnCalcularMedia: TButton;
    cmbMedia: TComboBox;
    edtNota1: TEdit;
    edtNota2: TEdit;
    edtNota3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblSaida: TLabel;
    procedure btnCalcularMediaClick(Sender: TObject);
  private

  public
      procedure validarEdits ();
      function calcularMedia () : Double;
  end;

var
  MediasF: TMediasF;
  edits : array [0..2] of TEdit;

implementation

{$R *.lfm}

{ TMediasF }

procedure TmediasF.validarEdits ();
var
  i : Integer;
begin
  edits[0] := edtNota1;
  edits[1] := edtNota2;
  edits[2] := edtNota3;
  for i := 0 to 2 do
  begin
    if edits[i].Text = '' then
    begin
      edits[i].Text := IntToStr(0);
    end;
  end;
end;

function TmediasF.calcularMedia () : Double;
var
  Total : Double;
  i : Integer;
  peso : array [0..2] of Integer;
begin
     Total := 0;
     if cmbMedia.Text = 'Aritmética' then
     begin
          //Média Aritmética
          for i := 0 to 2 do
          begin
               Total := Total + StrToFloat(edits[i].Text);
          end;
          Total := Total/3;
          Result := Total;
     end;
     if cmbMedia.Text = 'Ponderada' then
     begin
          //Média Ponderada
          peso[0] := 3;
          peso[1] := 3;
          peso[2] := 4;
          for i := 0 to 2 do
          begin
            Total := Total + (StrToFloat(edits[i].Text) * peso[i]);
          end;
          Total := Total/(peso[0] + peso[1] + peso[2]);
          Result := Total;
     end;
     if cmbMedia.Text = 'Harmônica' then
     begin
          //Media Harmônica
          for i := 0 to 2 do
          begin
            Total := Total + (1/StrToFloat(edits[i].Text));
          end;
          Total := 3/Total;
          Result := Total;
     end;
end;

procedure TMediasF.btnCalcularMediaClick(Sender: TObject);
var
  res : Double;
begin
     validarEdits();
     res := calcularMedia();
     lblSaida.Caption := 'Resultado: ' + FloatToStr(res);
end;

end.

