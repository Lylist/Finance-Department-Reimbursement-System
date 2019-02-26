unit res;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, RzButton, RzRadChk, RzLabel;

type
  TForm2 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label6: TLabel;
    RzCB1: TRzCheckBox;
    RzLabel1: TRzLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

//处理密码防止sql注入
function ChangePwd(str:string) : string;
var
i,j:Integer;
rep:string;
begin
  rep:='!#$%^*';
  j:=1;
  i:=pos('-',str);
  while i<>0 do
  begin
    delete(str,i,1);
    insert(rep[j],str,i);
    i:=pos('-',str);
    j:=j mod 6;
    j:=j+1;
  end;
  Result:=str;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
pwd,tmpstr:string;
begin
//有未填项
if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or (Edit4.Text = '') then
begin
  showmessage('信息未填完整！');
  exit;
end;

//密码长度不够
if length(Edit3.Text) < 6 then
begin
  showmessage('密码长度不够！');
  exit;
end;

//两次密码不一致
if Edit3.Text <> Edit4.Text then
begin
  showmessage('两次密码不一致！');
  exit;
end;

pwd:=ChangePwd(Edit3.Text);
tmpstr:=Edit2.Text;
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Text:='insert into usr values('+quotedstr(trim(Edit1.Text))+','+quotedstr(trim(tmpstr))+',2,ENCRYPTBYASYMKEY(ASYMKEY_ID(''my_key''),Convert(nvarchar(100),'+quotedstr(trim(pwd))+')))';
ADOQuery1.ExecSQL;
showmessage('注册成功！');
ADOQuery1.Close;
Form2.CloseModal;
Form2.Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form2.CloseModal;
Form2.Close;
end;

procedure TForm2.Edit1Change(Sender: TObject);
var
idstr:string;
begin
idstr:=Edit1.Text;
if length(idstr) <> 6 then
begin
  //showmessage('请输入六位账户号(学号或者工号)');
  //Edit1.Focused;
  exit;
end;

ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('select * from usr where id = '+idstr);
ADOQuery1.Active:=true;
ADOQuery1.Open;
idstr:=ADOQuery1.FieldByName('username').AsString;
ADOQuery1.Close;
if idstr <> '' then
begin
  showmessage('此用户已注册!');
  Edit1.Text:='';
  Edit1.Focused;
end;
end;

procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_DOWN) or (Key = VK_RETURN) then Edit2.SetFocus;
end;

procedure TForm2.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_DOWN) or (Key = VK_RETURN) then Edit3.SetFocus;
if (Key = VK_UP) then Edit1.SetFocus;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
if length(Edit3.Text) < 6 then
begin
  RzCB1.Checked:=False;
end
else
begin
  RzCB1.Checked:=True;
end;
end;

procedure TForm2.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_DOWN) or (Key = VK_RETURN) then Edit4.SetFocus;
if (Key = VK_UP) then Edit2.SetFocus;
end;

procedure TForm2.Edit4Change(Sender: TObject);
var
pwdone,pwdtwo:string;
begin
pwdone:=ChangePwd(Edit3.Text);
pwdtwo:=ChangePwd(Edit4.Text);
if pwdone <> pwdtwo then
begin
  //showmessage('两次密码不匹配，请重新输入');
  //Edit4.Text:='';
  //Edit4.Focused;
  Label6.Caption:='不匹配'
end
else
begin
  Label6.Caption:='匹配'
end;
end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
Label6.Caption:='';
end;

procedure TForm2.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_UP) then Edit3.SetFocus;
if Key = VK_RETURN then Button1Click(self);

end;

end.
