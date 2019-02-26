unit users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolWin, ActnMan, ActnCtrls, PlatformDefaultStyleActnCtrls,
  ActnList, RzLabel, RzTabs, ADODB, Grids, DBGrids, RzDBGrid, DB, RzButton,
  Mask, RzEdit, RzRadChk;

type
  TUser = class(TForm)
    RzLabel1: TRzLabel;
    PC1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzLabel2: TRzLabel;
    ADOC1: TADOConnection;
    ADOQ1: TADOQuery;
    DataS1: TDataSource;
    RzDBGrid1: TRzDBGrid;
    RzDBGrid2: TRzDBGrid;
    ADOQ2: TADOQuery;
    DataS2: TDataSource;
    ADOTable1: TADOTable;
    TabSheet3: TRzTabSheet;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzButton1: TRzButton;
    RzCB1: TRzCheckBox;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    procedure FormCreate(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure RzEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure RzButton1Click(Sender: TObject);
    procedure RzCB1Click(Sender: TObject);
    procedure RzEdit1Change(Sender: TObject);
    procedure RzEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RzEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  User: TUser;

implementation

{$R *.dfm}
uses login,res;

//窗体切换
procedure ClearMainForm;
var
  pMainForm: Pointer;
begin
  pMainForm           := @Application.MainForm;
  Pointer(pMainForm^) := nil;
end;

procedure TUser.FormCreate(Sender: TObject);
begin
RzLabel1.Caption:=UserInfo+'，欢迎你使用';
ADOQ1.Close;
ADOQ1.SQL.Clear;
ADOQ1.SQL.Add('select * from processing where userid = '+UserId);
ADOQ1.Active := true;
ADOQ1.Open;

ADOQ2.Close;
ADOQ2.SQL.Clear;
ADOQ2.SQL.Add('select id as ''申请编号'',userid as ''申请人'', invoice as ''发票联号'',price as ''报销价格'',createtime as ''申请时间'',compeltetime as ''完成时间'',statu as ''申请状态'',remark as ''备注'' from processed where userid = '+UserId);
ADOQ2.Active := true;
ADOQ2.Open;

PC1.TabIndex:=0;
end;

//切换页面时更新
procedure TUser.PC1Change(Sender: TObject);
begin
  //showmessage(IntTostr(PC1.TabIndex));
  if PC1.TabIndex = 0 then
  begin
    ADOQ1.Close;
    ADOQ1.SQL.Clear;
    ADOQ1.SQL.Add('select * from processing where userid = '+UserId);
    ADOQ1.Active := true;
    ADOQ1.Open;
  end
  else if PC1.TabIndex = 1 then
  begin
    ADOQ2.Close;
    ADOQ2.SQL.Clear;
    ADOQ2.SQL.Add('select id as ''申请编号'',userid as ''申请人'', invoice as ''发票联号'',price as ''报销价格'',createtime as ''申请时间'',compeltetime as ''完成时间'',statu as ''申请状态'',remark as ''备注'' from processed where userid = '+UserId);
    ADOQ2.Active := true;
    ADOQ2.Open;
  end
  else
  begin
    RzEdit1.Text:='';
    RzEdit2.Text:='';
    RzEdit3.Text:='';
    RzCB1.Hide;
  end;

end;

procedure TUser.RzButton1Click(Sender: TObject);
var
sum,i:Integer;
tractionid,sumstr:string;
begin
if  (RzEdit1.Text = '') or (RzEdit2.Text = '') or (RzEdit3.Text = '') then
begin
  showmessage('有信息未填完整！请重新填写');
  exit;
end;
if length(RzEdit1.Text)<8 then
begin
  showmessage('发票联号不规范！');
  exit;
end;


//计算申请编号
ADOQ1.Close;
ADOQ1.SQL.Clear;
ADOQ1.SQL.Add('select count(id) as ''num'' from processing');
ADOQ1.Active:=True;
ADOQ1.Open;
sum:=ADOQ1.FieldByName('num').AsInteger;

ADOQ1.Close;
ADOQ1.SQL.Clear;
ADOQ1.SQL.Add('select count(id) as ''num'' from processed');
ADOQ1.Active:=True;
ADOQ1.Open;
sum:=sum+ADOQ1.FieldByName('num').AsInteger;

sum:=sum+1;
sumstr:=IntTostr(sum);
tractionid:='T';
i:=5-length(sumstr);
while i <> 0  do
begin
  tractionid:=tractionid+'0';
  i:=i-1;
end;
tractionid:=tractionid+sumstr;

ADOQ1.Close;
ADOQ1.SQL.Clear;
ADOQ1.SQL.Add('insert into processing values('+quotedstr(trim(tractionid))+','+quotedstr(trim(UserId))+','+quotedstr(trim(RzEdit1.Text))+','+quotedstr(trim(RzEdit2.Text))+',getdate(),''未审核'','+quotedstr(trim(RzEdit3.Text))+')');
ADOQ1.ExecSQL;
showmessage('成功申请！');
RzEdit1.Text:='';
RzEdit2.Text:='';
RzEdit3.Text:='';
PC1.TabIndex:=0;
end;


procedure TUser.RzButton3Click(Sender: TObject);
begin
User.Hide;                            { 隐藏主窗体 }
ClearMainForm;                         { 销毁 Applicaiton 的主窗体 }
Application.CreateForm(TForm1, Form1);
Application.CreateForm(TForm2, Form2);
Form1.show;
User.Destroy;
end;

procedure TUser.RzCB1Click(Sender: TObject);
begin

end;

//只能输入数字
procedure TUser.RzEdit1Change(Sender: TObject);
begin
if length(RzEdit1.Text) = 8 then
begin
RzCB1.Checked:=True;
RzCB1.Show
end
else
begin
RzCB1.Hide;
end;

end;

procedure TUser.RzEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_DOWN) or (Key = VK_RETURN) then RzEdit2.SetFocus;
end;

procedure TUser.RzEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if (Length(RzEdit1.Text) > 7) then Key:=#0;

end;

procedure TUser.RzEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_DOWN) or (Key = VK_RETURN) then RzEdit3.SetFocus;
if (Key = VK_UP) then  RzEdit1.SetFocus;

end;

procedure TUser.RzEdit2KeyPress(Sender: TObject; var Key: Char);
var
i:Integer;
begin
if (Key = '.') and (Length(RzEdit2.Text) > 0) then  //处理小数点
  begin
    for i := 1 to length(RzEdit2.text) do
    begin
      if RzEdit2.Text[i] = '.' then Key := #0;
    end;
  end
  else
  begin
    if not (Key in ['0'..'9',#8]) then Key := #0;  //处理非数字
  end;
end;

procedure TUser.RzEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) then  RzEdit2.SetFocus;
  if (Key = VK_RETURN) then RzButton1Click(self);
end;

end.
