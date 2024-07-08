unit relOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet, ZDataset;

type

  { TrelOrcamentoF }

  TrelOrcamentoF = class(TForm)
    bitbtnRelOrcamento: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frRepOrcamento: TfrReport;
    qryOrcamento: TZQuery;
    procedure bitbtnRelOrcamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  relOrcamentoF: TrelOrcamentoF;

implementation

{$R *.lfm}

{ TrelOrcamentoF }

procedure TrelOrcamentoF.bitbtnRelOrcamentoClick(Sender: TObject);
begin
  frRepOrcamento.LoadFromFile('RelOrcamento.lrf');
  frRepOrcamento.PrepareReport;
  frRepOrcamento.ShowReport;
  Close;
end;

procedure TrelOrcamentoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
    qryOrcamento.Close;
    CloseAction := caFree;
end;

procedure TrelOrcamentoF.FormShow(Sender: TObject);
begin
     qryOrcamento.Open;
end;

end.

