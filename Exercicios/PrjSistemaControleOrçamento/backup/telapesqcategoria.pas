unit TelaPesqCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids, ZDataset, ZAbstractRODataset, dmPrincipal;

type

  { TTelaPesqCategoriaG }

  TTelaPesqCategoriaG = class(TForm)
    bitbtnPesquisar: TBitBtn;
    dsCategoria: TDataSource;
    DBGrid1: TDBGrid;
    edtPesquisar: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    qryCategoria: TZQuery;
    qryCategoriacategoriaprodutoid: TZIntegerField;
    qryCategoriads_categoria_produto: TZRawStringField;
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  TelaPesqCategoriaG: TTelaPesqCategoriaG;

implementation

{$R *.lfm}

{ TTelaPesqCategoriaG }

procedure TTelaPesqCategoriaG.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
   if edtPesquisar.Text <> '' then
   begin
     cod := StrToInt(edtPesquisar.Text);
     qryCategoria.Close;
     qryCategoria.SQL.Text := 'select * from categoria_produto where categoriaprodutoid = ' + IntToStr(cod) + ';';
     qryCategoria.Open;
   end
   else
   begin
     qryCategoria.Close;
     qryCategoria.SQL.Text := 'select * from categoria_produto';
     qryCategoria.Open;
   end;
end;

procedure TTelaPesqCategoriaG.DBGrid1DblClick(Sender: TObject);
begin
   dmPrincipal.DataModule1.qryProdutocategoriaprodutoid.AsInteger := qryCategoriacategoriaprodutoid.AsInteger;
   Close;
end;

procedure TTelaPesqCategoriaG.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   qryCategoria.Close;
   CloseAction := caFree;
end;

procedure TTelaPesqCategoriaG.FormCreate(Sender: TObject);
begin
  qryCategoria.Open;
end;

end.

