unit untConsultaWSImpl;

interface

uses
  System.SysUtils, REST.Types, REST.Client;

procedure ConsultaCNPJ(const vCNPJ: string; var vResponse: string);

implementation

procedure ConsultaCNPJ(const vCNPJ: string; var vResponse: string);
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
begin
  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);
  try
    RESTClient.BaseURL := Format('https://receitaws.com.br/v1/cnpj/%s', [vCNPJ]);
    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    RESTRequest.Method := rmGET;
    RESTRequest.Execute;
    vResponse := RESTResponse.Content;
  finally
    RESTClient.Free;
    RESTRequest.Free;
    RESTResponse.Free;
  end;
end;

end.
