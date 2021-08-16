unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, CPP_Func,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtDlgs, Unit2;

type
  TCPP = class(TForm)
    barcode: TImage;
    barcode_in: TEdit;
    barcode_in_button: TButton;
    barcode_out_button: TButton;
    barcode_out: TEdit;
    barcode_decode_button: TButton;
    SName: TEdit;
    FName: TEdit;
    MName: TEdit;
    Group: TEdit;
    Button4: TButton;
    Edit11: TEdit;
    Button1: TButton;
    DateTime: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    MainMenu1: TMainMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Button2: TButton;
    procedure barcode_in_buttonClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure barcode_decode_buttonClick(Sender: TObject);
    procedure barcode_out_buttonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CPP: TCPP;

implementation

{$R *.dfm}

procedure TCPP.barcode_in_buttonClick(Sender: TObject);
var
  x, y, numl: integer;
  s: string;
begin
  if (Number(barcode_in.Text)) and (barcode_in.Text <> '') then
  begin
    s := barcode_in.Text;
    barcode.AutoSize := false;
    barcode.Width := Length(s) + 1;
    barcode.Height := 135;
    barcode.Picture := nil;
    y := 0;
    while y <> Length(s) do
    begin
      Inc(y);
      numl := StrToInt(s[y]);
      x := 0;
      while x <> numl * 15 do
      begin
        Inc(x);
        barcode.Canvas.Pixels[y, x] := 0;
      end;
    end;
  end
  else
    ShowMessage('Неверноый штрих-код!');
end;

procedure TCPP.barcode_out_buttonClick(Sender: TObject);
var
  x, y, num: integer;
  s: string;
  BOOL: Boolean;
begin
  BOOL := false;
  x := 0;
  y := 0;
  while x <> barcode.Width - 1 do
  begin
    Inc(x);
    while y <> barcode.Height do
    begin
      Inc(y);
      if BOOL then
      begin
        if barcode.Canvas.Pixels[x, y] <> 0 then
        begin
          BOOL := false;
          s := s + inttostr(num div 15);
          num := 0;
        end
        else
          Inc(num);
      end
      else if barcode.Canvas.Pixels[x, y] = 0 then
      begin
        BOOL := true;
        num := 2;
      end
      else if (y = 1) then
      begin
        if x = 1 then
        begin
          x := barcode.Width - 1;
          y := barcode.Height;
          s := 'Null';
        end
        else
        begin
          s := s + '0';
          y := barcode.Height;
        end;
      end

    end;
    y := 0;
  end;

  barcode_out.Text := s;
end;

procedure TCPP.barcode_decode_buttonClick(Sender: TObject);
var
  i: integer;
  data: TFormat;
  s, a: string;
begin
  if (Number(barcode_out.Text)) and (barcode_out.Text <> '') and
    (Length(barcode_out.Text) > 29) then
  begin
    data := FormatData(barcode_out.Text);
    s := 'Time: ' + data.time + ' (' +
      DateToStr(UnixToDate(StrToInt64(data.time))) + ')' + #13#10 + 'Group: ' +
      NumToTxt(data.Group) + #13#10 + 'Name: ' + NumToTxt(data.Name);
    if Form2.CheckBox1.Checked then
    begin
      a := 'SELECT TIME FROM cpp where code =' + #39 + barcode_out.Text + #39;
      a := trim(Form2.SQL(a, 'TIME', Form2.ADOQuery1));
      if a = '' then
        a := '0';
      s := s + #13#10 + 'Доступ: ' + BoolToStr(DateToUNIX(Now) <= StrToInt64(a))
    end
    else
      s := s + #13#10 + 'Доступ: ' +
        BoolToStr(DateToUNIX(Now) <= StrToInt64(data.time));
    ShowMessage(s);
  end
  else
    ShowMessage('Неверный штрих-код!');
end;

procedure TCPP.Button1Click(Sender: TObject);
begin
  if CPP.ClientHeight = 170 then
    CPP.ClientHeight := 275
  else
    CPP.ClientHeight := 170;
end;

procedure TCPP.Button2Click(Sender: TObject);
var
  s: string;
begin
  if Form2.CheckBox1.Checked then
  begin
    try
      Form2.SQL('DELETE FROM CPP WHERE CODE='+#39+Edit11.Text+#39, '', Form2.ADOQuery1);
    except
      on E: Exception do
        s := E.Message;
    end;
    if Pos('not return a result set', s) <> 0 then
      ShowMessage('Успешно удалили запись из БД!')
    else
      ShowMessage(s);
  end
  else
    ShowMessage('Подключитесь к БД!');
end;

function CheckGroup(gr: string): Boolean;
var
  i, num: integer;
  alf: string;
begin
  alf := 'йцукенгшщзхъфывапролджэячсмитьбюqwertyuiopasdfghjklzxcvbnm';
  num := 0;
  if Length(gr) < 8 then
  begin
    for i := 1 to Length(gr) do
      if Pos(AnsiUpperCase(gr[i]), AnsiUpperCase(alf)) <> 0 then
        Inc(num);
    if num > 3 then
      Result := false
    else
      Result := true;
  end
  else
    Result := false;
end;

procedure TCPP.Button4Click(Sender: TObject);
var
  i: integer;
  gr, Name, time, s, a: string;
begin
  if CheckGroup(Group.Text) then
  Begin

    time := inttostr(DateToUNIX(DateTime.Date));
    gr := TxtToNum(Group.Text);
    while Length(gr) <> 20 do
      gr := '0' + gr;
    name := TxtToNum(SName.Text + ' ' + FName.Text + ' ' + MName.Text);
    Edit11.Text := time + gr + name;
    if Form2.CheckBox1.Checked then
    begin
      a := 'SELECT CODE FROM cpp where code =' + #39 + Edit11.Text + #39;
      s := trim(Form2.SQL(a, 'CODE', Form2.ADOQuery1));
      if Edit11.Text = s then
        ShowMessage('В БД Уже имеется этот пользователь')
      else
      begin
        try
          Form2.SQL('INSERT INTO CPP SELECT ' + #39 + Edit11.Text + #39 + ',' +
            #39 + SName.Text + ' ' + FName.Text + ' ' + MName.Text + #39 + ',' +
            #39 + Group.Text + #39 + ',' + time, '', Form2.ADOQuery1);
        except
          on E: Exception do
            s := E.Message;
        end;
        if Pos('not return a result set', s) <> 0 then
          ShowMessage('Успешно добавили запись в БД!')
        else
          ShowMessage(s);
      end;
    end;
  End
  Else
    ShowMessage('Неверно указана группа!');
end;

procedure TCPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Form2.ADOConnection1.Connected then
Form2.ADOConnection1.Connected:=false;
end;

procedure TCPP.FormCreate(Sender: TObject);
begin
  CPP.ClientHeight := 170;

end;

procedure TCPP.N1Click(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir := GetCurrentDir;
  barcode.AutoSize := true;
  if OpenPictureDialog1.Execute then
    barcode.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TCPP.N2Click(Sender: TObject);
begin
  SavePictureDialog1.InitialDir := GetCurrentDir;
  if SavePictureDialog1.Execute then
    barcode.Picture.SaveToFile(SavePictureDialog1.FileName + '.bmp');
end;

procedure TCPP.N4Click(Sender: TObject);
begin
  N1Click(Self);
end;

procedure TCPP.N5Click(Sender: TObject);
begin
  N2Click(Self);
end;

procedure TCPP.N6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TCPP.N8Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

end.
