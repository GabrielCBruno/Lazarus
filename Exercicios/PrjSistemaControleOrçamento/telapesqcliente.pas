unit TelaPesqCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, Buttons, ZDataset, ZAbstractRODataset, dmPrincipal;

type

  { TTelaPesqClienteF }

  TTelaPesqClienteF = class(TForm)
    bitbtnPesquisar: TBitBtn;
    dsCliente: TDataSource;
    gridPrincipal: TDBGrid;
    edtPesquisar: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    qryClientePesq: TZQuery;
    qryClientePesqclienteid: TZIntegerField;
    qryClientePesqcpf_cnpj_cliente: TZRawStringField;
    qryClientePesqnome_cliente: TZRawStringField;
    qryClientePesqtipo_cliente: TZRawStringField;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure gridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  TelaPesqClienteF: TTelaPesqClienteF;

implementation

uses
  CadOrcamento;

{$R *.lfm}

{ TTelaPesqClienteF }

procedure TTelaPesqClienteF.bitbtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaPesqClienteF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
  if edtPesquisar.Text = '' then
  begin
    qryClientePesq.Close;
    qryClientePesq.SQL.Text := 'select * from cliente;';
    qryClientePesq.Open;
  end
  else
  begin
    cod := StrToInt(edtPesquisar.Text);
    qryClientePesq.Close;
    qryClientePesq.SQL.Text := 'select * from cliente where clienteid = ' + IntToStr(cod) + ';';
    qryClientePesq.Open;
  end;
end;

procedure TTelaPesqClienteF.gridPrincipalDblClick(Sender: TObject);
begin
  DataModule1.qryOrcamentoclienteid.AsInteger := qryClientePesqclienteid.AsInteger;
  Close;
end;

procedure TTelaPesqClienteF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qryClientePesq.Close;
  CloseAction := caFree;
end;

procedure TTelaPesqClienteF.FormShow(Sender: TObject);
begin
  qryClientePesq.Open;
end;

end.

