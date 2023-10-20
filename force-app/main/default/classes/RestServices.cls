public class RestServices {
  // GET Service
  public static String Read_Get() {
    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setHeader('accept', 'application/json');
    req.setHeader('authorization', 'Basic RGhhaXJ5YTpLYW1pc2F0by0xMDE=');
    req.setHeader('Authorization', 'Dhairya-123456789');

    req.setEndpoint('https://demoqa.com/BookStore/v1/Books');

    req.setMethod('GET');

    HttpResponse res = h.send(req);
    // System.debug(res.getBody());

    return res.getBody();
  }

  //   POST Service
  public static String Create_Post() {
    String bearer = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IkRoYWlyeWEiLCJwYXNzd29yZCI6IkthbWlzYXRvQDEwMSIsImlhdCI6MTY5Nzc4NDcwOX0.Jvf4KuYYqojYpDt9ND7DLxoPamkS8sZHfMAQbo6tDr8';
    String userId = '76c547b6-654b-4cf5-8d98-24057836ca68';
    String body =
      '{ "userId": "' +
      userId +
      '" , "collectionOfIsbns": [{ "isbn": "960-425-059-0"}]}';

    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setHeader('accept', 'application/json');
    req.setHeader('content-type', 'application/json');
    req.setHeader('Authorization', 'Bearer ' + bearer);

    req.setEndpoint('https://demoqa.com/BookStore/v1/Books');

    req.setMethod('POST');

    req.setBody(body);

    HttpResponse res = h.send(req);
    System.debug(res.getBody());

    return res.getBody();
  }

  //   DELETE Service
  public static String Delete_Delete() {
    String bearer = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IkRoYWlyeWEiLCJwYXNzd29yZCI6IkthbWlzYXRvQDEwMSIsImlhdCI6MTY5Nzc4NDcwOX0.Jvf4KuYYqojYpDt9ND7DLxoPamkS8sZHfMAQbo6tDr8';
    String userId = '76c547b6-654b-4cf5-8d98-24057836ca68';

    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setHeader('Authorization', 'Bearer' + bearer);
    // req.setHeader('Authorization', 'Dhairya-123456789');
    req.setHeader('Content-Type', 'application/json');
    req.setHeader('accept', 'application/json');

    req.setEndpoint('https://demoqa.com/BookStore/v1/Books?UserId' + userId);

    req.setMethod('DELETE');

    // req.setBody(body);

    HttpResponse res = h.send(req);
    System.debug(res.getBody());

    return res.getBody();
  }

  //   PUT Service
  public static String Upsert_Put() {
    String bearer = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IkRoYWlyeWEiLCJwYXNzd29yZCI6IkthbWlzYXRvQDEwMSIsImlhdCI6MTY5Nzc4NDcwOX0.Jvf4KuYYqojYpDt9ND7DLxoPamkS8sZHfMAQbo6tDr8';
    String userId = '76c547b6-654b-4cf5-8d98-24057836ca68';
    String body = '{"userId": "' + userId + '", "isbn": "80-902734-1-6"}';

    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setHeader('accept', 'application/json');
    req.setHeader('content-type', 'application/json');
    req.setHeader('Authorization', 'Bearer ' + bearer);

    req.setEndpoint('https://demoqa.com/BookStore/v1/Books/960-425-059-0');

    req.setMethod('PUT');

    req.setBody(body);

    HttpResponse res = h.send(req);
    System.debug(res.getBody());

    return res.getBody();
  }

  //   PATCH Service
  public static String Update_Patch() {
    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setHeader('', '');

    req.setEndpoint('');

    req.setMethod('');

    req.setBody('');

    HttpResponse res = h.send(req);
    System.debug(res.getBody());

    return res.getBody();
  }

  // --------------  //
  // Some isbn codes //
  // --------------  //
  // 99921-58-10-7   //
  // 9971-5-0210-0   //
  // 960-425-059-0   //
  // 80-902734-1-6   //
  // --------------  //
}
