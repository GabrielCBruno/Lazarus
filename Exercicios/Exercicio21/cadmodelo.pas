unit CadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    btnEditar: TButton;
    btnExcluir: TButton;
    btnGravar: TButton;
    btnNovo: TButton;
    btnSair: TButton;
    Panel1: TPanel;
    procedure btnNovoClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }

procedure TCadModeloF.Panel1Click(Sender: TObject);
begin

end;

procedure TCadModeloF.btnNovoClick(Sender: TObject);
begin

end;

end.

