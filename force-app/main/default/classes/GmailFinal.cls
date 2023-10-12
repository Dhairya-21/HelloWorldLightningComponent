public class GmailFinal {
  @AuraEnabled
  public static String sendEmail(
    String address,
    String subject,
    String body,
    String cvId
  ) {
    try {
        System.debug(address);
        System.debug(subject);
        System.debug(body);
      if (address != '' && subject != '') {
        String boundary = '__ctrlq_dot_org__';
        ContentVersion cv = new ContentVersion();
        cv = [SELECT Title, VersionData FROM ContentVersion WHERE Id = :cvId];
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        String mimeBody = '';
        mimeBody += 'MIME-Version: 1.0\n';
        mimeBody += 'To:' + address + '\n';
        mimeBody += 'cc: Dhairya.koshti@hotmail.com\n';
        mimeBody += 'Content-Type: text/plain; charset=UTF-8\n';
        mimeBody += 'Subject: ' + subject + ' \n';
        mimeBody += EncodingUtil.base64Encode(cv.VersionData);
        mimeBody +=
          'Content-Type: multipart/mixed; boundary=' +
          boundary +
          '\n';
        mimeBody += '-' + boundary + '\n';
        mimeBody += 'Content-Type: text/html; charset=UTF-8\n';
        mimeBody += 'Content-Transfer-Encoding: base64\n\n';
        mimeBody += EncodingUtil.base64Encode(blob.valueOf(body)) + '\n\n';
        mimeBody += '-' + boundary + '\n';
        mimeBody += 'Content-Type: image/png; ';
        mimeBody += 'name=' + cv.Title;
        mimeBody +=
          'Content-Disposition: attachment; filename="' +
          cv.Title +
          '"\n';
        mimeBody += 'Content-Transfer-Encoding: base64\n';
        mimeBody += EncodingUtil.base64Encode(cv.VersionData) + '\n\n';
        mimeBody += '-' + boundary + '--\n';

        System.debug(cv.Title);
        System.debug(cv.VersionData);
        req.setHeader('Content-Type', 'message/rfc822');
        req.setHeader('Authorization', 'Bearer');
        req.setEndpoint(
          'callout:Gmail_API2/upload/gmail/v1/users/koshtidhairya99@gmail.com/messages/send?uploadType=media'
        );
        req.setMethod('POST');
        req.setBody('{"raw":" ' + mimeBody + '"}');
        HttpResponse res = h.send(req);
        System.debug(res.getBody());
    }
    return 'Success';
    } catch (Exception e) {
      System.debug(e.getCause());
      return 'Fail';
    }
  }
}
