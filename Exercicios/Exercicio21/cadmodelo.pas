unit CadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    bitbtnGravar: TBitBtn;
    bitbtnNovo: TBitBtn;
    bitbtnEditar: TBitBtn;
    btnExcluir: TButton;
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

