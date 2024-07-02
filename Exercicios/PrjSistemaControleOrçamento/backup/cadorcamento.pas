unit CadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, DBCtrls, DBGrids, CadModelo, dmPrincipal;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    DataSource1: TDataSource;
    DBeditClienteID: TDBEdit;
    DBeditDtOrc: TDBEdit;
    DBeditDtVal: TDBEdit;
    DBeditID: TDBEdit;
    DBeditTotOrc: TDBEdit;
    DBGrid1: TDBGrid;
    dsOrcamento: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblTitulo1: TLabel;
    Panel4: TPanel;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
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

procedure TCadOrcamentoF.bitbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadOrcamentoF.bitbtnNovoClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryOrcamento.Insert;
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadOrcamentoF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
  if edtPesquisar.Text <> '' then
  begin
       cod := StrToInt(edtPesquisar.Text);
       dmPrincipal.DataModule1.qryOrcamento.Close;
       dmPrincipal.DataModule1.qryOrcamento.SQL.Text := 'select * from orcamento where produtoid = ' + IntToStr(cod) + ';';
       dmPrincipal.DataModule1.qryOrcamento.Open;
  end
  else
  begin
       dmPrincipal.DataModule1.qryOrcamento.Close;
       dmPrincipal.DataModule1.qryOrcamento.SQL.Text := 'select * from orcamento;';
       dmPrincipal.DataModule1.qryOrcamento.Open;
  end;
end;

procedure TCadOrcamentoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
     dmPrincipal.DataModule1.qryOrcamento.Close;
     CloseAction:= caFree;
end;

end.

