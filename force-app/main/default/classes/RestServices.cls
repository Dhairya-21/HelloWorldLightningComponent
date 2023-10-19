public class RestServices {

    // GET Service
  public static String Read_Get() {
    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setHeader('', '');

    req.setEndpoint('');

    req.setMethod('');

    HttpResponse res = h.send(req);
    System.debug(res.getBody());

    return res.getBody();
  }

//   POST Service
  public static String Create_Post() {
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

//   DELETE Service
  public static String Delete_Delete() {
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

//   PUT Service
  public static String Upsert_Put() {
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
}
