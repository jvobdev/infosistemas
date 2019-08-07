program InfoSistema;

uses
  Vcl.Forms,
  UInfoSistemas in 'UInfoSistemas.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
