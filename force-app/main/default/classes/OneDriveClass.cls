public class OneDriveClass {
  public static String authorise() {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    String clientId = '78be6805-1c31-4f6b-b87f-9f2fac30c80f';
    String redirectUri = 'https://login.salesforce.com';

    req.setEndpoint(
      'https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=' +
        clientId +
        '&scope=openid%20offline_access%20https%3A%2F%2Fgraph.microsoft.com%2Fmail.read&state=12345&response_type=token&redirect_uri=' +
        redirectUri
    );

    req.setMethod('GET');

    HttpResponse res = h.send(req);
    System.debug(res.getBody());

    return 'Success';
  }

  public static String accessToken() {
    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setEndpoint('https://login.microsoftonline.com/common/oauth2/v2.0/token');

    req.setMethod('POST');

    req.setHeader('Content-Type', value)
  }


public static String listFiles() {
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    String accessToken = '';
    String endpointUrl = '/me/drive/root/children';

    req.setHeader('Authorization', 'Bearer ');
    req.setHeader('Content-Type', 'application/octet-stream');
    
    req.setEndpoint('https://graph.microsoft.com/v1.0' + endpointUrl);

    req.setMethod('GET');

    HttpResponse res = h.send(req);
    System.debug(res.getBody());

    return 'Success';
}
}


// https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=78be6805-1c31-4f6b-b87f-9f2fac30c80f&scope=scope=openid%20offline_access%20https%3A%2F%2Fgraph.microsoft.com%2Fmail.read&state=12345&response_type=code&redirect_uri=https://login.salesforce.com
