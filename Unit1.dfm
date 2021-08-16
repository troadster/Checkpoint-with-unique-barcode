object CPP: TCPP
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1086'-'#1055#1088#1086#1087#1091#1089#1082#1085#1086#1081' '#1055#1091#1085#1082#1090
  ClientHeight = 275
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object barcode: TImage
    Left = 247
    Top = 3
    Width = 10
    Height = 135
    PopupMenu = PopupMenu1
  end
  object Label1: TLabel
    Left = 16
    Top = 172
    Width = 44
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object Label2: TLabel
    Left = 160
    Top = 172
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
  end
  object Label3: TLabel
    Left = 304
    Top = 172
    Width = 49
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object Label4: TLabel
    Left = 464
    Top = 172
    Width = 36
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object Label5: TLabel
    Left = 148
    Top = 223
    Width = 140
    Height = 13
    Caption = '- '#1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
  end
  object barcode_in: TEdit
    Left = 0
    Top = 3
    Width = 241
    Height = 21
    TabOrder = 0
  end
  object barcode_in_button: TButton
    Left = 0
    Top = 28
    Width = 241
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1096#1090#1088#1080#1093'-'#1082#1086#1076
    TabOrder = 1
    OnClick = barcode_in_buttonClick
  end
  object barcode_out_button: TButton
    Left = 0
    Top = 85
    Width = 241
    Height = 25
    Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1096#1090#1088#1080#1093'-'#1082#1086#1076
    TabOrder = 2
    OnClick = barcode_out_buttonClick
  end
  object barcode_out: TEdit
    Left = 0
    Top = 59
    Width = 241
    Height = 21
    TabOrder = 3
  end
  object barcode_decode_button: TButton
    Left = 0
    Top = 113
    Width = 241
    Height = 25
    Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 4
    OnClick = barcode_decode_buttonClick
  end
  object SName: TEdit
    Left = 8
    Top = 191
    Width = 121
    Height = 21
    TabOrder = 5
    Text = #1060#1072#1084#1080#1083#1080#1103
  end
  object FName: TEdit
    Left = 160
    Top = 191
    Width = 121
    Height = 21
    TabOrder = 6
    Text = #1048#1084#1103
  end
  object MName: TEdit
    Left = 304
    Top = 191
    Width = 121
    Height = 21
    TabOrder = 7
    Text = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object Group: TEdit
    Left = 464
    Top = 191
    Width = 121
    Height = 21
    TabOrder = 8
    Text = #1048#1057'1-15'
  end
  object Button4: TButton
    Left = 16
    Top = 242
    Width = 265
    Height = 23
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 9
    OnClick = Button4Click
  end
  object Edit11: TEdit
    Left = 304
    Top = 243
    Width = 281
    Height = 21
    TabOrder = 10
  end
  object Button1: TButton
    Left = 0
    Top = 144
    Width = 609
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1072
    TabOrder = 11
    OnClick = Button1Click
  end
  object DateTime: TDateTimePicker
    Left = 16
    Top = 218
    Width = 121
    Height = 21
    Date = 43074.999988425930000000
    Time = 43074.999988425930000000
    TabOrder = 12
  end
  object Button2: TButton
    Left = 496
    Top = 218
    Width = 89
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1041#1044
    TabOrder = 13
    OnClick = Button2Click
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 88
    object N1: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = N2Click
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = '*.bmp'
    Left = 400
    Top = 80
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = '.bmp'
    Left = 464
    Top = 72
  end
  object MainMenu1: TMainMenu
    Left = 336
    Top = 24
    object N3: TMenuItem
      Caption = #1060#1072#1081#1083
      object N4: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1096#1090#1088#1080#1093'-'#1082#1086#1076
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1096#1090#1088#1080#1093'-'#1082#1086#1076
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = N6Click
      end
    end
    object N7: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object N8: TMenuItem
        Caption = #1041#1072#1079#1072' '#1044#1072#1085#1085#1099#1093
        OnClick = N8Click
      end
    end
  end
end
