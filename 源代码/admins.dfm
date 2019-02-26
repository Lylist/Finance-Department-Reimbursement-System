object Admin: TAdmin
  Left = 0
  Top = 0
  Caption = #31649#29702
  ClientHeight = 486
  ClientWidth = 863
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
    Left = 16
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
    Left = 328
    Top = 8
    Width = 216
    Height = 29
    Caption = #36130#21153#22788#25253#38144#31649#29702#31995#32479
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    HighlightColor = clBlue
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 56
    Width = 863
    Height = 430
    ActivePage = TabSheet3
    Align = alBottom
    TabHeight = 30
    TabIndex = 2
    TabOrder = 0
    TabStyle = tsRoundCorners
    TabWidth = 200
    OnChange = RzPageControl1Change
    FixedDimension = 30
    object TabSheet1: TRzTabSheet
      Caption = #22788#29702#30003#35831
      object RSGrid1: TRzStringGrid
        Left = 0
        Top = 0
        Width = 859
        Height = 393
        Align = alBottom
        DefaultDrawing = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnClick = RSGrid1Click
        OnDrawCell = RSGrid1DrawCell
        RowHeights = (
          18
          19
          18
          18
          18)
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #24050#23436#25104#30003#35831
      object RzDBGrid1: TRzDBGrid
        Left = 0
        Top = 0
        Width = 859
        Height = 393
        Align = alBottom
        DataSource = DataS2
        DefaultDrawing = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = #30003#35831#22788#29702#26597#35810
      object RzDBGrid2: TRzDBGrid
        Left = 0
        Top = 34
        Width = 859
        Height = 359
        Align = alBottom
        DataSource = DataS3
        DefaultDrawing = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object RzEdit1: TRzEdit
        Left = 368
        Top = 7
        Width = 121
        Height = 21
        TabOrder = 1
        TextHint = #36755#20837#30003#35831#32534#21495
        OnChange = RzEdit1Change
      end
    end
    object TabSheet4: TRzTabSheet
      Caption = #25910#25903#26597#35810
      object RzLabel3: TRzLabel
        Left = 688
        Top = 10
        Width = 60
        Height = 16
        Caption = #25910#25903#24635#35272
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel4: TRzLabel
        Left = 519
        Top = 121
        Width = 48
        Height = 14
        Caption = #31532#19968#23395#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel5: TRzLabel
        Left = 519
        Top = 233
        Width = 48
        Height = 14
        Caption = #31532#19977#23395#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel6: TRzLabel
        Left = 519
        Top = 289
        Width = 48
        Height = 14
        Caption = #31532#22235#23395#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel7: TRzLabel
        Left = 519
        Top = 177
        Width = 48
        Height = 14
        Caption = #31532#20108#23395#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel8: TRzLabel
        Left = 592
        Top = 100
        Width = 24
        Height = 14
        Caption = #25910#20837
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel9: TRzLabel
        Left = 688
        Top = 100
        Width = 24
        Height = 14
        Caption = #25903#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel10: TRzLabel
        Left = 784
        Top = 100
        Width = 24
        Height = 14
        Caption = #30408#20313
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel11: TRzLabel
        Left = 205
        Top = 10
        Width = 60
        Height = 16
        Caption = #25910#25903#32454#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RDBGrid4: TRzDBGrid
        Left = 0
        Top = 32
        Width = 513
        Height = 361
        Color = clBtnFace
        DataSource = DataS4
        DefaultDrawing = True
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object RCBox1: TRzComboBox
        Left = 640
        Top = 56
        Width = 145
        Height = 21
        TabOrder = 1
        OnClick = RCBox1Click
      end
      object RzEdit2: TRzEdit
        Left = 592
        Top = 120
        Width = 57
        Height = 21
        TabOrder = 2
      end
      object RzEdit3: TRzEdit
        Left = 592
        Top = 176
        Width = 57
        Height = 21
        TabOrder = 3
      end
      object RzEdit4: TRzEdit
        Left = 592
        Top = 232
        Width = 57
        Height = 21
        TabOrder = 4
      end
      object RzEdit5: TRzEdit
        Left = 592
        Top = 288
        Width = 57
        Height = 21
        TabOrder = 5
      end
      object RzEdit6: TRzEdit
        Left = 688
        Top = 120
        Width = 57
        Height = 21
        TabOrder = 6
      end
      object RzEdit7: TRzEdit
        Left = 688
        Top = 176
        Width = 57
        Height = 21
        TabOrder = 7
      end
      object RzEdit8: TRzEdit
        Left = 688
        Top = 232
        Width = 57
        Height = 21
        TabOrder = 8
      end
      object RzEdit9: TRzEdit
        Left = 688
        Top = 288
        Width = 57
        Height = 21
        TabOrder = 9
      end
      object RzEdit10: TRzEdit
        Left = 784
        Top = 120
        Width = 57
        Height = 21
        TabOrder = 10
      end
      object RzEdit11: TRzEdit
        Left = 784
        Top = 176
        Width = 57
        Height = 21
        TabOrder = 11
      end
      object RzEdit12: TRzEdit
        Left = 784
        Top = 232
        Width = 57
        Height = 21
        TabOrder = 12
      end
      object RzEdit13: TRzEdit
        Left = 784
        Top = 288
        Width = 57
        Height = 21
        TabOrder = 13
      end
    end
  end
  object RzButton3: TRzButton
    Left = 806
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
    Left = 728
    Top = 16
  end
  object ADOQ1: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 584
    Top = 8
  end
  object DataS1: TDataSource
    DataSet = ADOQ1
    Left = 632
    Top = 8
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOC1
    CursorType = ctStatic
    TableName = 'processed'
    Left = 680
    Top = 8
  end
  object ActionList1: TActionList
    Left = 232
    object ProcessionRefresh: TAction
      Caption = 'ProcessionRefresh'
      OnExecute = ProcessionRefreshExecute
    end
    object ProcessdetailRefresh: TAction
      Caption = 'ProcessdetailRefresh'
      OnExecute = ProcessdetailRefreshExecute
    end
    object revenuedetailRefresh: TAction
      Caption = 'revenuedetailRefresh'
      OnExecute = revenuedetailRefreshExecute
    end
  end
  object DataS2: TDataSource
    DataSet = ADOQ3
    Left = 768
    Top = 16
  end
  object DataS3: TDataSource
    DataSet = ADOQ2
    Left = 96
  end
  object ADOQ2: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 144
  end
  object ADOQ3: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 192
  end
  object ADOQ4: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 392
    Top = 65336
  end
  object DataS4: TDataSource
    DataSet = ADOQ4
    Left = 336
    Top = 65232
  end
end
