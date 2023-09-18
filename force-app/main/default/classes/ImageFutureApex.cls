public class ImageFutureApex {
  static String Id1 = ApexPages.currentPage().getParameters().get('Id');
  public ImageFutureApex(ApexPages.StandardController Opp) {
    Id1 = Opp.getId();
  }
  public void Id12() {
    System.debug(ImageFutureApex.Id1);
  }
  static String images;

  public PageReference test() {
    return null;
  }
  public List<SelectOption> getOption() {
    List<SelectOption> values = new List<SelectOption>();
    List<PicklistValueList__c> PVL = new List<PicklistValueList__c>();
    PVL = PicklistValueList__c.getAll().values();
    for (PicklistValueList__c p : PVL) {
      values.add(
        new SelectOption(String.valueOf(p.value__c), String.valueOf(p.Label__c))
      );
    }
    System.debug(values);
    return values;
  }
  public String getimages() {
    // System.debug(images);
    // System.debug(this.images);
    return images;
  }
  public void setimages(String images1) {
    // System.debug(images);
    images = images1;
  }

  static final String IdFinal = Id1;

  @future(Callout=true)
  public static void ImageApex() {
    String s =
      'https://api.unsplash.com/photos/random/?client_id=-IbUhKAcKLxy10G1HP2daLoXEqV_L3GEvo3WBeLgqFk&query=' +
      ImageFutureApex.images;
    // String s = 'https://api.unsplash.com/photos/random/?client_id=-IbUhKAcKLxy10G1HP2daLoXEqV_L3GEvo3WBeLgqFk&query=city';
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    // String s = 'https://source.unsplash.com/random/?NorthernLights&2';
    request.setEndpoint(s);
    request.setMethod('GET');
    // request.getHeader('-IbUhKAcKL xy10G1HP2daLoXEqV_L3GEvo3WBeLgqFk');
    HttpResponse response = http.send(request);
    // System.debug(response.getBody());
    Map<String, Object> jsonf = new Map<String, Object>();
    jsonf = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // System.debug(jsonf);
    Map<String, Object> o = new Map<String, Object>();
    o = (Map<String, Object>) jsonf.get('urls');
    String link = (String) o.get('regular');
    System.debug(link);
    HttpRequest request2 = new HttpRequest();
    // request2.setEndpoint(
    //   'https://unsplash.com/photos/9zQkRU9IsDk/download?ixid=M3w0OTgzNzd8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTQ1ODY0OTZ8'
    // );
    request2.setEndpoint(link);
    request2.setMethod('GET');
    HttpResponse response1 = http.send(request2);
    Blob bl = response1.getBodyAsBlob();
    // String vd = EncodingUtil.base64Encode(bl);
    ContentVersion CV = new ContentVersion(
      Title = 'Image',
      VersionData = bl,
      PathOnClient = 'Image.jpeg'
    );
    insert CV;
    ContentDocument CD = [
      SELECT Id
      FROM ContentDocument
      WHERE LatestPublishedVersionId = :CV.Id
      WITH SECURITY_ENFORCED
    ];
    ContentDocumentLink CDL = new ContentDocumentLink(
      ContentDocumentId = CD.Id,
      LinkedEntityId = Id1,
      ShareType = 'V'
    );
    // ContentDocumentLink CDL = new ContentDocumentLink(
    //   ContentDocumentId = CD.Id,
    //   LinkedEntityId = '0065j00001NtAHJAA3',
    //   ShareType = 'V'
    // );
    insert CDL;
    // Attachment at = new Attachment(
    //   Name = 'Img',
    //   Body = bl,
    //   ContentType = 'image/jpeg',
    //   ParentId = ImageFutureApex.Id1
    // );
    // insert at;
  }
}
