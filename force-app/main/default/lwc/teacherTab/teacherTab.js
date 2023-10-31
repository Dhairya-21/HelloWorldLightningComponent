import { LightningElement, api, track, wire } from "lwc";
import profilePhoto from "@salesforce/resourceUrl/profilePhoto";
import Recordsget from "@salesforce/apex/portalCommunityController.Recordsget";
import updateStudent from "@salesforce/apex/portalCommunityController.updateStudent";

export default class TeacherTab extends LightningElement {
  @api options = ['Mr.', 'Mrs.'];

  @track img = profilePhoto;
  @track edit = true;
  @track feed = false;

  @track fname1 = "Rajesh";
  @track lname1 = "Panchal";
  @track email1 = "RPanchal6490@xyz.ac.in";
  @track age1 = "44";
  @track phone1 = "8412440344";
  @track add = "106, Ramdev Flats, Ghodasar, Ahmedabad.";

  @wire(Recordsget) wiredRecords;
  @track recordsList;
  @track record = {};

  @track recordFeedback = '';

  send() {
    // console.log(this.wiredRecords.data);
    this.recordsList = this.wiredRecords.data;
  }

  setName(event) {
    this.feed = true;
    this.name = event.target.dataset.id;
    this.template.querySelector("lightning-tabset").activeTabValue = "three";
    console.log(this.name);
    this.recordsList.forEach((element) => {
      
      if (this.name === element.Id) {
        this.record = element;
      }
    });
  }

  renderedCallback() {
    if (this.feed === true) {
      this.template.querySelector("lightning-tabset").activeTabValue = "three";
    }
  }

  changeEdit(event) {
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

  fname(event) {
    this.fname1 = event.target.value;
  }

  lname(event) {
    this.lname1 = event.target.value;
  }

  email(event) {
    this.email1 = event.target.value;
  }

  age(event) {
    this.age1 = event.target.value;
  }

  phone(event) {
    this.phone1 = event.target.value;
  }

  address(event) {
    this.add = event.target.value;
  }

  feedback(event){
    console.log(event.target.value);
    this.recordFeedback = event.target.value;
    console.log(this.recordFeedback);
  }
  
  setFeedback(){
    this.record.Feedback__c = this.recordFeedback;
     console.log(this.record);
     updateStudent({ac: this.record}).then((result) => {
       console.log(result);
      }).catch((err) => {
        console.log(err);
      });
    } 
}
