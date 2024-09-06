unit blocoNotas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls, caixaResposta;

type

  { TblocoNotasF }

  TblocoNotasF = class(TForm)
    fontArquivo: TFontDialog;
    fundo: TMemo;
    menuPrincipal: TMainMenu;
    Arquivo: TMenuItem;
    Editar: TMenuItem;
    Formatar: TMenuItem;
    Abrir: TMenuItem;
    Imprimir: TMenuItem;
    Localizar: TMenuItem;
    Fonte: TMenuItem;
    abrirArquivo: TOpenDialog;
    salvarArquivo: TSaveDialog;
    Substituir: TMenuItem;
    Salvar: TMenuItem;
    Novo: TMenuItem;
    procedure AbrirClick(Sender: TObject);
    procedure FonteClick(Sender: TObject);
    procedure NovoClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
  private

  public

  end;

var
  blocoNotasF: TblocoNotasF;


implementation

{$R *.lfm}

{ TblocoNotasF }

procedure TblocoNotasF.AbrirClick(Sender: TObject);
begin
  if (abrirArquivo.Execute = true) then
  begin
       fundo.Lines.LoadFromFile(abrirArquivo.FileName);
       blocoNotasF.Caption := ExtractFileName(abrirArquivo.FileName) + ' - Bloco de Notas';
  end;
end;

procedure TblocoNotasF.FonteClick(Sender: TObject);
begin
  fontArquivo.Execute;
  fundo.Font := fontArquivo.Font;

end;

procedure TblocoNotasF.NovoClick(Sender: TObject);
begin
    if fundo.Lines.Text <> '' then
    begin
         If  MessageDlg('Você tem certeza que deseja criar um novo arquivo?',mtConfirmation,[mbyes,mbno],0)=mryes then
         begin
              blocoNotasF.Caption := 'Bloco de Notas';
              fundo.Lines.Text := '';
         end;
    end;
end;

procedure TblocoNotasF.SalvarClick(Sender: TObject);
begin
  if (salvarArquivo.Execute = true) then
  begin
       fundo.Lines.SaveToFile(salvarArquivo.FileName);
  end;
end;

end.

