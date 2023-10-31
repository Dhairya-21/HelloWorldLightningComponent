import { LightningElement, api, track } from "lwc";
import profilePhoto from "@salesforce/resourceUrl/profilePhoto";

export default class StudentTab extends LightningElement {
  @api recordId;
  @track img = profilePhoto;
  @track edit = true;

  @track fname1 = "Dhairya";
  @track lname1 = "Koshti";
  @track email1 = "koshtidhairya99@gmail.com";
  @track age1 = "20";
  @track phone1 = "9601331996";
  @track add = "19, Krupa, Laxminaryan Society - 2, Maninagar, Ahmedabad.";

  changeEdit() {
    var i = event.target;
    if (i.label === "Edit") {
      i.label = "OK";
      i.variant = "success";
      this.edit = false;
    } else {
      i.label = "Edit";
      i.variant = "brand";
      this.edit = true;
    }
  }

  fname() {
    this.fname1 = event.target.value;
  }

  lname() {
    this.lname1 = event.target.value;
  }

  email() {
    this.email1 = event.target.value;
  }

  age() {
    this.age1 = event.target.value;
  }

  phone() {
    this.phone1 = event.target.value;
  }

  address() {
    this.add = event.target.value;
  }
}
