program Project;

uses
  Forms,
  login in 'login.pas' {Form1},
  res in 'res.pas' {Form2},
  users in 'users.pas' {User},
  admins in 'admins.pas' {Admin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
