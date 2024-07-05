unit CadProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBExtCtrls, Buttons, ZDataset, ZAbstractRODataset, CadModelo, dmPrincipal, TelaPesqCategoria;

type

  { TCadProdutoF }

  TCadProdutoF = class(TCadModeloF)
    DBcbStatus: TDBComboBox;
    DBdataDtCadastro: TDBDateEdit;
    DBeditCatID: TDBEdit;
    DBeditID: TDBEdit;
    DBeditIDesc: TDBEdit;
    DBeditObs: TDBEdit;
    DBeditValor: TDBEdit;
    dsProduto: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryProduto: TZQuery;
    qryProdutocategoriaprodutoid: TZIntegerField;
    qryProdutods_produto: TZRawStringField;
    qryProdutodt_cadastro_produto: TZDateTimeField;
    qryProdutoobs_produto: TZRawStringField;
    qryProdutoprodutoid: TZIntegerField;
    qryProdutostatus_produto: TZRawStringField;
    qryProdutovl_venda_produto: TZBCDField;
    speedbtnCategoria: TSpeedButton;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure speedbtnCategoriaClick(Sender: TObject);
  private

  public
      procedure povoarArray ();
      function validarCampos () : Boolean;
  end;

var
  CadProdutoF: TCadProdutoF;
  vetor : array of TDBEdit;

implementation

{$R *.lfm}

{ TCadProdutoF }

procedure TCadProdutoF.povoarArray ();
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

function TCadProdutoF.validarCampos () : Boolean;
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

procedure TCadProdutoF.bitbtnFecharClick(Sender: TObject);
begin
  CadProdutoF.Close;
end;

procedure TCadProdutoF.bitbtnCancelarClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryProduto.Cancel;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadProdutoF.bitbtnExcluirClick(Sender: TObject);
begin
  if (validarCampos = true) then
     begin
          If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
          begin
               dmPrincipal.DataModule1.qryProduto.Delete;
               pagPrincipal.ActivePage := pagPesquisa;
          end;
     end;
end;

procedure TCadProdutoF.bitbtnGravarClick(Sender: TObject);
begin
  if (validarCampos () = true) then
  begin
       dmPrincipal.DataModule1.qryProduto.Post;
       pagPrincipal.ActivePage := pagPesquisa;
  end;
end;

procedure TCadProdutoF.bitbtnNovoClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryProduto.Insert;
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadProdutoF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
  if edtPesquisar.Text <> '' then
  begin
       cod := StrToInt(edtPesquisar.Text);
       dmPrincipal.DataModule1.qryProduto.Close;
       dmPrincipal.DataModule1.qryProduto.SQL.Text := 'select * from produto where produtoid = ' + IntToStr(cod) + ';';
       dmPrincipal.DataModule1.qryProduto.Open;
  end
  else
  begin
    dmPrincipal.DataModule1.qryProduto.Close;
    dmPrincipal.DataModule1.qryProduto.SQL.Text := 'select * from produto;';
    dmPrincipal.DataModule1.qryProduto.Open;
  end;
end;

procedure TCadProdutoF.DBGridPrincipalDblClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := pagCadastro;
  DataModule1.qryOrcamentoItens.Close;
  DataModule1.qryOrcamentoItens.SQL.Text := 'select * from orcamento_item where orcamentoid = ' + DBeditID.Text + ';';
  DataModule1.qryOrcamentoItens.Open;
end;

procedure TCadProdutoF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  dmPrincipal.DataModule1.qryProduto.Close;
  SetLength(vetor, 0);
  CloseAction := caFree;
end;

procedure TCadProdutoF.FormShow(Sender: TObject);
begin
   dmPrincipal.DataModule1.qryProduto.Open;
   povoarArray();
   pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadProdutoF.speedbtnCategoriaClick(Sender: TObject);
begin
  TelaPesqCategoriaG := TTelaPesqCategoriaG.Create(Self);
  TelaPesqCategoriaG.ShowModal;
end;

end.

