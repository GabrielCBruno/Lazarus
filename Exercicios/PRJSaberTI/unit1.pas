unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  DBCtrls, Buttons, ComCtrls, ExtCtrls, Unit2, ZDataset, ZAbstractRODataset;

type

  DadosDBEdits = record
    edits : TDBEdit;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    bitbtnCancelar: TBitBtn;
    bitbtnEditar: TBitBtn;
    bitbtnExcluir: TBitBtn;
    bitbtnFechar: TBitBtn;
    bitbtnGravar: TBitBtn;
    bitbtnNovo: TBitBtn;
    btnPesquisarID: TButton;
    cbPesquisar: TComboBox;
    DBedtCPFCNPJ: TDBEdit;
    DBedtFJ: TDBEdit;
    DBedtID: TDBEdit;
    DBedtNome: TDBEdit;
    DBGrid1: TDBGrid;
    dsCliente: TDataSource;
    edtPesquisa: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblTitulo: TLabel;
    pagPrincipal: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qryCliente: TZQuery;
    qryClienteclienteid: TZIntegerField;
    qryClientecpf_cnpj_cliente: TZRawStringField;
    qryClientenome_cliente: TZRawStringField;
    qryClientetipo_cliente: TZRawStringField;
    tabsPesquisar: TTabSheet;
    tabsCadastrar: TTabSheet;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnEditarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure btnPesquisarIDClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
     function validarDBEdits () : Boolean;
  end;

var
  Form1: TForm1;
  DBEdits : array [0..4] of DadosDBEdits;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.validarDBEdits () : Boolean;
var
  i : Integer;
  val : Boolean;
begin
     //Função que irá validar os campos verificando se estão prenchidos.
     DBedits[0].edits := DBedtNome;
     DBedits[1].edits := DBedtCPFCNPJ;
     DBedits[2].edits := DBedtID;
     DBedits[3].edits := DBedtFJ;
     val := true;
     for i := 0 to 3 do
     begin
          if DBedits[i].edits.Text = '' then
          begin
               val := false;
          end;
     end;
     if val = false then
     begin
          ShowMessage('Por Favor prencha todos os campos!!!');
          Result := false;
     end
     else
     begin
          Result := true;
     end;
end;

procedure TForm1.bitbtnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.bitbtnGravarClick(Sender: TObject);
begin
  if validarDBEdits() = true then
  begin
    qryCliente.Post;
    pagPrincipal.ActivePage := tabsPesquisar;
  end;
end;

procedure TForm1.bitbtnEditarClick(Sender: TObject);
begin
  qryCliente.Edit;
  pagPrincipal.ActivePage := tabsPesquisar;
end;

procedure TForm1.bitbtnCancelarClick(Sender: TObject);
begin
  qryCliente.Cancel;
  pagPrincipal.ActivePage := tabsPesquisar;
end;

procedure TForm1.bitbtnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    qryCliente.Delete;
    pagPrincipal.ActivePage := tabsPesquisar;
  end;
end;

procedure TForm1.bitbtnNovoClick(Sender: TObject);
begin
  qryCliente.Insert;
  pagPrincipal.ActivePage := tabsCadastrar;
end;

procedure TForm1.btnPesquisarIDClick(Sender: TObject);
var
  escolha, nome: String;
begin
  escolha := cbPesquisar.Text;
  if edtPesquisa.Text <> '' then
   begin
       if escolha = 'ID' then
       begin
         qryCliente.Close;
         qryCliente.SQL.Text := 'select * from cliente where clienteid = ' + edtPesquisa.Text;
         qryCliente.Open;
       end
       else
       begin
            qryCliente.Close;
            //String o vetor começa em 1.
            nome := UpperCase(edtPesquisa.Text[1]);
            //Copy (String que vai copiar, posição inicial, posição final).
            nome := nome + Copy(edtPesquisa.Text, 2, Length(edtPesquisa.Text));
            qryCliente.SQL.Text := 'select * from cliente where nome_cliente LIKE ''' + nome +'%''';
            qryCliente.Open;
       end;
   end
   else
   begin
       qryCliente.Close;
       qryCliente.SQL.Text := 'select * from cliente';
       qryCliente.Open;
   end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := tabsCadastrar;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  qryCliente.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  qryCliente.Open;
  pagPrincipal.ActivePage := tabsPesquisar;
end;

end.

