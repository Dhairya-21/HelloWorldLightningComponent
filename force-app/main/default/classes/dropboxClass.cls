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
    apiKey = 'zn918h6ids6ufuf';
    apiSecret = 'dfxf802lpj7cxab';
    redirectURI = 'https://mvclouds-3e-dev-ed--c.develop.vf.force.com/apex/DropboxUpload';
    Dropbox_Account_endpoint = 'https://api.dropboxapi.com/2/check/user';
    Dropbox_files_endpoint = 'https://content.dropboxapi.com/2/files/upload/';
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

  @AuraEnabled(cacheable=true)
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

  // method that uploads files to dropbox
  public Boolean uploadToDropBox(Blob file, String filename) {
    try {
      String boundary = '----------9889464542212';
      String bodyEncoded = EncodingUtil.base64Encode(file);
      Blob bodyEncoded2 = EncodingUtil.base64Decode(bodyEncoded);

      Http http = new Http();
      HttpRequest req = new HttpRequest();
      //   String endpoint = Dropbox_files_endpoint + filename + '/?overwrite=false';
      req.setEndpoint(Dropbox_files_endpoint);
      req.setHeader('Authorization', 'Bearer ' + refreshToken);
      req.setHeader(
        'Dropbox-API-Arg',
        '{"autorename": false, "mode": add, "mute":false, "path":"/app/' +
          filename +
          '", "strict_conflict":false}"'
      );
      // req.setHeader('Authorization', 'Bearer');
      req.setHeader('Content-Type', 'application/octet-stream; ');
      // boundary="' + boundary + '"'
      //   req.setHeader('Content-length', String.valueOf(bodyEncoded.length()));
      req.setBodyAsBlob(bodyEncoded2);
      req.setMethod('PUT');
      req.setTimeout(60 * 1000);
      HttpResponse resp = http.send(req);
      System.debug(resp.getBody());
      map<string, string> jsonValues = new Map<string, string>();
      jsonValues = parseJSONToMap(resp.getBody());
      if (jsonValues.containsKey('error')) {
        ApexPages.Message myMsg = new ApexPages.Message(
          ApexPages.Severity.ERROR,
          'Error:' + jsonValues.get('error')
        );
        ApexPages.addMessage(myMsg);
        return false;
      } else
        return true;
    } catch (Exception e) {
      ApexPages.addmessage(
        new ApexPages.message(
          ApexPages.severity.FATAL,
          'Files couldn\'t be uploaded to Dropbox.'
        )
      );
      return false;
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

  public void uploadFiles() {
    success = uploadToDropBox(fileBody, fileName);
  }
}
