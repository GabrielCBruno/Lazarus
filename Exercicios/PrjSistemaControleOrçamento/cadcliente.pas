unit CadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, CadModelo;

type

  { TCadClienteF }

  TCadClienteF = class(TCadModeloF)
    Button1: TButton;
    DBNome: TDBEdit;
    DBId: TDBEdit;
    DBCPF: TDBEdit;
    DBTipo: TDBEdit;
    dsCliente: TDataSource;
    lblNome: TLabel;
    lblTipo: TLabel;
    lblCPFCNPJ: TLabel;
    lblID: TLabel;
    qryCliente: TZQuery;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
  end;

var
  CadClienteF: TCadClienteF;

implementation

{$R *.lfm}

{ TCadClienteF }

procedure TCadClienteF.bitbtnNovoClick(Sender: TObject);
begin
  qryCliente.Insert;
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadClienteF.bitbtnFecharClick(Sender: TObject);
begin
  CadClienteF.Close;
end;

procedure TCadClienteF.bitbtnCancelarClick(Sender: TObject);
begin
  qryCliente.Cancel;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryCliente.Close;
  CloseAction := caFree;
end;

procedure TCadClienteF.FormShow(Sender: TObject);
begin
  qryCliente.Open;
  pagPrincipal.ActivePage := pagPesquisa;
end;

end.

