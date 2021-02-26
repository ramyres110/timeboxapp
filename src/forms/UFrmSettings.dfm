object FrmSettings: TFrmSettings
  Left = 0
  Top = 0
  Caption = 'FrmSettings'
  ClientHeight = 483
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlInfo: TPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 433
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -3
    object Label1: TLabel
      Left = 39
      Top = 47
      Width = 98
      Height = 16
      Caption = 'Default Timebox:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DtTmPickDefaultTime: TDateTimePicker
      Left = 143
      Top = 44
      Width = 186
      Height = 24
      BevelInner = bvNone
      BevelOuter = bvNone
      Date = 44253.000000000000000000
      Time = 44253.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkTime
      ParentFont = False
      TabOrder = 0
    end
    object RgCountTime: TRadioGroup
      Left = 39
      Top = 96
      Width = 290
      Height = 89
      Caption = 'Count Time'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Count down'
        'Count up')
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 433
    Width = 364
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      AlignWithMargins = True
      Left = 271
      Top = 3
      Width = 90
      Height = 44
      Align = alRight
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
      ExplicitLeft = 314
      ExplicitTop = 0
      ExplicitHeight = 50
    end
  end
end
