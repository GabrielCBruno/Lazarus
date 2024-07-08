unit relCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet, ZDataset;

type

  { TrelCategoriaF }

  TrelCategoriaF = class(TForm)
    bitbtnRelCategoria: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frRepCategoria: TfrReport;
    qryCategoria: TZQuery;
    procedure bitbtnRelCategoriaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  relCategoriaF: TrelCategoriaF;

implementation

{$R *.lfm}

{ TrelCategoriaF }

procedure TrelCategoriaF.bitbtnRelCategoriaClick(Sender: TObject);
begin
  frRepCategoria.LoadFromFile('RelCategoria.lrf');
  frRepCategoria.PrepareReport;
  frRepCategoria.ShowReport;
  Close;
end;

procedure TrelCategoriaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qryCategoria.Close;
  CloseAction:= caFree;
end;

procedure TrelCategoriaF.FormShow(Sender: TObject);
begin
  qryCategoria.Open;
end;

end.

