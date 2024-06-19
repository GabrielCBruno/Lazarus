unit untSistema;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, OpLogin;

implementation

procedure iniciarSistema ();
begin
  OpLoginF := TOpLoginF.Create(TimePMString);
  OpLoginF.Show;
end;

end.

