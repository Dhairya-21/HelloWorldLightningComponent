public with sharing class HotLead {
    public void HotLead(List<Lead> ld) {
        List<Lead> Lead = new List<Lead>();
        for (Lead l : ld) {
            l.Rating = 'Hot';
            Lead.add(l);
        }
        update Lead;
    }
}