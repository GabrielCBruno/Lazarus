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
  frRepOrcamento.LoadFromFile('relOrcamento.lrf');
  frRepOrcamento.PrepareReport;
  frRepOrcamento.ShowReport;
end;

end.

