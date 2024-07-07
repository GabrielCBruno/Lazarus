unit CadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls, StdCtrls, DBCtrls,
  DBGrids, DBExtCtrls, Buttons, ZDataset, ZAbstractRODataset, DBDateTimePicker, CadModelo, dmPrincipal,
  CadItemOrc, TelaPesqCliente, TelaPesqProduto;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    bitbtnAdicionarItem: TBitBtn;
    bitbtnExcluirItem: TBitBtn;
    DBedtDataOrc: TDBDateEdit;
    DBedtClienteID: TDBEdit;
    DBedtDataVal: TDBDateEdit;
    dsOrcamento: TDataSource;
    DBEdit1: TDBEdit;
    DBeditID: TDBEdit;
    DBGridOrcItens: TDBGrid;
    dsOrcamentoItens: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    lblCliente: TLabel;
    lblTitulo1: TLabel;
    Panel4: TPanel;
    speedbtnClienteID: TSpeedButton;
    procedure bitbtnAdicionarItemClick(Sender: TObject);
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnExcluirItemClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pagCadastroShow(Sender: TObject);
    procedure pagPrincipalChange(Sender: TObject);
    procedure speedbtnClienteIDClick(Sender: TObject);
  private

  public
      procedure AbreOrcItens(orcamentoid : Integer);
      procedure SomaItens;
      procedure povoarArray ();
      function validarCampos () : Boolean;
  end;

var
  CadOrcamentoF: TCadOrcamentoF;
  vetor : array of TDBEdit;

implementation

{$R *.lfm}

{ TCadOrcamentoF }

procedure TCadOrcamentoF.SomaItens;
begin

  if not (DataModule1.qryOrcamento.State in [dsEdit, dsInsert]) then
     DataModule1.qryOrcamento.Edit;

  if not (DataModule1.qryOrcamentoItens.State in [dsEdit, dsInsert]) then
     DataModule1.qryOrcamentoItens.Edit;

  //Vai pro Primeiro
  DataModule1.qryOrcamentoItens.First;
  DataModule1.qryOrcamentovl_total_orcamento.AsFloat := 0;
  while not DataModule1.qryOrcamentoItens.Eof do
  begin
    DataModule1.qryOrcamentovl_total_orcamento.AsFloat := DataModule1.qryOrcamentovl_total_orcamento.AsFloat + DataModule1.qryOrcamentoItensvl_total.AsFloat;
    DataModule1.qryOrcamentoItens.next;
  end;
end;

procedure TCadOrcamentoF.AbreOrcItens(orcamentoid : Integer);
begin
   if orcamentoid <> 0 then
  begin
      DataModule1.qryOrcamentoItens.Close;
      DataModule1.qryOrcamentoItens.SQL.Clear;
      DataModule1.qryOrcamentoItens.SQL.Add(
                      'SELECT '+
                      'ORCAMENTOITEMID, '+
                      'ORCAMENTOID, '+
                      'PRODUTOID, '+
                      'produtodesc, '+
                      'QT_PRODUTO, '+
                      'VL_UNITARIO, '+
                      'VL_TOTAL '+
                      'FROM ORCAMENTO_ITEM ' +
                      'WHERE ORCAMENTOID = '+ inttostr(orcamentoid) + ' ' +
                      'ORDER BY ORCAMENTOID');
       DataModule1.qryOrcamentoItens.Open;
  end;
end;

procedure TCadOrcamentoF.povoarArray ();
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

function TCadOrcamentoF.validarCampos () : Boolean;
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

procedure TCadOrcamentoF.bitbtnCancelarClick(Sender: TObject);
begin
  DataModule1.qryOrcamento.Cancel;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadOrcamentoF.bitbtnAdicionarItemClick(Sender: TObject);
begin
     DataModule1.qryOrcamentoItens.Insert;
     DataModule1.qryOrcamentoItensorcamentoid.AsInteger := DataModule1.qryOrcamentoorcamentoid.AsInteger;
     CadItemOrcF := TCadItemOrcF.Create(Self);
     CadItemOrcF.ShowModal;
     SomaItens;
end;

procedure TCadOrcamentoF.bitbtnExcluirClick(Sender: TObject);
begin
  if (validarCampos() = true) then
  begin
      If  MessageDlg('Você tem certeza que deseja excluir o registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
      begin
           DataModule1.qryOrcamento.Delete;
           pagPrincipal.ActivePage := pagPesquisa;
      end;
  end;
end;

procedure TCadOrcamentoF.bitbtnExcluirItemClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir o registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
       DataModule1.qryOrcamentoItens.Delete;
       SomaItens;
  end;
end;

procedure TCadOrcamentoF.bitbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadOrcamentoF.bitbtnGravarClick(Sender: TObject);
begin
  if (validarCampos() = true) then
  begin
       DataModule1.qryOrcamento.Post;
       pagPrincipal.ActivePage := pagPesquisa;
  end;
end;

procedure TCadOrcamentoF.bitbtnNovoClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := pagCadastro;
  DataModule1.qryOrcamento.Insert;
  AbreOrcItens(DataModule1.qryOrcamentoorcamentoid.AsInteger);
end;

procedure TCadOrcamentoF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
  if edtPesquisar.Text <> '' then
  begin
       cod := StrToInt(edtPesquisar.Text);
       dmPrincipal.DataModule1.qryOrcamento.Close;
       dmPrincipal.DataModule1.qryOrcamento.SQL.Text := 'select * from orcamento where orcamentoid = ' + IntToStr(cod) + ';';
       dmPrincipal.DataModule1.qryOrcamento.Open;
  end
  else
  begin
       dmPrincipal.DataModule1.qryOrcamento.Close;
       dmPrincipal.DataModule1.qryOrcamento.SQL.Text := 'select * from orcamento;';
       dmPrincipal.DataModule1.qryOrcamento.Open;
  end;
end;

procedure TCadOrcamentoF.DBGridPrincipalDblClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := pagCadastro;
  AbreOrcItens(DataModule1.qryOrcamentoorcamentoid.AsInteger);
  SomaItens;
end;

procedure TCadOrcamentoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
     DataModule1.qryOrcamento.Close;
     DataModule1.qryOrcamentoItens.Close;
     SetLength(vetor, 0);
     CloseAction:= caFree;
end;

procedure TCadOrcamentoF.FormShow(Sender: TObject);
begin
  DataModule1.qryOrcamento.Open;
  DataModule1.qryOrcamentoItens.Open;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadOrcamentoF.pagCadastroShow(Sender: TObject);
begin
  povoarArray();
end;

procedure TCadOrcamentoF.pagPrincipalChange(Sender: TObject);
begin
    AbreOrcItens(DataModule1.qryOrcamentoorcamentoid.AsInteger);
end;

procedure TCadOrcamentoF.speedbtnClienteIDClick(Sender: TObject);
begin
  TelaPesqClienteF := TTelaPesqClienteF.Create(Self);
  TelaPesqClienteF.ShowModal;
end;

end.

