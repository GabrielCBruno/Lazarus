unit dmPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, ZAbstractRODataset, DB;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    qryCategoriacategoriaprodutoid: TZIntegerField;
    qryCategoriads_categoria_produto: TZRawStringField;
    qryClienteclienteid: TZIntegerField;
    qryClientecpf_cnpj_cliente: TZRawStringField;
    qryClientenome_cliente: TZRawStringField;
    qryClientetipo_cliente: TZRawStringField;
    qryOrcamentoclienteid: TZIntegerField;
    qryOrcamentodt_orcamento: TZDateTimeField;
    qryOrcamentodt_validade_orcamento: TZDateTimeField;
    qryOrcamentoItensorcamentoid: TZIntegerField;
    qryOrcamentoItensorcamentoitemid: TZIntegerField;
    qryOrcamentoItensprodutodesc: TZRawStringField;
    qryOrcamentoItensprodutoid: TZIntegerField;
    qryOrcamentoItensqt_produto: TZBCDField;
    qryOrcamentoItensvl_total: TZBCDField;
    qryOrcamentoItensvl_unitario: TZBCDField;
    qryOrcamentoorcamentoid: TZIntegerField;
    qryOrcamentovl_total_orcamento: TZBCDField;
    qryProdutocategoriaprodutoid: TZIntegerField;
    qryProdutods_produto: TZRawStringField;
    qryProdutodt_cadastro_produto: TZDateTimeField;
    qryProdutoobs_produto: TZRawStringField;
    qryProdutoprodutoid: TZIntegerField;
    qryProdutostatus_produto: TZRawStringField;
    qryProdutovl_venda_produto: TZBCDField;
    qryUsuarioid: TZIntegerField;
    qryUsuarionome_completo: TZRawStringField;
    qryUsuariosenha: TZRawStringField;
    qryUsuariousuario: TZRawStringField;
    ZConnection1: TZConnection;
    qryGenerica: TZQuery;
    qryCliente: TZQuery;
    qryProduto: TZQuery;
    qryUsuario: TZQuery;
    qryCategoria: TZQuery;
    qryOrcamento: TZQuery;
    qryOrcamentoItens: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    function getSequence(const pNomeSequence: String): String;
    procedure qryCategoriaAfterInsert(DataSet: TDataSet);
    procedure qryClienteAfterInsert(DataSet: TDataSet);
    procedure qryOrcamentoAfterInsert(DataSet: TDataSet);
    procedure qryOrcamentoNewRecord(DataSet: TDataSet);
    procedure qryProdutoAfterInsert(DataSet: TDataSet);
    procedure qryUsuarioAfterInsert(DataSet: TDataSet);
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }

function TDataModule1.getSequence(const pNomeSequence: String): String;
begin
     Result := '';
 try
     qryGenerica.close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('SELECT NEXTVAL(' + QuotedStr(pNomeSequence) + ') AS CODIGO');
     qryGenerica.Open;
     Result := qryGenerica.FieldByName('CODIGO').AsString;
 finally
   qryGenerica.Close;
 end;
end;

procedure TDataModule1.qryCategoriaAfterInsert(DataSet: TDataSet);
begin
 qryCategoriacategoriaprodutoid.AsInteger := StrToInt(getSequence('categoria_produto_categoriaprodutoid_seq'));
end;

procedure TDataModule1.qryClienteAfterInsert(DataSet: TDataSet);
begin
  qryClienteclienteid.AsInteger := StrtoInt(getSequence('cliente_clienteid'));
end;

procedure TDataModule1.qryOrcamentoAfterInsert(DataSet: TDataSet);
begin
  qryOrcamentoorcamentoid.AsInteger := StrToInt(getSequence('orcamento_orcamentoid_seq'));
end;

procedure TDataModule1.qryOrcamentoNewRecord(DataSet: TDataSet);
begin
  qryOrcamentodt_orcamento.AsDateTime := now;
  qryOrcamentodt_validade_orcamento.AsDateTime := now+15;

end;

procedure TDataModule1.qryProdutoAfterInsert(DataSet: TDataSet);
begin
  qryProdutoprodutoid.AsInteger := StrtoInt(getSequence('produto_produtoid'));
end;

procedure TDataModule1.qryUsuarioAfterInsert(DataSet: TDataSet);
begin
  qryUsuarioid.AsInteger := StrtoInt(getSequence('usuarios_id_seq'));
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
     ZConnection1.HostName := 'localhost';
     ZConnection1.DataBase := 'postgres';
     ZConnection1.User     := 'postgres';
     ZConnection1.Password := '1234';
     ZConnection1.Port     := 5432;
     ZConnection1.Protocol := 'postgresql';
     ZConnection1.Connected := True;
end;


end.

