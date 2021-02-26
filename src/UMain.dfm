object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'TimeBox'
  ClientHeight = 541
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 541
    Align = alClient
    BevelOuter = bvNone
    Caption = '00:00:00'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      384
      541)
    object btnPlayPause: TSpeedButton
      Left = 89
      Top = 388
      Width = 80
      Height = 80
      Cursor = crHandPoint
      Anchors = [akBottom]
      Caption = '&Play'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = btnPlayPauseClick
      ExplicitTop = 386
    end
    object btnRestart: TSpeedButton
      Left = 215
      Top = 388
      Width = 80
      Height = 80
      Cursor = crHandPoint
      Anchors = [akBottom]
      Caption = '&Restart'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = btnRestartClick
      ExplicitTop = 386
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 384
      Height = 46
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        AlignWithMargins = True
        Left = 335
        Top = 0
        Width = 46
        Height = 46
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alRight
        Caption = '&Settings'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
        ExplicitLeft = 338
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 16
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Settings1: TMenuItem
        Caption = 'Settings'
        OnClick = Settings1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
  object TimerMain: TTimer
    Enabled = False
    OnTimer = TimerMainTimer
    Left = 24
    Top = 96
  end
end
