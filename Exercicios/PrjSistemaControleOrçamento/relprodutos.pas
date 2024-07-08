unit relProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_DBSet,
  LR_Class, ZDataset;

type

  { TrelProdutosF }

  TrelProdutosF = class(TForm)
    bitbtnRelProdutos: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frRepProdutos: TfrReport;
    qryProdutos: TZQuery;
    procedure bitbtnRelProdutosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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
  frRepProdutos.LoadFromFile('RelProdutos.lrf');
  frRepProdutos.PrepareReport;
  frRepProdutos.ShowReport;
  Close;
end;

procedure TrelProdutosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryProdutos.Close;
  CloseAction:= caFree;
end;

procedure TrelProdutosF.FormShow(Sender: TObject);
begin
  qryProdutos.Open;
end;

end.

