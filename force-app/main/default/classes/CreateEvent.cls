public with sharing class CreateEvent {
    public void CreateEvent(List<Contact> contact) {
        list<event> ev = new list<event>();
        for (Contact con : contact) {
            Event e = new Event();
            e.OwnerId = String.valueOf(con.CreatedById);
            // e.StartDateTime = datetime.valueOf(con.CreatedDate);
            e.StartDateTime = datetime.now().addHours(1);
            // e.ActivityDateTime = datetime.valueOf(con.CreatedDate);
            e.ActivityDateTime = datetime.now().addHours(1);
            // e.EndDateTime = datetime.valueOf(con.CreatedDate) + 1; 
            e.EndDateTime = datetime.now().addHours(3); 
            e.Subject = 'Email';
            e.Description = 'New Event Created on creating a new Contact';
            // System.debug(e);
            ev.add(e);
        }
        insert ev;
    }
}