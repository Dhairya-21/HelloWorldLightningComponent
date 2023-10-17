// public class dropboxClass implements Metadata.DeployCallback {
public class dropboxClass {
  private String apiKey;
  private String apiSecret;
  private String redirectURI;
  private String Dropbox_Account_endpoint;
  private String Dropbox_files_endpoint;
  private String Dropbox_OAuth_authorize;
  private String Dropbox_OAuth_token;
  private String authorizationCode;
  private String refreshToken;

  public String code { get; set; }
  public String username { get; set; }
  public String fileName { get; set; }
  public Blob fileBody { get; set; }
  public Boolean success { get; set; }
  public Boolean connected { get; set; }

  // Constructor Class
  public dropboxClass() {
    connected = false;
    success = false;
    apiKey = Label.DropboxApiKey;
    apiSecret = Label.DropboxSecret;
    redirectURI = 'https://mvclouds-3e-dev-ed--c.develop.vf.force.com/apex/DropboxUpload';
    Dropbox_OAuth_authorize = 'https://www.dropbox.com/oauth2/authorize';
    Dropbox_OAuth_token = 'https://api.dropboxapi.com/oauth2/token';

    code = ApexPages.currentPage().getParameters().get('code');
    if (code != null) {
      connected = true;
      authorizationCode = code;
      getRefreshToken();
    }
  }

  // @AuraEnabled(cacheable=true)
  public PageReference getAuthorizationCode() {
    String uri =
      Dropbox_OAuth_authorize +
      '?client_id=' +
      apiKey +
      '&response_type=code' +
      '&redirect_uri=' +
      redirectURI;
    PageReference pr = new PageReference(uri);
    pr.setRedirect(true);
    return pr;
  }

  // @AuraEnabled(cacheable=true)
  public void getRefreshToken() {
    if (authorizationCode != null) {
      Http h = new Http();
      HttpRequest req = new HttpRequest();

      req.setEndpoint(Dropbox_OAuth_token);
      string bodyRequest = '';
      bodyRequest =
        'code=' + EncodingUtil.urlEncode(authorizationCode, 'UTF-8');
      bodyRequest += '&client_id=' + EncodingUtil.urlEncode(apiKey, 'UTF-8');
      bodyRequest +=
        '&client_secret=' + EncodingUtil.urlEncode(apiSecret, 'UTF-8');
      bodyRequest +=
        '&redirect_uri=' + EncodingUtil.urlEncode(redirectURI, 'UTF-8');
      bodyRequest += '&grant_type=authorization_code';

      req.setBody(bodyRequest);
      req.setHeader('Content-length', string.ValueOf(bodyRequest.length()));
      req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
      req.setMethod('POST');
      req.setTimeout(60 * 1000);

      HttpResponse res = h.send(req);
      System.debug('refresh token response: ' + res.getBody());
      map<string, string> jsonValues = new Map<string, string>();
      jsonValues = parseJSONToMap(res.getBody());
      System.debug(jsonvalues);
      if (jsonValues.containsKey('error')) {
        ApexPages.addmessage(
          new ApexPages.message(
            ApexPages.severity.FATAL,
            'Couldn\'t connect to Dropbox.'
          )
        );
      } else {
        refreshToken = jsonValues.get('access_token');
        System.debug(refreshToken);
        changeMetadata();
      }
    } else {
      System.debug('null');
      ApexPages.addmessage(
        new ApexPages.message(
          ApexPages.severity.FATAL,
          'Couldn\'t connect to Dropbox.'
        )
      );
    }
  }

  private map<string, string> parseJSONToMap(string JSONValue) {
    JSONParser parser = JSON.createParser(JSONValue);
    map<string, string> jsonMap = new Map<string, string>();
    string keyValue = '';
    string tempValue = '';
    while (parser.nextToken() != null) {
      if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        keyValue = parser.getText();
        parser.nextToken();
        tempValue = parser.getText();
        jsonMap.put(keyValue, tempValue);
      }
    }
    return jsonMap;
  }

  public static string ChangeObj() {
    Api_Key__c AK = new Api_Key__c();
    AK = [SELECT Name, Api_Value__c FROM Api_Key__c WHERE Name = 'First'];
    
  }

  // Change Metadata
  // public static void changeMetadata() {
  //   Metadata.CustomMetadata CMD = new Metadata.CustomMetadata();
  //   CMD.fullName = 'ApiKey.First_Value';
  //   CMD.label = 'First_Value';

  //   Metadata.CustomMetadataValue CMV = new Metadata.CustomMetadataValue();
  //   CMV.field = 'Key_Value__c';
  //   CMV.value = 'asdf2349';

  //   CMD.values.add(CMV);

  //   Metadata.DeployContainer MDT = new Metadata.DeployContainer();
  //   MDT.addMetadata(CMD);
  //   dropboxClass DBC = new dropboxClass();
  //   Id jobId = Metadata.Operations.enqueueDeployment(MDT, DBC);
  //   System.debug(jobId);

  //   ApiKey__mdt key = ApiKey__mdt.getInstance('First_Value');
  //   String keyValue = key.Key_Value__c;
  //   System.debug(keyValue);
  // }



  // public void handleResult(
  //   Metadata.DeployResult result,
  //   Metadata.DeployCallbackContext context
  // ) {
  //   if (result.status == Metadata.DeployStatus.SUCCEEDED) {
  //     //success
  //     System.debug(' ===>' + result);
  //   } else {
  //     //not success
  //     System.debug(' ===> fail ' + result);
  //   }
  // }
}
