unit UInfoSistemas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient,
  Vcl.ComCtrls,
  //Uses REST
  Web.HTTPApp, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.Json,
  //Uses E-mail/XML
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, IdMessage, IdAttachmentFile,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

type
  TForm1 = class(TForm)
    tabCliente: TClientDataSet;
    tabClienteID: TIntegerField;
    tabClienteNOME: TStringField;
    DBNavigator1: TDBNavigator;
    dsCliente: TDataSource;
    pnGrid: TPanel;
    gdCliente: TDBGrid;
    pnCampos: TPanel;
    tabClienteIDENTIDADE: TStringField;
    tabClienteCPF: TStringField;
    tabClienteTELEFONE: TStringField;
    tabClienteEMAIL: TStringField;
    tabClienteCEP: TStringField;
    tabClienteLOGRADOURO: TStringField;
    tabClienteNUMERO: TStringField;
    tabClienteCOMPLEMENTO: TStringField;
    tabClienteBAIRRO: TStringField;
    tabClienteCIDADE: TStringField;
    tabClienteESTADO: TStringField;
    tabClientePAIS: TStringField;
    pgCadastro: TPageControl;
    tabDados: TTabSheet;
    tabEndereco: TTabSheet;
    lblId: TLabel;
    edtId: TDBEdit;
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblRG: TLabel;
    edtRG: TDBEdit;
    lblCPF: TLabel;
    edtCPF: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    lblCEP: TLabel;
    edtCEP: TDBEdit;
    lblLogradouro: TLabel;
    edtLogradouro: TDBEdit;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblEstado: TLabel;
    edtEstado: TDBEdit;
    lblPais: TLabel;
    edtPais: TDBEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    btnBuscar: TButton;
    Panel1: TPanel;
    btnEnviaEmail: TButton;
    Button1: TButton;
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tabClienteBeforePost(DataSet: TDataSet);
    procedure btnEnviaEmailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure tabClienteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    iSequencialId : Integer;
    procedure BuscaCep();
  public
    { Public declarations }
  end;
var
  Form1: TForm1;

const
  _USERNAME = 'joaovictor.brasil1992@gmail.com';
  _PASSWORD = 'jvob2012';
  _FILENAME = 'CADASTRO_';

implementation

{$R *.dfm}

procedure TForm1.BuscaCep();
var
  aRetorno  : TJSONObject;
  aMensagem : String;
begin
  aMensagem := EmptyStr;

  try
    RESTRequest1.Resource := 'ws/{CEP}/json/';
    RESTRequest1.Params.AddUrlSegment('CEP', edtCEP.Text);
    RESTRequest1.Execute;
    aRetorno := RESTRequest1.Response.JSONValue as TJSONObject;
  except on e:Exception do
    begin
      ShowMessage('Erro no WebService tente mais tarde!');
      raise;
    end;
  end;

  case RESTRequest1.Response.StatusCode of
    400 : aMensagem := 'CEP inválido';
    404 : aMensagem := 'URL inválida';
  end;

//Se a resposta da requisicao retornar 1 registro "erro" = true (Erro devolvido quando o CEP é inesistente)
  if (aRetorno.Count = 1) then
    aMensagem := 'CEP inesistente';

  if aMensagem <> EmptyStr then
    ShowMessage(aMensagem)
  else begin
    edtNumero.SetFocus;
    edtLogradouro.Text := aRetorno.Get('logradouro').JsonValue.Value;
    edtBairro.Text     := aRetorno.Get('bairro').JsonValue.Value;
    edtCidade.Text     := aRetorno.Get('localidade').JsonValue.Value;
    edtEstado.Text     := aRetorno.Get('uf').JsonValue.Value;
  end;

  aRetorno := nil;
  aRetorno.Free;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  if not (tabCliente.State in [dsEdit, dsInsert]) then tabCliente.Edit;
  tabCliente.Post;
end;

procedure TForm1.btnEnviaEmailClick(Sender: TObject);
var
//EMAIL
  DATA : TIdMessage;
  SMTP : TIdSMTP;
  SSL  : TIdSSLIOHandlerSocketOpenSSL;

// XML
  FILENAME     : string;
  XMLDocument  : TXMLDocument;
  NodeTabela   : IXMLNode;
  NodeRegistro : IXMLNode;
  NodeEndereco : IXMLNode;
begin
  try
//Criando nome do arquivo
    FILENAME := _FILENAME + tabClienteID.AsString + '.xml';

//Gerando o xml
    XMLDocument := TXMLDocument.Create(Self);
    try
      XMLDocument.Active := True;
      NodeTabela   := XMLDocument.AddChild('Cadastro');
      NodeRegistro := NodeTabela.AddChild('Registro');
      NodeRegistro.ChildValues['Id']       := tabClienteID.AsString;
      NodeRegistro.ChildValues['Nome']     := tabClienteNOME.AsString;
      NodeRegistro.ChildValues['RG']       := tabClienteIDENTIDADE.AsString;
      NodeRegistro.ChildValues['CPF']      := tabClienteCPF.AsString;
      NodeRegistro.ChildValues['Telefone'] := tabClienteTELEFONE.AsString;
      NodeRegistro.ChildValues['Email']    := tabClienteEMAIL.AsString;
//Identando o XML
      NodeEndereco := NodeRegistro.AddChild('Endereco');

      NodeEndereco.ChildValues['CEP']         := tabClienteCEP.AsString;
      NodeEndereco.ChildValues['Logradouro']  := tabClienteLOGRADOURO.AsString;
      NodeEndereco.ChildValues['Numero']      := tabClienteNUMERO.AsString;
      NodeRegistro.ChildValues['Complemento'] := tabClienteCOMPLEMENTO.AsString;
      NodeEndereco.ChildValues['Bairro']      := tabClienteBAIRRO.AsString;
      NodeRegistro.ChildValues['Cidade']      := tabClienteCIDADE.AsString;
      NodeEndereco.ChildValues['UF']          := tabClienteESTADO.AsString;
      NodeEndereco.ChildValues['Pais']        := tabClientePAIS.AsString;

      XMLDocument.SaveToFile(FILENAME);
    finally
      XMLDocument.Free;
    end;

    SMTP := TIdSMTP.Create(nil);
    DATA := TIdMessage.Create(nil);
    SSL  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

    SSL.SSLOptions.Method      := sslvTLSv1;
    SSL.SSLOptions.Mode        := sslmUnassigned;
    SSL.SSLOptions.VerifyMode  := [];
    SSL.SSLOptions.VerifyDepth := 0;

    DATA.From.Address              := _USERNAME;
    DATA.Recipients.EMailAddresses :=  tabClienteEMAIL.AsString;
    DATA.subject                   := 'Cadastro efetuado com sucesso';
    DATA.body.text                 := 'Segue anexo XML com informações de cadastro.';
    TIdAttachmentFile.Create(DATA.MessageParts, FILENAME);

    SMTP.IOHandler := SSL;
    SMTP.Host      := 'smtp.gmail.com';
    SMTP.Port      := 465;
    SMTP.username  := _USERNAME;
    SMTP.password  := _PASSWORD;
    SMTP.UseTLS    := utUseImplicitTLS;
    SMTP.AuthType  := satDefault;

// Conexão e autenticação
    try
      SMTP.Connect;
      SMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro ao autenticar : ' +
          E.Message, mtWarning, [mbOK], 0);
        Abort;
      end;
    end;

// Envio da mensagem
    try
      SMTP.Send(DATA);
      MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
    except
      On E:Exception do
      begin
        MessageDlg('Erro ao enviar o email: ' +
                   E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    SMTP.Free;
    DATA.Free;
    SSL.Free;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabCliente.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  tabCliente.CreateDataSet;
  pgCadastro.ActivePageIndex := 0;
  edtNome.SetFocus;
  iSequencialId := 0;
end;

procedure TForm1.tabClienteBeforePost(DataSet: TDataSet);
begin
  if (tabCliente.State in [dsInsert]) then
  begin
    iSequencialId :=   iSequencialId + 1;
    tabClienteID.AsInteger := iSequencialId;
  end;
end;

procedure TForm1.tabClienteNewRecord(DataSet: TDataSet);
begin
  pgCadastro.ActivePage := tabDados;
end;

procedure TForm1.btnBuscarClick(Sender: TObject);
Begin
  BuscaCep();
end;

end.
