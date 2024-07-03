unit CadItemOrc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, dmPrincipal;

type

  { TCadItemOrcF }

  TCadItemOrcF = class(TForm)
    bitbtnCancelar: TBitBtn;
    bitbtnInserir: TBitBtn;
    DBedtProdutoId: TDBEdit;
    DBedtDescProduto: TDBEdit;
    DBedtQuant: TDBEdit;
    DBedtVl_Unit: TDBEdit;
    DBedtVl_Total: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadItemOrcF: TCadItemOrcF;

implementation

{$R *.lfm}

{ TCadItemOrcF }

procedure TCadItemOrcF.bitbtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TCadItemOrcF.bitbtnInserirClick(Sender: TObject);
begin
  DataModule1.qryOrcamentoItens.Insert;
end;

procedure TCadItemOrcF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction := caFree;
end;

end.

