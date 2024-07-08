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
    procedure DBedtQuantKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure speedbtnLocalizarProdutoClick(Sender: TObject);
  private

  public
      procedure povoarArray ();
      function validarCampos () : Boolean;
  end;

var
  CadItemOrcF: TCadItemOrcF;
  vetor : array of TDBEdit;

implementation

uses
  CadOrcamento;

{$R *.lfm}

{ TCadItemOrcF }

procedure TCadItemOrcF.povoarArray ();
var
  i, Count: Integer;
begin
  Count := 0;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
    begin
      Inc(Count);
      SetLength(vetor, Count);
      vetor[Count - 1] := TDBEdit(Components[i]);
    end;
  end;
end;

function TCadItemOrcF.validarCampos () : Boolean;
var
  i : Integer;
  val : Boolean;
begin
  val := true;
  for i := 0 to High(vetor) do
  begin
    if vetor[i].Text = '' then
    begin
      val := false;
    end;
  end;
  if val = false then
  begin
       ShowMessage('Por favor, prencha todos os campos!');
  end;
  Result := val;
end;

procedure TCadItemOrcF.bitbtnCancelarClick(Sender: TObject);
begin
  DataModule1.qryOrcamentoItens.Cancel;
  Close;
end;

procedure TCadItemOrcF.bitbtnInserirClick(Sender: TObject);
begin
  if (validarCampos = true) then
  begin
      DataModule1.qryOrcamentoItensorcamentoid.AsInteger := DataModule1.qryOrcamentoorcamentoid.AsInteger;
      DataModule1.qryOrcamentoItens.Post;
      Close;
  end;
end;

procedure TCadItemOrcF.DBedtQuantKeyPress(Sender: TObject; var Key: char);
var
    total : Double;
    q : Integer;
begin
  if DBedtQuant.Text <> '' then
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
  SetLength(vetor, 0);
  CloseAction := caFree;
end;

procedure TCadItemOrcF.FormShow(Sender: TObject);
begin
  povoarArray;
end;

procedure TCadItemOrcF.speedbtnLocalizarProdutoClick(Sender: TObject);
begin
  TelaPesqProdutoF := TTelaPesqProdutoF.Create(Self);
  TelaPesqProdutoF.ShowModal;
end;

end.

