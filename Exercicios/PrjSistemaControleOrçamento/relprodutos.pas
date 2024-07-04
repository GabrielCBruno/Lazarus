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
    qryProdutosRelatorio: TZQuery;
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
  frRepCliente.LoadFromFile('relProdutos.lrf');
  frRepCliente.PrepareReport;
  frRepCliente.ShowReport;
end;

procedure TrelProdutosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryProdutosRelatorio.Close;
  CloseAction := caFree;
end;

procedure TrelProdutosF.FormShow(Sender: TObject);
begin
  qryProdutosRelatorio.Open;
end;

end.

