global class MyWebService {
  webService static Id makeContact(String contactLastName, Account a) {
    Contact c = new Contact(lastName = contactLastName, AccountId = a.Id);
    insert c;
    return c.id;
  }
}