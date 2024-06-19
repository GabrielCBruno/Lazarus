unit OpSobre;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TOpSobreF }

  TOpSobreF = class(TForm)
    btnSair: TButton;
    lblBancoDados: TLabel;
    lblAnoDesenv: TLabel;
    lblEmpresa: TLabel;
    lblSistema: TLabel;
    lblLinguagem: TLabel;
    lblTittulo: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  OpSobreF: TOpSobreF;

implementation

{$R *.lfm}

{ TOpSobreF }

procedure TOpSobreF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

procedure TOpSobreF.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.

