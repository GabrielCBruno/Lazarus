unit CadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, ZDataset, CadModelo, CadCategoria, dmPrincipal;

type

  { TCadClienteF }

  TCadClienteF = class(TCadModeloF)
    cbTipoPessoa: TDBComboBox;
    DBNome: TDBEdit;
    DBId: TDBEdit;
    DBCPF: TDBEdit;
    dsCliente: TDataSource;
    lblNome: TLabel;
    lblTipo: TLabel;
    lblCPFCNPJ: TLabel;
    lblID: TLabel;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnEditarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnPesquisarClick(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
    procedure povoarArray ();
    function validarCampos () : Boolean;
  end;

var
  CadClienteF: TCadClienteF;
  vetor : array of TDBEdit;

implementation

{$R *.lfm}

{ TCadClienteF }

procedure TCadClienteF.povoarArray ();
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

function TCadClienteF.validarCampos () : Boolean;
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
  if cbTipoPessoa.Text = '' then
  begin
    val := false;
  end;
  if val = false then
  begin
       ShowMessage('Por favor, prencha todos os campos!');
  end;
  Result := val;
end;

procedure TCadClienteF.bitbtnNovoClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryCliente.Insert;
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadClienteF.bitbtnPesquisarClick(Sender: TObject);
var
  cod : Integer;
begin
     if edtPesquisar.Text <> '' then
     begin
          DataModule1.qryCliente.Close;
          cod := StrToInt(edtPesquisar.Text);
          DataModule1.qryCliente.SQL.Text := 'select * from cliente where clienteid = ' + IntToStr(cod) + ';';
          DataModule1.qryCliente.Open;
     end
     else
     begin
          dmPrincipal.DataModule1.qryCliente.Close;
          dmPrincipal.DataModule1.qryCliente.SQL.Text := 'select * from cliente';
          dmPrincipal.DataModule1.qryCliente.Open;
     end;
end;

procedure TCadClienteF.DBGridPrincipalDblClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := pagCadastro;
end;

procedure TCadClienteF.bitbtnFecharClick(Sender: TObject);
begin
  CadClienteF.Close;
end;

procedure TCadClienteF.bitbtnGravarClick(Sender: TObject);
begin
  if (validarCampos() = true) then
     begin
          dmPrincipal.DataModule1.qryCLiente.Post;
          pagPrincipal.ActivePage := pagPesquisa;
     end;
end;

procedure TCadClienteF.bitbtnCancelarClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryCliente.Cancel;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadClienteF.bitbtnEditarClick(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryCliente.Edit;
  pagPrincipal.ActivePage := pagPesquisa;
end;

procedure TCadClienteF.bitbtnExcluirClick(Sender: TObject);
begin
  if (validarCampos = true) then
     begin
          If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
          begin
               dmPrincipal.DataModule1.qryCliente.Delete;
               pagPrincipal.ActivePage := pagPesquisa;
          end;
     end;
end;

procedure TCadClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  dmPrincipal.DataModule1.qryCliente.Close;
  SetLength(vetor, 0);
  CloseAction := caFree;
end;

procedure TCadClienteF.FormShow(Sender: TObject);
begin
  dmPrincipal.DataModule1.qryCliente.Open;
  povoarArray();
  pagPrincipal.ActivePage := pagPesquisa;
end;

end.

