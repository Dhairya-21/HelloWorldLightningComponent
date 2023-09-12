public with sharing class CreateEvent {
    public void CreateEvent(List<Contact> contact) {
        Event e = new Event();
        for (Contact con : contact) {
            e.OwnerId = String.valueOf(con.CreatedById);
            e.StartDateTime = datetime.valueOf(con.CreatedDate);
            // e.StartDateTime = datetime.now();
            e.ActivityDateTime = datetime.valueOf(con.CreatedDate);
            // e.ActivityDateTime = datetime.now();
            e.EndDateTime = datetime.valueOf(con.CreatedDate) + 1; 
            // e.EndDateTime = datetime.now() + 1; 
            e.Subject = 'Email';
            e.Description = 'New Event Created on creating a new Contact';
            // System.debug(e);
        }
    }
}