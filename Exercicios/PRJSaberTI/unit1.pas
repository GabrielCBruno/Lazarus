unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, Unit2,
  ZDataset, ZAbstractRODataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    dsUsuarios: TDataSource;
    DBGrid2: TDBGrid;
    dsCliente: TDataSource;
    DBGrid1: TDBGrid;
    qryCliente: TZQuery;
    qryClienteclienteid: TZIntegerField;
    qryClientecpf_cnpj_cliente: TZRawStringField;
    qryClientenome_cliente: TZRawStringField;
    qryClientetipo_cliente: TZRawStringField;
    qryUsuarios: TZQuery;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

end.

