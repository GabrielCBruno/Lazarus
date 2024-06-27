unit DMPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection;

type

  { TDMPrincipalF }

  TDMPrincipalF = class(TDataModule)
    ZConnection1: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DMPrincipalF: TDMPrincipalF;

implementation

{$R *.lfm}

{ TDMPrincipalF }

procedure TDMPrincipalF.DataModuleCreate(Sender: TObject);
begin
     ZConnection1.HostName := 'localhost';
     ZConnection1.Password := '1234';
     ZConnection1.Port := 5432;
     ZConnection1.User:= 'postgres';
     ZConnection1.Protocol:= 'postgresql';
     ZConnection1.Connect;
end;

end.

