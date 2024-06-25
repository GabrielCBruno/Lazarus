unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  DBCtrls, Buttons, Unit2, ZDataset, ZAbstractRODataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    bitbtnExcluir: TBitBtn;
    bitbtnCancelar: TBitBtn;
    bitbtnFechar: TBitBtn;
    bitbtnNovo: TBitBtn;
    bitbtnEditar: TBitBtn;
    bitbtnGravar: TBitBtn;
    DBedtID: TDBEdit;
    DBedtFJ: TDBEdit;
    DBedtCPFCNPJ: TDBEdit;
    DBedtNome: TDBEdit;
    dsCliente: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryCliente: TZQuery;
    qryClienteclienteid: TZIntegerField;
    qryClientecpf_cnpj_cliente: TZRawStringField;
    qryClientenome_cliente: TZRawStringField;
    qryClientetipo_cliente: TZRawStringField;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnEditarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnFecharClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bitbtnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.bitbtnGravarClick(Sender: TObject);
begin
  qryCliente.Post;
end;

procedure TForm1.bitbtnEditarClick(Sender: TObject);
begin
  qryCliente.Edit;
end;

procedure TForm1.bitbtnCancelarClick(Sender: TObject);
begin
  qryCliente.Cancel;
end;

procedure TForm1.bitbtnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    qryCliente.Delete;
  end;
end;

procedure TForm1.bitbtnNovoClick(Sender: TObject);
begin
  qryCliente.Insert;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  qryCliente.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  qryCliente.Open;
end;

end.

