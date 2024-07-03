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
    DBEdit1: TDBEdit;
    dsOrcamento: TDataSource;
    dsOrcamentoItens: TDataSource;
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
  private

  public

  end;

var
  CadOrcamentoF: TCadOrcamentoF;

implementation

{$R *.lfm}

{ TCadOrcamentoF }

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
  DataModule1.qryOrcamento.Close;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadOrcamentoF.bitbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadOrcamentoF.bitbtnGravarClick(Sender: TObject);
begin
  DataModule1.qryOrcamento.Post;
  pagPrincipal.ActivePage := pagPesquisa;
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
  DataModule1.qryOrcamentoItens.Close;
  DataModule1.qryOrcamentoItens.SQL.Text := 'select * from orcamento_item where orcamentoid = ' + DBeditID.Text + ';';
  DataModule1.qryOrcamentoItens.Open;
end;

procedure TCadOrcamentoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
     DataModule1.qryOrcamento.Close;
     DataModule1.qryOrcamentoItens.Close;
     CloseAction:= caFree;
end;

procedure TCadOrcamentoF.FormShow(Sender: TObject);
begin
  DataModule1.qryOrcamento.Open;
  dmPrincipal.DataModule1.qryOrcamentoItens.Open;
  pagPrincipal.ActivePage := pagPesquisa;
end;

end.

