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
begin
     Total := 0;
     if cmbMedia.Text = 'Aritmética' then
     begin
          for i := 0 to 2 do
          begin
               Total := Total + StrToFloat(edits[i].Text);
          end;
          Total := Total/3;
          Reult := Total;
     end;
end;

procedure TMediasF.btnCalcularMediaClick(Sender: TObject);
begin
     validarEdits();
     calcularMedia();

end;

end.

