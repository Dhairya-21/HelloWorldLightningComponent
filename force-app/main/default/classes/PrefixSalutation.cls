public with sharing class PrefixSalutation {
    public void PrefixSalutation(List<Contact> contact) {
        for (Contact con : contact) {
            con.Salutation = 'Mrs.';
            update con;
        }
    }
}