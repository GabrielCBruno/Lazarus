unit CadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ComCtrls, StdCtrls, DBGrids;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    bitbtnCancelar: TBitBtn;
    bitbtnEditar: TBitBtn;
    bitbtnExcluir: TBitBtn;
    bitbtnFechar: TBitBtn;
    bitbtnGravar: TBitBtn;
    bitbtnNovo: TBitBtn;
    bitbtnPesquisar: TBitBtn;
    DBGridPrincipal: TDBGrid;
    edtPesquisar: TEdit;
    Label1: TLabel;
    lblTitulo: TLabel;
    pagPrincipal: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pagPesquisa: TTabSheet;
    pagCadastro: TTabSheet;
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }

end.

