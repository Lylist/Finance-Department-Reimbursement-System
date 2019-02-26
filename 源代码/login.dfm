object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #30331#38470
  ClientHeight = 487
  ClientWidth = 866
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 850
    Height = 489
    TabOrder = 0
    object Label1: TLabel
      Left = 256
      Top = 176
      Width = 70
      Height = 19
      Caption = #29992#25143#36134#25143':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 288
      Top = 262
      Width = 38
      Height = 19
      Caption = #23494#30721':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel1: TRzLabel
      Left = 256
      Top = 40
      Width = 324
      Height = 33
      Caption = #27426#36814#20351#29992#36130#21153#22788#25253#38144#31995#32479#65281
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 352
      Top = 164
      Width = 137
      Height = 31
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 352
      Top = 264
      Width = 185
      Height = 33
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = Edit2KeyDown
      OnKeyPress = Edit2KeyPress
    end
    object Button1: TButton
      Left = 240
      Top = 368
      Width = 75
      Height = 25
      Caption = #30331#38470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 512
      Top = 368
      Width = 75
      Height = 25
      Caption = #27880#20876
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=980502;Persist Security Info=True;U' +
      'ser ID=lyl;Initial Catalog=bit-pc;Data Source=DESKTOP-PTSQUMO;Us' +
      'e Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;W' +
      'orkstation ID=DESKTOP-PTSQUMO;Use Encryption for Data=False;Tag ' +
      'with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 24
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'usr'
    Left = 24
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    DataSource = DataSource1
    Parameters = <>
    Left = 24
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 24
    Top = 144
  end
  object ActionList1: TActionList
    Left = 24
    Top = 264
    object Action1: TAction
      Caption = 'Action1'
      OnExecute = Action1Execute
    end
  end
end
