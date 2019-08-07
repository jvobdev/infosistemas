object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de cliente'
  ClientHeight = 526
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 867
    Height = 25
    DataSource = dsCliente
    Align = alTop
    TabOrder = 0
  end
  object pnGrid: TPanel
    Left = 0
    Top = 272
    Width = 867
    Height = 254
    Align = alBottom
    TabOrder = 1
    object gdCliente: TDBGrid
      Left = 1
      Top = 1
      Width = 865
      Height = 252
      Align = alClient
      DataSource = dsCliente
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'Id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 291
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDENTIDADE'
          Title.Caption = 'RG'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Caption = 'Telefone'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'E-mail'
          Width = 261
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGRADOURO'
          Title.Caption = 'Logradouro'
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO'
          Title.Caption = 'N'#250'mero'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPLEMENTO'
          Title.Caption = 'Complemento'
          Width = 190
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BAIRRO'
          Title.Caption = 'Bairro'
          Width = 321
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Title.Caption = 'Cidade'
          Width = 261
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAIS'
          Title.Caption = 'Pa'#237's'
          Width = 161
          Visible = True
        end>
    end
  end
  object pnCampos: TPanel
    Left = 0
    Top = 25
    Width = 867
    Height = 247
    Align = alClient
    TabOrder = 2
    object pgCadastro: TPageControl
      Left = 1
      Top = 1
      Width = 865
      Height = 245
      ActivePage = tabEndereco
      Align = alClient
      TabOrder = 0
      object tabDados: TTabSheet
        Caption = 'Dados pessoais'
        object lblId: TLabel
          Left = 8
          Top = 8
          Width = 10
          Height = 13
          Caption = 'Id'
          FocusControl = edtId
        end
        object lblNome: TLabel
          Left = 8
          Top = 48
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = edtNome
        end
        object lblRG: TLabel
          Left = 8
          Top = 88
          Width = 14
          Height = 13
          Caption = 'RG'
          FocusControl = edtRG
        end
        object lblCPF: TLabel
          Left = 176
          Top = 88
          Width = 19
          Height = 13
          Caption = 'CPF'
          FocusControl = edtCPF
        end
        object lblTelefone: TLabel
          Left = 344
          Top = 88
          Width = 42
          Height = 13
          Caption = 'Telefone'
          FocusControl = edtTelefone
        end
        object lblEmail: TLabel
          Left = 8
          Top = 126
          Width = 28
          Height = 13
          Caption = 'E-mail'
          FocusControl = edtEmail
        end
        object edtId: TDBEdit
          Left = 8
          Top = 24
          Width = 89
          Height = 21
          DataField = 'ID'
          DataSource = dsCliente
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 8
          Top = 64
          Width = 483
          Height = 21
          DataField = 'NOME'
          DataSource = dsCliente
          TabOrder = 1
        end
        object edtRG: TDBEdit
          Left = 8
          Top = 104
          Width = 147
          Height = 21
          DataField = 'IDENTIDADE'
          DataSource = dsCliente
          TabOrder = 2
        end
        object edtCPF: TDBEdit
          Left = 176
          Top = 104
          Width = 147
          Height = 21
          DataField = 'CPF'
          DataSource = dsCliente
          TabOrder = 3
        end
        object edtTelefone: TDBEdit
          Left = 344
          Top = 104
          Width = 147
          Height = 21
          DataField = 'TELEFONE'
          DataSource = dsCliente
          TabOrder = 4
        end
        object edtEmail: TDBEdit
          Left = 8
          Top = 142
          Width = 483
          Height = 21
          DataField = 'EMAIL'
          DataSource = dsCliente
          TabOrder = 5
        end
      end
      object tabEndereco: TTabSheet
        Caption = 'Endere'#231'o'
        ImageIndex = 1
        object lblCEP: TLabel
          Left = 3
          Top = 8
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = edtCEP
        end
        object lblLogradouro: TLabel
          Left = 3
          Top = 48
          Width = 55
          Height = 13
          Caption = 'Logradouro'
          FocusControl = edtLogradouro
        end
        object lblNumero: TLabel
          Left = 3
          Top = 88
          Width = 12
          Height = 13
          Caption = 'N'#186
          FocusControl = edtNumero
        end
        object lblComplemento: TLabel
          Left = 147
          Top = 88
          Width = 65
          Height = 13
          Caption = 'Complemento'
          FocusControl = edtComplemento
        end
        object lblBairro: TLabel
          Left = 3
          Top = 131
          Width = 28
          Height = 13
          Caption = 'Bairro'
          FocusControl = edtBairro
        end
        object lblCidade: TLabel
          Left = 3
          Top = 170
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = edtCidade
        end
        object lblEstado: TLabel
          Left = 250
          Top = 173
          Width = 13
          Height = 13
          Caption = 'UF'
          FocusControl = edtEstado
        end
        object lblPais: TLabel
          Left = 279
          Top = 173
          Width = 19
          Height = 13
          Caption = 'Pa'#237's'
          FocusControl = edtPais
        end
        object edtCEP: TDBEdit
          Left = 3
          Top = 24
          Width = 108
          Height = 21
          DataField = 'CEP'
          DataSource = dsCliente
          TabOrder = 0
        end
        object edtLogradouro: TDBEdit
          Left = 3
          Top = 64
          Width = 483
          Height = 21
          DataField = 'LOGRADOURO'
          DataSource = dsCliente
          Enabled = False
          TabOrder = 1
        end
        object edtNumero: TDBEdit
          Left = 3
          Top = 104
          Width = 134
          Height = 21
          DataField = 'NUMERO'
          DataSource = dsCliente
          TabOrder = 2
        end
        object edtComplemento: TDBEdit
          Left = 147
          Top = 104
          Width = 339
          Height = 21
          DataField = 'COMPLEMENTO'
          DataSource = dsCliente
          TabOrder = 3
        end
        object edtBairro: TDBEdit
          Left = 3
          Top = 147
          Width = 483
          Height = 21
          DataField = 'BAIRRO'
          DataSource = dsCliente
          Enabled = False
          TabOrder = 4
        end
        object edtCidade: TDBEdit
          Left = 3
          Top = 189
          Width = 241
          Height = 21
          DataField = 'CIDADE'
          DataSource = dsCliente
          Enabled = False
          TabOrder = 5
        end
        object edtEstado: TDBEdit
          Left = 250
          Top = 189
          Width = 23
          Height = 21
          DataField = 'ESTADO'
          DataSource = dsCliente
          Enabled = False
          TabOrder = 6
        end
        object edtPais: TDBEdit
          Left = 279
          Top = 189
          Width = 207
          Height = 21
          DataField = 'PAIS'
          DataSource = dsCliente
          TabOrder = 7
        end
        object btnBuscar: TButton
          Left = 117
          Top = 22
          Width = 75
          Height = 25
          Caption = 'Buscar'
          TabOrder = 8
          OnClick = btnBuscarClick
        end
        object Panel1: TPanel
          Left = 720
          Top = 168
          Width = 137
          Height = 49
          BorderStyle = bsSingle
          TabOrder = 9
          object btnEnviaEmail: TButton
            Left = 8
            Top = 10
            Width = 115
            Height = 25
            Caption = 'Enviar E-mail'
            TabOrder = 0
            OnClick = btnEnviaEmailClick
          end
        end
        object Button1: TButton
          Left = 592
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 10
          OnClick = Button1Click
        end
      end
    end
  end
  object tabCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = tabClienteBeforePost
    OnNewRecord = tabClienteNewRecord
    Left = 808
    Top = 448
    object tabClienteID: TIntegerField
      FieldName = 'ID'
    end
    object tabClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object tabClienteIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      EditMask = '00.000.000;'
      Size = 11
    end
    object tabClienteCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object tabClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 11
    end
    object tabClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object tabClienteCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-999;0;_'
      Size = 8
    end
    object tabClienteLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 100
    end
    object tabClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object tabClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object tabClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object tabClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object tabClienteESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 60
    end
    object tabClientePAIS: TStringField
      FieldName = 'PAIS'
      Size = 60
    end
  end
  object dsCliente: TDataSource
    DataSet = tabCliente
    Left = 808
    Top = 392
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br/'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 608
    Top = 456
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Resource = 'ws/30525490/json/ '
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 608
    Top = 336
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 608
    Top = 392
  end
end
