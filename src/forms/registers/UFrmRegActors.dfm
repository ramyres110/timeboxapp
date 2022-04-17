object FrmRegActors: TFrmRegActors
  Left = 0
  Top = 0
  Caption = 'Actors'
  ClientHeight = 365
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 471
    Height = 318
    Align = alClient
    DataSource = DmMain.DSActors
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
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nome'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'timebox'
        Title.Caption = 'Tempo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'createdAt'
        Title.Caption = 'Criado em'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'updatedAt'
        Title.Caption = 'Alterado em'
        Width = 70
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 324
    Width = 477
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 136
    ExplicitTop = 104
    ExplicitWidth = 185
    object SpeedButton1: TSpeedButton
      AlignWithMargins = True
      Left = 390
      Top = 4
      Width = 83
      Height = 33
      Align = alRight
      Caption = 'Fechar'
      ExplicitLeft = 360
      ExplicitTop = 3
    end
    object SpeedButton2: TSpeedButton
      AlignWithMargins = True
      Left = 212
      Top = 4
      Width = 83
      Height = 33
      Align = alRight
      Caption = 'Novo'
      ExplicitLeft = 182
      ExplicitTop = 3
    end
    object SpeedButton3: TSpeedButton
      AlignWithMargins = True
      Left = 301
      Top = 4
      Width = 83
      Height = 33
      Align = alRight
      Caption = 'Excluir'
      ExplicitLeft = 271
      ExplicitTop = 3
    end
  end
end
