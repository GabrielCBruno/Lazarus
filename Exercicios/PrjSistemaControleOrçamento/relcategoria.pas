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
end;

end.

