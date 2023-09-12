public with sharing class FileUpdate {
    public void FileUpdate1() {
        List<String> strln = new List<String>();
        strln.add('Hello');
        strln.add('World');
        strln.add('to');
        strln.add('everyone');
        String s = strln.get(2);
        String s1 = strln[0];
        System.debug(s);
        System.debug(s1);

    }
}