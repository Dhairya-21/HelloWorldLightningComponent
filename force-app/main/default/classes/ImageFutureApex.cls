public with sharing class ImageFutureApex {
    static String Id1;
    public ImageFutureApex(ApexPages.StandardController Opp){
        Id1 = Opp.getId(); 
    }
    @future(Callout = true)
    public static void ImageApex() {
        System.debug(ImageFutureApex.Id1);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://unsplash.com/collections/466697/minimal');
        request.setMethod('GET');
        // System.debug(str);
        String s = 'Random Img';
        Blob bl = Blob.valueOf(s);

        HttpResponse response = http.send(request);
        Attachment at = new Attachment(Name = 'Img', Body = bl, ContentType = 'image/jpeg', ParentId = ImageFutureApex.Id1);
        insert at;
    }
    // access key = '-IbUhKAcKL xy10G1HP2daLoXEqV_L3GEvo3WBeLgqFk';
    // secret key = 'ej34X2__pak7IAUTHY_KacJiDlddYRQw44awROiydJU';
}