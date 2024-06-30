unit cadcliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, CadModelo,
  ZDataset ;

type

  { TcadclienteF }

  TcadclienteF = class(TCadModeloF)
    dsCliente: TDataSource;
    qryCliente: TZQuery;
    procedure bitbtnNovoClick(Sender: TObject);
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

procedure TcadclienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryCliente.Close;
  CloseAction := caFree;
end;

procedure TcadclienteF.FormShow(Sender: TObject);
begin
  qryCliente.Open;
  pag
end;

end.

