unit relClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_DBSet,
  LR_Class, ZDataset, ZAbstractRODataset;

type

  { TrelClientesF }

  TrelClientesF = class(TForm)
    bitbtnRelClientes: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryClienteRelatorio: TZQuery;
    qryClienteRelatorioclienteid: TZIntegerField;
    qryClienteRelatoriocpf_cnpj_cliente: TZRawStringField;
    qryClienteRelatorionome_cliente: TZRawStringField;
    qryClienteRelatoriotipo_cliente: TZRawStringField;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  relClientesF: TrelClientesF;

implementation

{$R *.lfm}

{ TrelClientesF }

procedure TrelClientesF.FormShow(Sender: TObject);
begin
  qryClienteRelatorio.Open;
end;

procedure TrelClientesF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryClienteRelatorio.Close;
  CloseAction := caFree;
end;

end.

