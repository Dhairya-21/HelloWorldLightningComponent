public class dPClass {
  //   public dPClass() {
  //     token = ApexPages.currentPage().getParameters().get('code');
  //     System.debug(token);
  //     redirect = 'https://mvclouds-3e-dev-ed--c.develop.vf.force.com/apex/DpPage';
  //   }

  @AuraEnabled(cacheable=true)
  public static string Upload(String content) {
    String token = 'sl.Bn0PcT6kML3CMapPMvIKeH7E-8imYlP5tJaX67oEoFRr2NBOUo-vjM38Zh2e36eVBFNCKTdAK8q8VytD1HGZe_VJjh6qBAphKaw3W1Mfzzag26DHFEI1aH8SYZBNkEmS8xus41n-fSROfzixbKkgHdw';
    ContentVersion CV = new ContentVersion();
    CV = [
      SELECT Id, VersionData, FileExtension, Title, PathOnClient
      FROM ContentVersion
      WHERE ContentDocumentId = :content
    ];
    // Blob b = EncodingUtil.base64Decode(EncodingUtil.base64Encode(file));

    String body =
      '{"autorename":false,"mode":"add","mute":false,"path":"/Salesforce/' +
      CV.PathOnClient +
      '", "strict_conflict":false}';
    HttpRequest req = new HttpRequest();
    req.setHeader('Content-Type', 'application/octet-stream');
    req.setMethod('POST');
    req.setEndpoint('https://content.dropboxapi.com/2/files/upload');
    req.setBodyAsBlob(CV.VersionData);
    //   req.setBodyAsBlob(b);
    req.setHeader('Dropbox-API-Arg', body);
    req.setHeader('Authorization', 'Bearer ' + token);
    req.setTimeout(120000);
    Http http = new Http();
    HTTPResponse res = http.send(req);
    system.debug('Response:' + res.getBody());
    if (res.getStatus() != 'OK') {
      return 'error';
    } else {
      return 'success';
    }
  }
  //   }

  @AuraEnabled
  public static String codeauth() {
    String redirect = 'https://mvclouds-3e-dev-ed.develop.lightning.force.com/lightning/n/Drop_Box';
    String ClientId = 'zn918h6ids6ufuf';
    String authoriseUrl =
      'https://www.dropbox.com/oauth2/authorise?client_id=' +
      ClientId +
      '&response_type=code' +
      '&redirect_url=' +
      redirect;
    Pagereference pr = new Pagereference(authoriseUrl);
    pr.setRedirect(true);
    return String.valueOf(pr);
  }

  public String authorise() {
    Http h = new Http();
    String ClientId = 'zn918h6ids6ufuf';
    String ClientSecret = 'dfxf802lpj7cxab';
    String redirect = '';

    String body =
      'code=' +
      token +
      '&grant_type=authorization_code' +
      '&redirect_uri=' +
      redirect +
      '&client_id=' +
      clientId +
      '&client_secret=' +
      clientSecret;

    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://api.dropboxapi.com/oauth/token');
    req.setBody(body);
    req.setMethod('POST');
    HttpResponse res = h.send(req);
    System.debug(res.getBody());
    return res.getBody();
  }
}
