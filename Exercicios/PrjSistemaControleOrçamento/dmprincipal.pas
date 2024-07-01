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
    qryCategoria: TZQuery;
    qryUsuario: TZQuery;
    //procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    function getSequence(const pNomeSequence: String): String;
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

