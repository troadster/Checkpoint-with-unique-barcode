object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1041#1072#1079#1086#1081' '#1044#1072#1085#1085#1099#1093
  ClientHeight = 200
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 1
    Top = 0
    Width = 312
    Height = 193
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 0
    object Label1: TLabel
      Left = 143
      Top = 51
      Width = 75
      Height = 13
      Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072
    end
    object Label2: TLabel
      Left = 143
      Top = 78
      Width = 93
      Height = 13
      Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    end
    object Label3: TLabel
      Left = 143
      Top = 105
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object Label4: TLabel
      Left = 143
      Top = 132
      Width = 89
      Height = 13
      Caption = #1048#1084#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
    end
    object Edit1: TEdit
      Left = 16
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 16
      Top = 75
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 16
      Top = 102
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 16
      Top = 129
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 25
      Width = 220
      Height = 17
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093
      TabOrder = 4
    end
    object Button1: TButton
      Left = 16
      Top = 156
      Width = 273
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 256
    Top = 56
  end
  object ADOConnection1: TADOConnection
    Left = 256
    Top = 16
  end
end
