unit FormGenerico;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ZDataset;

type

  { TFormGenericoF }

  TFormGenericoF = class(TForm)
    dsGenerica: TDataSource;
    DBcbGenerico: TDBComboBox;
    Label1: TLabel;
    qryGenerica2: TZQuery;
  private

  public

  end;

var
  FormGenericoF: TFormGenericoF;

implementation

{$R *.lfm}

end.

