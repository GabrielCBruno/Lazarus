unit CadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, DBCtrls, DBGrids, DBExtCtrls, Buttons, DBDateTimePicker, CadModelo,
  dmPrincipal, CadItemOrc;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    bitbtnAdicionarItem: TBitBtn;
    bitbtnExcluirItem: TBitBtn;
    dsOrcamento: TDataSource;
    dsOrcamentoItens: TDataSource;
    DBEdit1: TDBEdit;
    DBdateDtOrc: TDBDateEdit;
    DBdateDtVal: TDBDateEdit;
    DBeditClienteID: TDBEdit;
    DBeditID: TDBEdit;
    DBGridOrcItens: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblTitulo1: TLabel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    procedure bitbtnAdicionarItemClick(Sender: TObject);
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pagCadastroEnter(Sender: TObject);
    procedure pagCadastroShow(Sender: TObject);
    procedure pagPesquisaShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public
      procedure AbreOrcItens(orcamentoid : Integer);
      procedure povoarArray ();
      function validarCampos () : Boolean;
  end;

var
  CadOrcamentoF: TCadOrcamentoF;
  vetor : array of TDBEdit;

implementation

{$R *.lfm}

{ TCadOrcamentoF }

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
  dmPrincipal.DataModule1.qryOrcamento.Cancel;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadOrcamentoF.bitbtnAdicionarItemClick(Sender: TObject);
begin
     CadItemOrcF := TCadItemOrcF.Create(Self);
     CadItemOrcF.ShowModal;
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
  dmPrincipal.DataModule1.qryOrcamento.Insert;
  pagPrincipal.ActivePage := pagCadastro;
  DBdateDtOrc.Text := DateToStr(Date);
  DBdateDtVal.Text := DateToStr(Date);
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
  //DataModule1.qryOrcamentoItens.Close;
  //DataModule1.qryOrcamentoItens.SQL.Text := 'select * from orcamento_item where orcamentoid = ' + DBeditID.Text + ';';
  //DataModule1.qryOrcamentoItens.Open;
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
  dmPrincipal.DataModule1.qryOrcamentoItens.Open;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadOrcamentoF.pagCadastroEnter(Sender: TObject);
begin
  DataModule1.qryOrcamentoItens.Close;
  DataModule1.qryOrcamentoItens.SQL.Text := 'select * from orcamento_item where orcamentoid = ' + DBeditID.Text + ';';
  DataModule1.qryOrcamentoItens.Open;
end;

procedure TCadOrcamentoF.pagCadastroShow(Sender: TObject);
begin
  povoarArray();
  //AbreOrcItens(StrToInt(DBeditID.Text));
end;

procedure TCadOrcamentoF.pagPesquisaShow(Sender: TObject);
begin

end;

procedure TCadOrcamentoF.SpeedButton1Click(Sender: TObject);
begin

end;

end.

