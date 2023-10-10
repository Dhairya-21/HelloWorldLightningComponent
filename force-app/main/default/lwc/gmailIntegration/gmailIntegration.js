import { LightningElement, api, track, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import sendEmail1 from "@salesforce/apex/lwcClass.sendEmail1";

export default class GmailIntegration extends LightningElement {
  @api recordId;
  //   @track cont;
  //   @track error;

  @track subject;
  @track body;
  @track dId;

//   @wire(sendEmail1, {
    // emails: "koshtidhairya99@gmail.com",
    // sub: "$subject",
    // body: "$body",
    // dId: "$dId"
//   })
//   wiredEmail;

  send() {
    this.subject = this.template.querySelector("lightning-input").value;
    this.body = this.template.querySelector("lightning-textarea").value;
    if (this.subject === "" || this.body === "") {
      this.showToast("error", "Subject or Body cannot be empty");
    } else {
      this.showToast("success", "Email sent successfully!");
    }
  }
  attachFile() {
    console.log(event.detail.files[0]);
    this.dId = event.detail.files[0].documentId;
    this.el = document.createElement('p');
    this.el.innerText = event.detail.files[0].name;
    this.template.querySelector('lightning-file-upload').parentElement.appendChild(this.el);
  }

  showToast(title, msg) {
    var event = new ShowToastEvent({
      title: title.charAt(0).toUpperCase() + title.slice(1),
      message: msg,
      variant: title,
      mode: "dissmissable"
    });
    this.dispatchEvent(event);
  }
}
