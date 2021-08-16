unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SaveInfo;
    procedure LoadInfo;
    function SQL(query, param: string; var ADOQuery: TADOQuery): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function TForm2.SQL(query, param: string; var ADOQuery: TADOQuery): string;
var
  f: TField;
  s: string;
begin
  with ADOQuery do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add(query);
    Active := True;
    f := ADOQuery.Fieldbyname(param);
  end;
  while not ADOQuery.Eof do
  begin
    s := s + #13#10 + f.AsString;
    ADOQuery.Next;
  end;
  result := s;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if Button1.Caption = 'Установить соединение' then
  begin
    ADOConnection1.ConnectionString := 'Provider=SQLNCLI11.1;Password=' +
      Edit3.Text + ';Persist Security Info=True;User ID=' + Edit2.Text +
      ';Initial Catalog=' + Edit4.Text + ';Data Source=' + Edit1.Text;
    try
      ADOConnection1.Connected := True
    except

      on e: Exception do
      begin
        ShowMessage(e.Message);

        CheckBox1.Checked := False;
      end;

    end;
  end
  else
    ADOConnection1.Connected := False;
  if ADOConnection1.Connected then
  begin
    Button1.Caption := 'Отключиться';
    Form2.Caption := 'Подключено';
  end
  else
  begin
    Button1.Caption := 'Установить соединение';
    CheckBox1.Checked := False;
    Form2.Caption := 'Отключено';
  end;

end;

function BoolToStr(bool: boolean): string;
begin
  if bool then
    result := 'true'
  else
    result := 'false';
end;

function StrToBool(str: string): boolean;
begin
  if str = 'true' then
    result := True
  else
    result := False;

end;

procedure TForm2.SaveInfo;
var
  Data: TStringList;
begin
  Data := TStringList.Create;
  Data.Add(BoolToStr(CheckBox1.Checked));
  Data.Add(Edit1.Text);
  Data.Add(Edit2.Text);
  Data.Add(Edit3.Text);
  Data.Add(Edit4.Text);
  Data.SaveToFile(ExtractFileName(Application.Name) + 'bdset');
  Data.Free;
end;

procedure TForm2.LoadInfo;
var
  Data: TStringList;
begin
  if FileExists(ExtractFileName(Application.Name) + 'bdset') then
  begin
    Data := TStringList.Create;
    Data.LoadFromFile(ExtractFileName(Application.Name) + 'bdset');
    CheckBox1.Checked := StrToBool(Data.Strings[0]);
    Edit1.Text := Data.Strings[1];
    Edit2.Text := Data.Strings[2];
    Edit3.Text := Data.Strings[3];
    Edit4.Text := Data.Strings[4];
    Data.Free;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveInfo;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  LoadInfo;
  if (CheckBox1.Checked = True) and (ADOConnection1.Connected = False) then
    Button1.Click;

end;

end.
