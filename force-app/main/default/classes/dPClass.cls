public class dPClass {
  // Upload File Method
  @AuraEnabled
  public static string Upload(String content) {
    Api_Key__c AK = new Api_Key__c();
    AK = [SELECT Name, Api_Value__c FROM Api_Key__c WHERE Name = 'First'];
    // System.debug(AK.Api_Value__c);

    ContentVersion CV = new ContentVersion();
    CV = [
      SELECT Id, VersionData, FileExtension, Title, PathOnClient
      FROM ContentVersion
      WHERE ContentDocumentId = :content LIMIt 1
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
    req.setHeader('Authorization', 'Bearer ' + AK.Api_Value__c);

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
  @AuraEnabled(cacheable=true)
  public static string DeleteFiles(String file) {
    Api_Key__c AK = new Api_Key__c();
    AK = [SELECT Name, Api_Value__c FROM Api_Key__c WHERE Name = 'First'];
    // System.debug(AK.Api_Value__c);

    String body = '{ "path": "/Salesforce/' + file + '" }';

    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://api.dropboxapi.com/2/files/delete_v2');

    req.setHeader('Authorization', 'Bearer ' + AK.Api_Value__c);
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
    Api_Key__c AK = new Api_Key__c();
    AK = [SELECT Name, Api_Value__c FROM Api_Key__c WHERE Name = 'First'];
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

    req.setHeader('Authorization', 'Bearer ' + AK.Api_Value__c);
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
}