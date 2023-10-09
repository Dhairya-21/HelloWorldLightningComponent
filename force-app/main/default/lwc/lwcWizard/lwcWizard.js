import { LightningElement, api, track, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import getAccounts from "@salesforce/apex/lwcClass.getAccounts";
import getAllContacts from "@salesforce/apex/lwcClass.getAllContacts";
import getAllLead from "@salesforce/apex/lwcClass.getAllLead";
import sendEmail from "@salesforce/apex/lwcClass.sendEmail";

export default class LwcWizard extends LightningElement {
  // Storing email and name for recipients
  @track email = [];
  @track name = [];
  @track test = [];

  //   get records
  @wire(getAccounts) wiredAcc;
  @wire(getAllContacts) wiredCon;
  @wire(getAllLead) wiredLeads;
  @wire(sendEmail, {emails: '$test', sub: '$subjectFinal', body: '$bodyFinal'}) wiredEmail;

  // connected callback
  connectedCallback() {
    this.prev = true;
    this.test.push('koshtidhairya99@gmail.com');
  }

  //Page Change
  @api pg = 1;
  @api prev;
  next() {
    if (this.pg === 1 && this.name.length === 0) {
      this.showToast('Please select atleast one entity');
    } else if (this.pg === 2 && (this.body === "" || this.subject === "" || this.name.length === 0)) {
      this.showToast('Subject, Body or Recipients cannot be empty. If you unselected all recipients by mistake go to Stage 1 and select again');
    } else if(this.pg !== 3){
      this.pg++;
      this.prev = false;
    }else if(this.pg === 3){
      this.subjectFinal = this.subject;
      this.bodyFinal = this.body;
      this.showToast(this.wiredEmail.data);
    }
  }
  previous() {
    // this.name = [];
    // this.email = [];
    if (this.pg === 2) {
      this.prev = true;
      this.pg--;
    } else if (this.pg > 1) {
      this.prev = false;
      this.pg--;
    }
  }

  // Picklist for page 1
  @track record;
  @track rec;
  @track val;
  handleOnChange() {
    this.val = event.target.value;
    if (this.val === "Account") {
      this.record = this.wiredAcc.data;
    } else if (this.val === "Contact") {
      this.record = this.wiredCon.data;
    } else if (this.val === "Lead") {
      this.record = this.wiredLeads.data;
    }
    this.rec = JSON.parse(JSON.stringify(this.record));
  }
  showCng() {
    this.id = event.target.value;
    this.nam = event.target.label;
    if (this.email.includes(this.id)) {
      this.email.pop(this.id);
      this.name.pop(this.nam);
    } else {
      this.email.push(this.id);
      this.name.push(this.nam);
    }
  }

  // Assign value of subject and body in page 2. and remove recipients on page 2
  @track subject = "";
  @track subjectFinal = "";
  @track body = "";
  @track bodyFinal = "";
  sub() {
    this.subject = this.template.querySelector("lightning-input").value;
    // console.log(this.subject);
  }
  bod() {
    this.body = this.template.querySelector("lightning-textarea").value;
    // console.log(this.body);
  }
  rm() {
    // this.email.pop(event.target.label);
    this.name.pop(event.target.label);
    console.log(event.target.label);
  }

  // Show pages using if:true
  get st1() {
    if (this.pg === 1) {
      return true;
    } else {
      return false;
    }
  }
  get st2() {
    if (this.pg === 2) {
      return true;
    } else {
      return false;
    }
  }
  get st3() {
    if (this.pg === 3) {
      return true;
    } else {
      return false;
    }
  }

  // Toast message
  showToast(msg) {
    const event = new ShowToastEvent({
        title: 'Error',
        message: msg,
        variant: 'error',
        mode: 'dismissable'
    });
    this.dispatchEvent(event);
}
}
