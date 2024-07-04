unit relProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_DBSet,
  LR_Class, ZDataset, ZAbstractRODataset, LR_DSet;

type

  { TrelProdutosF }

  TrelProdutosF = class(TForm)
    bitbtnRelProdutos: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frRepProdutos: TfrReport;
    qryProdutosRelatorio: TZQuery;
    qryProdutosRelatoriocategoriaprodutoid: TZIntegerField;
    qryProdutosRelatoriods_produto: TZRawStringField;
    qryProdutosRelatoriodt_cadastro_produto: TZDateTimeField;
    qryProdutosRelatorioobs_produto: TZRawStringField;
    qryProdutosRelatorioprodutoid: TZIntegerField;
    qryProdutosRelatoriostatus_produto: TZRawStringField;
    qryProdutosRelatoriovl_venda_produto: TZBCDField;
    procedure bitbtnRelProdutosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  relProdutosF: TrelProdutosF;

implementation

{$R *.lfm}

{ TrelProdutosF }

procedure TrelProdutosF.bitbtnRelProdutosClick(Sender: TObject);
begin
  frRepProdutos.LoadFromFile('relProdutos.lrf');
  frRepProdutos.PrepareReport;
  frRepProdutos.ShowReport;
end;

procedure TrelProdutosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryProdutosRelatorio.Close;
  CloseAction := caFree;
end;

procedure TrelProdutosF.FormCreate(Sender: TObject);
begin

end;

procedure TrelProdutosF.FormShow(Sender: TObject);
begin
  qryProdutosRelatorio.Open;
end;

end.

