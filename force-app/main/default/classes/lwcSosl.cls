public class lwcSosl {
  @AuraEnabled(cacheable=true)
  public static List<List<SObject>> try1(String st, List<String> lNum) {
    List<List<SObject>> str = new List<List<SObject>>();
    System.debug(st);
    System.debug(lNum);
    for (String num : lNum) {
      if (num == 'Account') {
        str.addAll([FIND :st IN NAME FIELDS RETURNING Account(Name)]);
      } else if (num == 'Contact') {
        str.addAll([FIND :st IN NAME FIELDS RETURNING Contact(Name)]);
      } else if (num == 'Opportunity') {
        str.addAll([FIND :st IN NAME FIELDS RETURNING Opportunity(Name)]);
      } else if (num == 'Lead') {
        str.addAll([FIND :st IN NAME FIELDS RETURNING Lead(Name)]);
      }
    }
    return str;
  }
}
