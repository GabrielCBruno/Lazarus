unit TelaPesqProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, Buttons, ZDataset, ZAbstractRODataset, dmPrincipal;

type

  { TTelaPesqProdutoF }

  TTelaPesqProdutoF = class(TForm)
    bitbtnPesquisar: TBitBtn;
    dsProduto: TDataSource;
    DBgridPrincipal: TDBGrid;
    edtPesquisar: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    qryProdutoPesq: TZQuery;
    qryProdutoPesqcategoriaprodutoid: TZIntegerField;
    qryProdutoPesqds_produto: TZRawStringField;
    qryProdutoPesqdt_cadastro_produto: TZDateTimeField;
    qryProdutoPesqobs_produto: TZRawStringField;
    qryProdutoPesqprodutoid: TZIntegerField;
    qryProdutoPesqstatus_produto: TZRawStringField;
    qryProdutoPesqvl_venda_produto: TZBCDField;
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBgridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  TelaPesqProdutoF: TTelaPesqProdutoF;

implementation

{$R *.lfm}

{ TTelaPesqProdutoF }

procedure TTelaPesqProdutoF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
  if edtPesquisar.Text = '' then
  begin
    qryProdutoPesq.Close;
    qryProdutoPesq.SQL.Text := 'select * from produto;';
    qryProdutoPesq.Open;
  end
  else
  begin
    cod := StrToInt(edtPesquisar.Text);
    qryProdutoPesq.Close;
    qryProdutoPesq.SQL.Text := 'select * from produto where produtoid = ' + IntToStr(cod) + ';';
    qryProdutoPesq.Open;
  end;
end;

procedure TTelaPesqProdutoF.DBgridPrincipalDblClick(Sender: TObject);
begin
     DataModule1.qryOrcamentoItensprodutoid.AsInteger := qryProdutoPesqprodutoid.AsInteger;
     DataModule1.qryOrcamentoItensprodutodesc.AsString := qryProdutoPesqds_produto.AsString;
     DataModule1.qryOrcamentoItensvl_unitario.AsFloat := qryProdutoPesqvl_venda_produto.AsFloat;
     Close;
end;

procedure TTelaPesqProdutoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qryProdutoPesq.Close;
  CloseAction := caFree;
end;

procedure TTelaPesqProdutoF.FormCreate(Sender: TObject);
begin
  qryProdutoPesq.Open;
end;

end.

