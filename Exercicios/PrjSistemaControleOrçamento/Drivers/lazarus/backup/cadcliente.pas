unit Cadcliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset, DBCtrls,
  CadModelo;

type

  { TcadclienteF }

  TcadclienteF = class(TCadModeloF)
    DBId: TDBEdit;
    DBeditTipoP: TDBEdit;
    DBeditCPF: TDBEdit;
    DBeditNome: TDBEdit;
    dsCliente: TDataSource;
    lblID: TLabel;
    lblCPF: TLabel;
    lblID1: TLabel;
    lblNome: TLabel;
    qryCliente: TZQuery;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  cadclienteF: TcadclienteF;

implementation

{$R *.lfm}

{ TcadclienteF }

procedure TcadclienteF.bitbtnNovoClick(Sender: TObject);
begin
  qryCliente.Insert;
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TcadclienteF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
  if edtPesquisar.Text = '' then
  begin
     qryCliente.Close;
     qryCliente.SQL.Text := 'select * from cliente;';
     qryCliente.Open;
  end
  else
  begin
    cod := strtoInt(edtPesquisar.Text);
    qryCliente.Close;
    qryCliente.SQL.Text := 'select * from cliente where clienteid = ' + inttoStr(cod) + ';';
    qryCliente.Open;
  end;
end;

procedure TcadclienteF.bitbtnFecharClick(Sender: TObject);
begin
   cadclienteF.Close;
end;

procedure TcadclienteF.bitbtnGravarClick(Sender: TObject);
var
  i: Integer;
  Edit: TEdit;
begin
     for i := 0 to ComponentCount - 1 do
  begin
    // Verifica se o controle é um TEdit
    if Components[i] is TEdit then
    begin
      Edit := TEdit(Components[i]); // Converte para TEdit
      ShowMessage('Texto do ' + Edit.Name + ': ' + Edit.Text); // Exemplo: Mostra o texto do TEdit
    end;
  end;
end;

procedure TcadclienteF.bitbtnCancelarClick(Sender: TObject);
begin
   qryCliente.Cancel;
   pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TcadclienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryCliente.Close;
  CloseAction := caFree;
end;

procedure TcadclienteF.FormShow(Sender: TObject);
begin
  qryCliente.Open;
  pagPrincipal.ActivePage := pagPesquisa;
end;

end.

