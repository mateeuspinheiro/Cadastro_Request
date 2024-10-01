unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, untConsultaWSImpl;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    memoResponse: TMemo;
    btnConsultaCNPJ: TButton;
    edtCNPJ: TEdit;
    procedure btnConsultaCNPJClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  _URL_CONSULTA_CNPJ = 'https://receitaws.com.br/v1/cnpj/%s';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConsultaCNPJClick(Sender: TObject);
var
  vCNPJ, vResponse: String;
begin

  if edtCNPJ.Text = '' then
  begin
    ShowMessage('Campo CNPJ em branco!');
    Exit;
  end
  else
  begin
    vCNPJ := edtCNPJ.Text;
    ConsultaCNPJ(vCNPJ, vResponse);
    memoResponse.Lines.Clear;
    memoResponse.Lines.Add(vResponse);
  end;

end;

end.
