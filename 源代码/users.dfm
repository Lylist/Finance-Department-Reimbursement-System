object User: TUser
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'User'
  ClientHeight = 496
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 24
    Top = 8
    Width = 63
    Height = 19
    Caption = 'RzLabel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    LightTextStyle = True
  end
  object RzLabel2: TRzLabel
    Left = 336
    Top = 8
    Width = 168
    Height = 29
    Caption = #36130#21153#22788#25253#38144#31995#32479
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    HighlightColor = clBlue
  end
  object PC1: TRzPageControl
    Left = 0
    Top = 56
    Width = 873
    Height = 440
    ActivePage = TabSheet3
    Align = alBottom
    TabHeight = 30
    TabIndex = 2
    TabOrder = 0
    TabStyle = tsRoundCorners
    TabWidth = 200
    OnChange = PC1Change
    FixedDimension = 30
    object TabSheet1: TRzTabSheet
      Caption = #27491#22312#30003#35831
      ExplicitTop = 20
      ExplicitHeight = 409
      object RzDBGrid1: TRzDBGrid
        Left = 0
        Top = 0
        Width = 869
        Height = 403
        Align = alClient
        DataSource = DataS1
        DefaultDrawing = True
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = #30003#35831#32534#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'userid'
            Title.Caption = #30003#35831#20154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'invoice'
            Title.Caption = #21457#31080#32852#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'price'
            Title.Caption = #25253#38144#20215#26684
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'createtime'
            Title.Caption = #30003#35831#26102#38388
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'statu'
            Title.Caption = #30003#35831#29366#24577
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'remark'
            Title.Caption = #22791#27880
            Visible = True
          end>
      end
      object RzButton2: TRzButton
        Left = 784
        Top = -80
        Caption = 'RzButton2'
        TabOrder = 1
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #24050#22788#29702#23436
      ExplicitTop = 20
      ExplicitHeight = 409
      object RzDBGrid2: TRzDBGrid
        Left = 0
        Top = 0
        Width = 869
        Height = 403
        Align = alClient
        DataSource = DataS2
        DefaultDrawing = True
        FixedColor = clInactiveCaptionText
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        FrameColor = 12164479
        FrameVisible = True
        FixedLineColor = 12164479
        LineColor = clInactiveCaption
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = #28155#21152#30003#35831
      ParentShowHint = False
      ShowHint = False
      ExplicitTop = 20
      ExplicitHeight = 409
      object RzLabel3: TRzLabel
        Left = 256
        Top = 96
        Width = 75
        Height = 18
        Caption = #21457#31080#32852#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel4: TRzLabel
        Left = 256
        Top = 152
        Width = 75
        Height = 18
        Caption = #25253#38144#20215#26684#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel5: TRzLabel
        Left = 256
        Top = 216
        Width = 75
        Height = 18
        Caption = #35828#26126#22791#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzEdit1: TRzEdit
        Left = 376
        Top = 97
        Width = 223
        Height = 21
        TabOrder = 0
        TextHint = #36755#20837#20843#20301#21457#31080#32852#21495
        OnChange = RzEdit1Change
        OnKeyDown = RzEdit1KeyDown
        OnKeyPress = RzEdit1KeyPress
      end
      object RzEdit2: TRzEdit
        Left = 376
        Top = 153
        Width = 57
        Height = 21
        Hint = #25968#23383
        TabOrder = 1
        TextHint = #25968#23383
        OnKeyDown = RzEdit2KeyDown
        OnKeyPress = RzEdit2KeyPress
      end
      object RzEdit3: TRzEdit
        Left = 376
        Top = 217
        Width = 223
        Height = 21
        TabOrder = 2
        TextHint = #30003#35831#29702#30001
        OnKeyDown = RzEdit3KeyDown
      end
      object RzButton1: TRzButton
        Left = 335
        Top = 304
        Caption = #25552#20986#30003#35831#65306
        TabOrder = 3
        OnClick = RzButton1Click
      end
      object RzCB1: TRzCheckBox
        Left = 616
        Top = 99
        Width = 19
        Height = 15
        State = cbUnchecked
        TabOrder = 4
        OnClick = RzCB1Click
      end
    end
  end
  object RzButton3: TRzButton
    Left = 816
    Top = 8
    Width = 49
    Height = 29
    Caption = #36864#20986
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 1
    OnClick = RzButton3Click
  end
  object ADOC1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=980502;Persist Security Info=True;U' +
      'ser ID=lyl;Initial Catalog=bit-pc;Data Source=DESKTOP-PTSQUMO'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 544
    Top = 8
  end
  object ADOQ1: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 592
    Top = 8
  end
  object DataS1: TDataSource
    DataSet = ADOQ1
    Left = 640
    Top = 8
  end
  object ADOQ2: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 720
    Top = 65272
  end
  object DataS2: TDataSource
    DataSet = ADOQ2
    Left = 712
    Top = 65272
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOC1
    CursorType = ctStatic
    TableName = 'processed'
    Left = 688
    Top = 8
  end
end
