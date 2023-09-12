trigger LeadT on Lead (before insert) {
    HotLead HotLead = new HotLead();
    HotLead.HotLead(Trigger.new);
}