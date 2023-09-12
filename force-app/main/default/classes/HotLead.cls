public with sharing class HotLead {
    public void HotLead(List<Lead> ld) {
        for (Lead l : ld) {
            l.Rating = 'Hot';
            update l;
        }
    }
}