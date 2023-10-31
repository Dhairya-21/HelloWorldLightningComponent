import { LightningElement, track, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import getAccounts from "@salesforce/apex/lwcContact.getAccounts";
import getContacts from "@salesforce/apex/lwcContact.getContacts";
import setContacts from "@salesforce/apex/lwcContact.setContacts";

export default class ContactAccount extends LightningElement {
  @track account = [];
  @track contact;

  @track editmode = true;
  @track empty = true;

  handleChange(event) {
    this.value = event.target.value;
  }

  select(event) {
    this.ev = event.target.value;
    getContacts({ accId: this.ev })
      .then((result) => {
        this.contact = result;
      })
      .catch((err) => {
        console.log(err);
      });
  }

  renderedCallback(){
    if (this.account.length === 0) {
      getAccounts().then((result) => {
        this.account= result;
    }).catch((err) => {
      console.log(err);
    });
  }
  }

  // Edit button
  editToggle(event) {
    if (this.editmode === false) {
      this.template.querySelectorAll("lightning-input").forEach((element) => {
        if (element.value === "") {
          this.empty = true;
          return this.empty;
        }
        this.empty = false;
        return this.empty;
      });

      if (this.empty === false) {
        event.target.label = "Edit";
        event.target.variant = "Brand";
        this.editmode = true;

        this.updateconts();
        // set contacts
        setContacts({ cont: this.contact })
          .then((result) => {
            console.log(result);
          })
          .catch((err) => {
            console.log(err);
          });
      } else {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error",
            message: "All Fields are Mandatory",
            variant: "error"
          })
        );
      }
    } else {
      event.target.label = "Okay";
      event.target.variant = "success";
      this.editmode = false;
    }
  }

  // Change the database
  updateconts() {
    var picks = this.template.querySelectorAll("lightning-combobox");
    var elements = this.template.querySelectorAll("lightning-input");
    for (let i = 0; i < this.contact.length; i++) {
      this.contact[i].Salutation = picks[i * 4 + 1].value;
      this.contact[i].FirstName = elements[i * 4].value;
      this.contact[i].LastName = elements[i * 4 + 1].value;
      this.contact[i].Email = elements[i * 4 + 2].value;
      this.contact[i].Phone = elements[i * 4 + 3].value;
    }
  }

  get options(){
    return [
      {label: 'Mr.', value: 'Mr.'},
      {label: 'Ms.', value: 'Ms.'},
      {label: 'Mrs.', value: 'Mrs.'},
      {label: 'Dr.', value: 'Dr.'},
      {label: 'Prof.', value: 'Prof.'},
      {label: 'Mx.', value: 'Mx.'}
  ];
  }
}

