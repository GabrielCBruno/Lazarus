unit DMPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    ZConnection1: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
     ZConnection1.HostName := 'localhost';
     ZConnection1.Password := '1234';
     ZConnection1.Port := 5432;
     ZConnection1.User:= 'postgres';
     ZConnection1.Protocol:= 'postgresql';
     ZConnection1.Connect;
end;

end.

