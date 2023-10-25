public class portalCommunityController {
//   @AuraEnabled
  public static Pagereference redirect() {
    String str = 'https://naturesselectpetcare--c.vf.force.com/resource/1620058130000/MissingImage?';
    Pagereference p = new Pagereference(str);
    p.setRedirect(true);
    System.debug(p);
    return p;
  }
}
