unit relCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    bitbtnRelCategoria: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frRepCategoria: TfrReport;
    qryCategoria: TZQuery;
    procedure bitbtnRelCategoriaClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bitbtnRelCategoriaClick(Sender: TObject);
begin
  frRepCategoria.LoadFromFile('relCategoria.lrf');
  frRepCategoria.PrepareReport;
  frRepCategoria.ShowReport;
end;

end.

