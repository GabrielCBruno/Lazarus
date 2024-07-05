unit CadItemOrc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, ZDataset, ZAbstractRODataset, dmPrincipal, TelaPesqProduto;

type

  { TCadItemOrcF }

  TCadItemOrcF = class(TForm)
    bitbtnCancelar: TBitBtn;
    bitbtnInserir: TBitBtn;
    DBedtProdutoId: TDBEdit;
    DBedtDescProduto: TDBEdit;
    DBedtQuant: TDBEdit;
    DBedtVl_Unit: TDBEdit;
    DBedtVl_Total: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    speedbtnLocalizarProduto: TSpeedButton;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnInserirClick(Sender: TObject);
    procedure DBedtQuantKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure speedbtnLocalizarProdutoClick(Sender: TObject);
  private

  public

  end;

var
  CadItemOrcF: TCadItemOrcF;

implementation

uses
  CadOrcamento;

{$R *.lfm}

{ TCadItemOrcF }

procedure TCadItemOrcF.bitbtnCancelarClick(Sender: TObject);
begin
  DataModule1.qryOrcamentoItens.Cancel;
  Close;
end;

procedure TCadItemOrcF.bitbtnInserirClick(Sender: TObject);
begin
  DataModule1.qryOrcamentoItensorcamentoid.AsInteger := DataModule1.qryOrcamentoclienteid.AsInteger;
  DataModule1.qryOrcamentoItens.Post;
  Close;
end;

procedure TCadItemOrcF.DBedtQuantKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    total : Double;
    q : Integer;
begin
  if DBedtQuant.Text = '' then
  begin
    q := 1;
    total := DataModule1.qryOrcamentoItensvl_unitario.AsFloat;
    total := q * total;
    DataModule1.qryOrcamentoItensvl_total.AsFloat := total;
  end
  else
  begin
       q := StrToInt(DBedtQuant.Text);
       total := DataModule1.qryOrcamentoItensvl_unitario.AsFloat;
       total := q * total;
       DataModule1.qryOrcamentoItensvl_total.AsFloat := total;
  end;
end;


procedure TCadItemOrcF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction := caFree;
end;

procedure TCadItemOrcF.speedbtnLocalizarProdutoClick(Sender: TObject);
begin
  TelaPesqProdutoF := TTelaPesqProdutoF.Create(Self);
  TelaPesqProdutoF.ShowModal;
end;

end.

