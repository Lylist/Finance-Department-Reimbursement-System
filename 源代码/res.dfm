object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #27880#20876
  ClientHeight = 486
  ClientWidth = 865
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
  object Label2: TLabel
    Left = 232
    Top = 110
    Width = 80
    Height = 19
    Caption = #29992#25143#36134#25143#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 247
    Top = 176
    Width = 64
    Height = 19
    Caption = #29992#25143#21517#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 259
    Top = 239
    Width = 48
    Height = 19
    Caption = #23494#30721#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 232
    Top = 312
    Width = 80
    Height = 19
    Caption = #30830#35748#23494#30721#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 623
    Top = 272
    Width = 3
    Height = 13
  end
  object RzLabel1: TRzLabel
    Left = 272
    Top = 24
    Width = 324
    Height = 33
    Caption = #27426#36814#27880#20876#36130#21153#22788#25253#38144#31995#32479#65281
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 335
    Top = 110
    Width = 138
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = #24744#30340#20845#20301#23398#21495#25110#24037#21495
    OnChange = Edit1Change
    OnExit = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 335
    Top = 167
    Width = 178
    Height = 21
    TabOrder = 1
    OnKeyDown = Edit2KeyDown
  end
  object Edit3: TEdit
    Left = 335
    Top = 239
    Width = 282
    Height = 21
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 2
    TextHint = #35831#36755#20837'6'#20301#20197#19978#23494#30721#65292#21487#21253#21547#25968#23383#12289#23383#27597#21644#29305#27530#31526#21495
    OnChange = Edit3Change
    OnKeyDown = Edit3KeyDown
  end
  object Edit4: TEdit
    Left = 335
    Top = 312
    Width = 282
    Height = 21
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 3
    TextHint = #35831#20877#27425#36755#20837#23494#30721
    OnChange = Edit4Change
    OnExit = Edit4Exit
    OnKeyDown = Edit4KeyDown
  end
  object Button1: TButton
    Left = 288
    Top = 400
    Width = 75
    Height = 25
    Caption = #27880#20876
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 496
    Top = 400
    Width = 75
    Height = 25
    Caption = #36820#22238#30331#38470
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object RzCB1: TRzCheckBox
    Left = 648
    Top = 241
    Width = 19
    Height = 15
    State = cbUnchecked
    TabOrder = 6
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=980502;Persist Security Info=True;U' +
      'ser ID=lyl;Initial Catalog=bit-pc;Data Source=DESKTOP-PTSQUMO'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 48
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'usr'
    Left = 16
    Top = 104
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    DataSource = DataSource1
    Parameters = <>
    Left = 16
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 16
    Top = 216
  end
end
