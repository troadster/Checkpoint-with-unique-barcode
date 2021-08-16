program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {CPP},
  CPP_Func in 'CPP_Func.pas',
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := ' œœ';
  Application.CreateForm(TCPP, CPP);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
