public class AWS {
  public string ContentType(string fileType) {
    switch on fileType.toLowerCase() {
      when 'docx' {
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      }
      when 'csv' {
        return 'application/vnd.ms-excel';
      }
      when 'wav' {
        return 'audio/wav';
      }
      when 'wmv' {
        return 'video/x-ms-wmv';
      }
      when 'mp3' {
        return 'audio/mpeg';
      }
      when 'mp4' {
        return 'video/mp4';
      }
      when 'png' {
        return 'image/png';
      }
      when 'pdf' {
        return 'application/pdf';
      }
      when else {
        return 'image/jpeg';
      }
    }
  }

  public boolean UploadDocuments(string recordId) {
    Set<Id> ids = new Set<Id>();
    for (ContentDocumentLink link : [
      SELECT ContentDocumentId, LinkedEntityId
      FROM ContentDocumentLink
      WHERE LinkedEntityId = :recordId
    ]) {
      ids.add(link.ContentDocumentId);
    }
    if (ids.isEmpty()) {
      //   throw new BaseException('Check provided id');
      System.debug('error');
    }

    List<ContentVersion> versions = [
      SELECT VersionData, Title, ContentDocumentId, FileExtension
      FROM ContentVersion
      WHERE ContentDocumentId = :ids AND IsLatest = TRUE
    ];

    //Get Named Credential - get configured s3 url
    NamedCredential named = [
      SELECT DeveloperName, Endpoint
      FROM NamedCredential
      WHERE DeveloperName = 'AWS'
    ];

    for (ContentVersion attach : versions) {
      try {
        //File Content
        String attachmentBody = EncodingUtil.base64Encode(attach.VersionData);
        String formattedDateString = Datetime.now()
          .formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
        string fileUrl =
          'https://s3.amazonaws.com' +
          '/' +
          attach.Title.toLowerCase() +
          '.' +
          attach.FileExtension.toLowerCase();
        string contentType = ContentType(attach.FileExtension);
        system.debug('contentType:' + contentType);

        HttpRequest req = new HttpRequest();
        req.setMethod('PUT');
        req.setEndpoint('callout:AWS');

        Blob pdfBlob = EncodingUtil.base64Decode(attachmentBody);
        req.setBodyAsBlob(pdfBlob);

        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        if (res.getStatusCode() == 200 || res.getStatusCode() == 201) {
          //Store S3 File detail to use at later stage
          //   FileStore__c fileStore = new FileStore__c();
          //   fileStore.S3ServerUrl__c = fileUrl;
          //   fileStore.Name =
          //     attach.title +
          //     '.' +
          //     attach.FileExtension.toLowerCase();
          //   fileStore.RecordId__c = recordId;
          //   fileStore.FileExtension__c = attach.FileExtension.toLowerCase();
          //   insert fileStore;
          //   return true;
        }
      } catch (Exception ex) {
        System.debug(
          'Error in Upload Attachment to AWS S3 Bucket::' + ex.getMessage()
        );
        // throw new BaseException(ex);
      }
    }
    return false;
  }
}
