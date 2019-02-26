unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls,res, CheckLst, RzCmboBx, RzDBCmbo, ActnList,
  RzLabel;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RzLabel1: TRzLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  UserInfo,UserId: string;
implementation


{$R *.dfm}
uses users,admins;
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

//窗体切换
procedure ClearMainForm;
var
  pMainForm: Pointer;
begin
  pMainForm           := @Application.MainForm;
  Pointer(pMainForm^) := nil;
end;

procedure TForm1.Action1Execute(Sender: TObject);
var
  str:string;
  pwd:string;
  turepwd:string;
  tmpstr:string;
  usrpermission:Integer;
begin
str:=Edit1.Text;
pwd:=Edit2.Text;
str:=Changepwd(str);
pwd:=ChangePwd(pwd);
if str = '' then
begin
showmessage('未填写用户账户！');
Edit1.SetFocus;
end

else
begin
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('select * from usr where id = '+quotedstr(trim(str)));
ADOQuery1.Active:=true;
ADOQuery1.Open;
tmpstr:=ADOQuery1.FieldByName('username').AsString;
usrpermission:=ADOQuery1.FieldByName('permission').AsInteger;
ADOQuery1.Close;
if tmpstr = '' then
  begin
    showmessage('不存在此用户，请先注册！');
    Edit1.Text:='';
    Edit1.SetFocus;
  end
else
  begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select convert(nvarchar(100),DECRYPTBYASYMKEY(ASYMKEY_ID(''my_key''),(select pwd from usr where id = '+str+'),N''666666'')) as ''ming''');
  ADOQuery1.Active := true;
  ADOQuery1.Open;
  turepwd:=ADOQuery1.FieldByName('ming').AsString;
  ADOQuery1.Close;
  if(pwd = turepwd) then
    begin
    UserInfo:=tmpstr;
    UserId:=str;
    //showmessage(UserInfo);
    Form1.Hide;                            { 隐藏主窗体 }
    ClearMainForm;                         { 销毁 Applicaiton 的主窗体 }
    if usrpermission = 2 then
    begin
      Application.CreateForm(TUser, User);
      User.show;
    end
    else if usrpermission = 1 then
    begin
      Application.CreateForm(TAdmin, Admin);
      Admin.show;
    end;
    Form1.Destroy;
    Form2.Destroy;
    //showmessage(pwd+turepwd);
    end
  else
    begin
    showmessage('密码错误！请重新输入！');
    Edit2.Text:='';
    Edit2.SetFocus;
    end;
  end;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  str:string;
  pwd:string;
  turepwd:string;
  tmpstr:string;
  usrpermission:Integer;
begin
str:=Edit1.Text;
pwd:=Edit2.Text;
str:=Changepwd(str);
pwd:=ChangePwd(pwd);
if str = '' then
begin
showmessage('未填写用户账户！');
Edit1.SetFocus;
end

else
begin
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('select * from usr where id = '+quotedstr(trim(str)));
ADOQuery1.Active:=true;
ADOQuery1.Open;
tmpstr:=ADOQuery1.FieldByName('username').AsString;
usrpermission:=ADOQuery1.FieldByName('permission').AsInteger;
ADOQuery1.Close;
if tmpstr = '' then
  begin
    showmessage('不存在此用户，请先注册！');
    Edit1.Text:='';
    Edit1.SetFocus;
  end
else
  begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select convert(nvarchar(100),DECRYPTBYASYMKEY(ASYMKEY_ID(''my_key''),(select pwd from usr where id = '+str+'),N''666666'')) as ''ming''');
  ADOQuery1.Active := true;
  ADOQuery1.Open;
  turepwd:=ADOQuery1.FieldByName('ming').AsString;
  ADOQuery1.Close;
  if(pwd = turepwd) then
    begin
    UserInfo:=tmpstr;
    UserId:=str;
    //showmessage(UserInfo);
    Form1.Hide;                            { 隐藏主窗体 }
    ClearMainForm;                         { 销毁 Applicaiton 的主窗体 }
    if usrpermission = 2 then
    begin
      Application.CreateForm(TUser, User);
      User.show;
    end
    else if usrpermission = 1 then
    begin
      Application.CreateForm(TAdmin, Admin);
      Admin.show;
    end;
    Form1.Destroy;
    Form2.Destroy;
    //showmessage(pwd+turepwd);
    end
  else
    begin
    showmessage('密码错误！请重新输入！');
    Edit2.Text:='';
    Edit2.SetFocus;
    end;
  end;
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Form2.showmodal;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_DOWN then Edit2.SetFocus;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
Action1.Execute
end;
end;

procedure TForm1.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_UP then
begin
Edit1.SetFocus;
end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
Key:=#0;
Action1.Execute;

end;
end;

end.
