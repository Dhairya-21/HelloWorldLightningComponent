public class dPClass {
  // Upload File Method
  @AuraEnabled
  public static string Upload(String content) {
    // System.debug(AK.Api_Value__c);

    ContentVersion CV = new ContentVersion();
    CV = [
      SELECT Id, VersionData, FileExtension, Title, PathOnClient
      FROM ContentVersion
      WHERE ContentDocumentId = :content
      LIMIT 1
    ];

    String body =
      '{"autorename":false,"mode":"add","mute":false,"path":"/Salesforce/' +
      CV.PathOnClient +
      '", "strict_conflict":false}';

    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://content.dropboxapi.com/2/files/upload');

    req.setHeader('Content-Type', 'application/octet-stream');
    req.setHeader('Dropbox-API-Arg', body);
    req.setHeader('Authorization', 'Bearer ' + Token_Permanent());

    req.setMethod('POST');

    req.setBodyAsBlob(CV.VersionData);

    req.setTimeout(120000);

    HTTPResponse res = http.send(req);
    system.debug('Response:' + res.getBody());

    if (res.getStatus() != 'OK') {
      return 'error';
    } else {
      return 'success';
    }
  }

  // Delete File Method
  @AuraEnabled
  public static string DeleteFiles(String file) {
    // System.debug(AK.Api_Value__c);

    String body = '{ "path": "/Salesforce/' + file + '" }';

    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://api.dropboxapi.com/2/files/delete_v2');

    req.setHeader('Authorization', 'Bearer ' + Token_Permanent());
    req.setHeader('Content-Type', 'application/json');

    req.setMethod('POST');

    req.setBody(body);

    HttpResponse res = h.send(req);
    System.debug('Response: ' + res.getBody());

    if (res.getStatus() != 'OK') {
      return 'error';
    } else {
      return 'success';
    }
  }

  // Lists all files in the folder
  @AuraEnabled
  public static string ListFiles() {
    // System.debug(AK.Api_Value__c);

    String body =
      '{ "include_deleted": false,' +
      '"include_has_explicit_shared_members":false,' +
      '"include_media_info": false,' +
      '"include_non_downloadable_files":true,' +
      '"path": "/Salesforce",' +
      '"recursive": false }';
    System.debug(body);

    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://api.dropboxapi.com/2/files/list_folder');

    req.setHeader('Authorization', 'Bearer ' + Token_Permanent());
    req.setHeader('Content-Type', 'application/json');

    req.setMethod('POST');

    req.setBody(body);

    HttpResponse res = h.send(req);
    System.debug('Response: ' + res.getBody());

    if (res.getStatus() != 'OK') {
      return 'error';
    } else {
      return res.getBody();
    }
  }

  public static String Token_Permanent() {
    String refresh = 'HCr6QL_LIBEAAAAAAAAAAZ0W85EXYkt5wKnqnqHTDGvVZVrQjFlW_-rOLPBcHFwh';
    String body =
      'grant_type=refresh_token' +
      '&refresh_token=' +
      EncodingUtil.urlEncode(refresh, 'UTF-8') +
      '&client_id=' +
      EncodingUtil.urlEncode(Label.DropboxApiKey, 'UTF-8') +
      '&client_secret=' +
      EncodingUtil.urlEncode(Label.DropboxSecret, 'UTF-8');

    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setEndpoint('https://api.dropbox.com/oauth2/token');

    req.setHeader('Content-length', String.valueOf(body.length()));
    req.setHeader('Content-Type', 'application/x-www-form-urlencoded');

    req.setMethod('POST');

    req.setBody(body);
    HttpResponse res = h.send(req);
    // System.debug(res.getBody());
    
    Map<String,String> jsonvalues = new Map<String,String>();
    jsonvalues = parseJSONToMap(res.getBody());
    // System.debug(jsonvalues.get('access_token'));

    return jsonvalues.get('access_token');
  }

  //  parser to json
  public static map<string, string> parseJSONToMap(string JSONValue) {
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
}
