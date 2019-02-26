unit admins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, ADODB, DB, StdCtrls, RzLabel, CheckLst,login, Grids, RzGrids,
  ActnList, DBGrids, RzDBGrid, Mask, RzEdit, RzCmboBx,res, RzButton;

type
  TAdmin = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    ADOC1: TADOConnection;
    ADOQ1: TADOQuery;
    DataS1: TDataSource;
    ADOTable1: TADOTable;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    RSGrid1: TRzStringGrid;
    ActionList1: TActionList;
    ProcessionRefresh: TAction;
    RzDBGrid1: TRzDBGrid;
    DataS2: TDataSource;
    RzDBGrid2: TRzDBGrid;
    DataS3: TDataSource;
    ADOQ2: TADOQuery;
    ProcessdetailRefresh: TAction;
    RzEdit1: TRzEdit;
    ADOQ3: TADOQuery;
    RDBGrid4: TRzDBGrid;
    ADOQ4: TADOQuery;
    DataS4: TDataSource;
    revenuedetailRefresh: TAction;
    RCBox1: TRzComboBox;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzEdit6: TRzEdit;
    RzEdit7: TRzEdit;
    RzEdit8: TRzEdit;
    RzEdit9: TRzEdit;
    RzEdit10: TRzEdit;
    RzEdit11: TRzEdit;
    RzEdit12: TRzEdit;
    RzEdit13: TRzEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzButton3: TRzButton;
    procedure FormCreate(Sender: TObject);
    procedure ProcessionRefreshExecute(Sender: TObject);
    procedure RSGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure RSGrid1Click(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure ProcessdetailRefreshExecute(Sender: TObject);
    procedure RzEdit1Change(Sender: TObject);
    procedure revenuedetailRefreshExecute(Sender: TObject);
    procedure RCBox1Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Admin: TAdmin;

implementation

{$R *.dfm}

//窗体切换
procedure ClearMainForm;
var
  pMainForm: Pointer;
begin
  pMainForm           := @Application.MainForm;
  Pointer(pMainForm^) := nil;
end;

procedure TAdmin.FormCreate(Sender: TObject);
begin
RzLabel1.Caption:=UserInfo+',欢迎你使用！';
RzPageControl1.TabIndex:=0;
ProcessionRefresh.Execute;
RzEdit1.Text:='';

RCBox1.Items.Add('');
RCBox1.Items.Add('2018');
RCBox1.Items.Add('2017');
RCBox1.ItemIndex:=0;
end;

procedure TAdmin.ProcessdetailRefreshExecute(Sender: TObject);
begin
ADOQ2.Close;
ADOQ2.SQL.Clear;

if RzEdit1.Text = '' then
begin
  ADOQ2.SQL.Add('select id as ''申请编号'', userid as ''处理人'',price as ''报销价格'',processtime as ''处理时间'',statu as ''处理动作'',remark as ''备注'' from processdetail ;');
end
else
begin
  ADOQ2.SQL.Add('select id as ''申请编号'', userid as ''处理人'',price as ''报销价格'',processtime as ''处理时间'',statu as ''处理动作'',remark as ''备注'' from processdetail where id = '+quotedstr(trim(RzEdit1.Text)));
end;
ADOQ2.Active:=True;
ADOQ2.Open;
end;

procedure TAdmin.ProcessionRefreshExecute(Sender: TObject);
var
sum,i:Integer;
begin

i:=RSGrid1.RowCount-1;
while i <> 0 do
begin
RSGrid1.Cells[0,i]:='';RSGrid1.Cells[1,i]:='';RSGrid1.Cells[2,i]:='';RSGrid1.Cells[3,i]:='';
RSGrid1.Cells[4,i]:='';RSGrid1.Cells[5,i]:='';RSGrid1.Cells[6,i]:='';RSGrid1.Cells[7,i]:='';
i:=i-1;
end;


//获取行数
ADOQ1.Close;
ADOQ1.SQL.Clear;
ADOQ1.SQL.Add('select count(id) as ''num'' from processing');
ADOQ1.Active:=True;
ADOQ1.Open;
sum:=ADOQ1.FieldByName('num').AsInteger;

RSGrid1.RowCount:=sum+1;
RSGrid1.ColCount:=8;
RSGrid1.Cells[0,0]:='申请编号';RSGrid1.Cells[1,0]:='申请人';RSGrid1.Cells[2,0]:='发票联号';RSGrid1.Cells[3,0]:='报销价格';
RSGrid1.Cells[4,0]:='申请时间';RSGrid1.Cells[5,0]:='申请状态';RSGrid1.Cells[6,0]:='备注';RSGrid1.Cells[7,0]:='操作';

//动态生成
ADOQ1.Close;
ADOQ1.SQL.Clear;
ADOQ1.SQL.Add('select * from processing order by createtime');
ADOQ1.Active:=True;
ADOQ1.Open;
i:=1;
ADOQ1.First;
while not ADOQ1.Eof do
begin
  RSGrid1.Cells[0,i]:=Trim(ADOQ1.FieldByName('id').AsString);
  RSGrid1.Cells[1,i]:=Trim(ADOQ1.FieldByName('userid').AsString);
  RSGrid1.Cells[2,i]:=Trim(ADOQ1.FieldByName('invoice').AsString);
  RSGrid1.Cells[3,i]:=Trim(ADOQ1.FieldByName('price').AsString);
  RSGrid1.Cells[4,i]:=Trim(ADOQ1.FieldByName('createtime').AsString);
  RSGrid1.Cells[5,i]:=Trim(ADOQ1.FieldByName('statu').AsString);
  RSGrid1.Cells[6,i]:=Trim(ADOQ1.FieldByName('remark').AsString);

  if RSGrid1.Cells[5,i] = '未审核' then
  begin
    RSGrid1.Cells[7,i]:= '审核';
  end
  else if RSGrid1.Cells[5,i] = '审核中' then
  begin
    RSGrid1.Cells[7,i]:= '审核完成';
  end
  else if RSGrid1.Cells[5,i] = '已审核' then
  begin
    RSGrid1.Cells[7,i]:= '汇款';
  end;
  i:=i+1;
  ADOQ1.Next;
end;
end;

procedure TAdmin.RCBox1Click(Sender: TObject);
begin
revenuedetailRefresh.Execute;
end;

procedure TAdmin.revenuedetailRefreshExecute(Sender: TObject);
var
str:string;
begin

str:=RCBox1.Items[RCBox1.ItemIndex];
if str <> '' then
begin
  ADOQ3.Close;
  ADOQ3.SQL.Clear;
  ADOQ3.SQL.Add('select * from revenue where years = '+quotedstr(trim(str))+' order by quarters');
  ADOQ3.Active:=True;
  ADOQ3.Open;
  ADOQ3.First;
  RzEdit2.Text:=Trim(ADOQ3.FieldByName('income').AsString);
  RzEdit6.Text:=Trim(ADOQ3.FieldByName('expend').AsString);
  RzEdit10.Text:=Trim(ADOQ3.FieldByName('surplus').AsString);
  ADOQ3.Next;

  RzEdit3.Text:=Trim(ADOQ3.FieldByName('income').AsString);
  RzEdit7.Text:=Trim(ADOQ3.FieldByName('expend').AsString);
  RzEdit11.Text:=Trim(ADOQ3.FieldByName('surplus').AsString);
  ADOQ3.Next;

  RzEdit4.Text:=Trim(ADOQ3.FieldByName('income').AsString);
  RzEdit8.Text:=Trim(ADOQ3.FieldByName('expend').AsString);
  RzEdit12.Text:=Trim(ADOQ3.FieldByName('surplus').AsString);
  ADOQ3.Next;

  RzEdit5.Text:=Trim(ADOQ3.FieldByName('income').AsString);
  RzEdit9.Text:=Trim(ADOQ3.FieldByName('expend').AsString);
  RzEdit13.Text:=Trim(ADOQ3.FieldByName('surplus').AsString);
end;



ADOQ4.Close;
ADOQ4.SQL.Clear;
if str = '' then
begin
  ADOQ4.SQL.Add('select times as ''操作时间'',usrid as ''处理人'',price as ''报销价格'',remark as ''备注'' from revenuedetail');
end
else
begin
  ADOQ4.SQL.Add('select times as ''操作时间'',usrid as ''处理人'',price as ''报销价格'',remark as ''备注'' from revenuedetail where datepart(yyyy,times) = '+quotedstr(trim(str)));
end;
ADOQ4.Active:=True;
ADOQ4.Open;
end;

//处理操作
procedure TAdmin.RSGrid1Click(Sender: TObject);
var
C:Integer;
nowstatu:string;
begin
if (RSGrid1.Col <> 7) and (RSGrid1.Row = 0)  then
begin
  exit;
end;

//获取当前状态
C:=RSGrid1.Row;
ADOQ1.Close;
ADOQ1.SQL.Clear;
ADOQ1.SQL.Add('select statu from processing where id = '+quotedstr(trim(RSGrid1.Cells[0,C])));
ADOQ1.Active:=True;
ADOQ1.Open;
nowstatu:=Trim(ADOQ1.FieldByName('statu').AsString);

ADOQ1.Close;
ADOQ1.SQL.Clear;
if (RSGrid1.Cells[7,C] = '审核') and (nowstatu = '未审核') then
begin
  ADOQ1.SQL.Add('update processing set statu = ''审核中'' where id = '+quotedstr(trim(RSGrid1.Cells[0,C]))+';');
  ADOQ1.SQL.Add('insert into processdetail values('+quotedstr(trim(RSGrid1.Cells[0,C]))+','+quotedstr(trim(UserInfo))+','+quotedstr(trim(RSGrid1.Cells[3,C]))+',getdate(),''审核'','+quotedstr(trim(RSGrid1.Cells[6,C]))+');');
  ADOQ1.ExecSQL;
end
else if (RSGrid1.Cells[7,C] = '审核完成') and (nowstatu = '审核中') then
begin
  ADOQ1.SQL.Add('update processing set statu = ''已审核'' where id = '+quotedstr(trim(RSGrid1.Cells[0,C]))+';');
  ADOQ1.SQL.Add('insert into processdetail values('+quotedstr(trim(RSGrid1.Cells[0,C]))+','+quotedstr(trim(UserInfo))+','+quotedstr(trim(RSGrid1.Cells[3,C]))+',getdate(),''审核完成'','+quotedstr(trim(RSGrid1.Cells[6,C]))+');');
  ADOQ1.ExecSQL;
end
else if (RSGrid1.Cells[7,C] = '汇款') and (nowstatu = '已审核') then
begin
  ADOQ1.SQL.Add('insert into processdetail values('+quotedstr(trim(RSGrid1.Cells[0,C]))+','+quotedstr(trim(UserInfo))+','+quotedstr(trim(RSGrid1.Cells[3,C]))+',getdate(),''汇款'','+quotedstr(trim(RSGrid1.Cells[6,C]))+');');
  ADOQ1.SQL.Add('insert into processed values('+quotedstr(trim(RSGrid1.Cells[0,C]))+','+quotedstr(trim(RSGrid1.Cells[1,C]))+','+quotedstr(trim(RSGrid1.Cells[2,C]))+','+quotedstr(trim(RSGrid1.Cells[3,C]))+','+quotedstr(trim(RSGrid1.Cells[4,C]))+',getdate(),''已汇款'','+quotedstr(trim(RSGrid1.Cells[6,C]))+');');
  ADOQ1.SQL.Add('insert into revenuedetail values(getdate(),'+quotedstr(trim(UserId))+','+quotedstr(trim('-'+RSGrid1.Cells[3,C]))+','+quotedstr(trim(RSGrid1.Cells[3,C]))+');');
  ADOQ1.SQL.Add('delete processing where id = '+quotedstr(trim(RSGrid1.Cells[0,C]))+';');
  ADOQ1.ExecSQL;
end
else
begin
  showmessage('其他管理员已操作，无法执行！');
end;
  ProcessionRefresh.Execute;
end;

//绘制最后一层选项
procedure TAdmin.RSGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
str:string;
R:TRect;
begin
if (ACOL = 7) and (ARow <> 0) then
begin
  RSGrid1.Canvas.Font.Style:=RSGrid1.Canvas.Font.Style+[fsUnderline];
end
else if (ACOL <> 7) or (ARow = 0)  then
begin
  RSGrid1.Canvas.Font.Style:=RSGrid1.Canvas.Font.Style-[fsUnderline];
end;
RSGrid1.Canvas.FillRect(Rect);
str := RSGrid1.Cells[ACol,ARow];
RSGrid1.Canvas.TextRect(Rect, str, [tfSingleLine, tfCenter, tfVerticalCenter]);
end;

procedure TAdmin.RzButton3Click(Sender: TObject);
begin
Admin.Hide;                            { 隐藏主窗体 }
ClearMainForm;                         { 销毁 Applicaiton 的主窗体 }
Application.CreateForm(TForm1, Form1);
Application.CreateForm(TForm2, Form2);
Form1.show;
Admin.Destroy;
end;

procedure TAdmin.RzEdit1Change(Sender: TObject);
begin
ProcessdetailRefresh.Execute;
end;

procedure TAdmin.RzPageControl1Change(Sender: TObject);
begin
if RzPageControl1.TabIndex = 0 then
begin
   ProcessionRefresh.Execute;
end
else if RzPageControl1.TabIndex = 2 then
begin
  RzEdit1.Text:='';
  ProcessdetailRefresh.Execute;
end
else if RzPageControl1.TabIndex = 1 then
begin
//showmessage('1');
  ADOQ3.Close;
  ADOQ3.SQL.Clear;
  ADOQ3.SQL.Add('select id as ''申请编号'',userid as ''申请人'', invoice as ''发票联号'',price as ''报销价格'',createtime as ''申请时间'',compeltetime as ''完成时间'',statu as ''申请状态'',remark as ''备注'' from processed');
  ADOQ3.Active:=True;
  ADOQ3.Open;
end
else if RzPageControl1.TabIndex = 3 then
begin
  revenuedetailRefresh.Execute;
end;



end;

end.
