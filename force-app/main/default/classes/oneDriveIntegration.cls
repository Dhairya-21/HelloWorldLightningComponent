public class oneDriveIntegration {
  @future(Callout=true)
  public static void intOneDrive() {
    Http http = new Http();
    //        String url = 'https://api.onedrive.com/v1.0';
    HttpRequest request = new HttpRequest();
    
    // request.setEndpoint('https://api.onedrive.com/v1.0');
    request.setEndpoint('https://graph.microsoft.com/v1.0');
    
    // request.setMethod('GET');
    request.setMethod('POST');
    // request.setMethod('DELETE');
    
    // request.setHeader('Authorization', 'hBearer ');
    request.setHeader('Content-Type', 'application/json; charset=utf-8');
    
    request.setBody('{"name": "Dhairya"}');
    // request.setContent(content);
    
    HttpResponse response = http.send(request);
    System.debug(response.getBody());
  }
}
