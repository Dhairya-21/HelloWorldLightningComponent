import { LightningElement, api, track, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import getCon from "@salesforce/apex/lwcClass.getCon";
import sendEmail from "@salesforce/apex/GmailFinal.sendEmail";

export default class GmailIntegration extends LightningElement {
  @api recordId;
  @track cont;
  @track contact;
  @track error;

  @track email;
  @track subject;
  @track body;
  @track dId;
  @track type;

  @wire(getCon, { ids: "$recordId" }) wiredCont(data, error) {
    if (data) {
      this.cont = data;
      console.log(data);
    } else if (error) {
      this.error = error;
      console.log(error);
    }
  }

  sub() {
    this.contact = JSON.parse(JSON.stringify(this.cont)).data;
    this.subject = event.target.value;
    this.el = document.createElement('lightning-pill');
    this.el.label = this.contact.Name;
    if (this.template.querySelector('lightning-pill') === undefined) {
      console.log('hello');
    }
    // console.log(this.subject);
  }
  text() {
    this.body = event.target.value;
    // console.log(this.body);
  }
  send() {
    if (this.contact.Email === undefined) {
      this.email = "koshtidhairya99@gmail.com";
    } else {
      this.email = this.contact.Email;
    }
    if (this.subject === "" || this.body === "") {
      this.showToast("error", "Subject or Body cannot be empty");
    } else {
      console.log(this.cont);
      this.showToast("success", "Email sent successfully!");
      console.log(this.subject);
      sendEmail({
        address: this.email,
        subject: this.subject,
        body: this.body,
        cvId: this.dId,
        type: this.type
      })
        .then((result) => {
          this.cont = result;
        })
        .catch((error) => {
          this.error = error;
        });
      console.log(this.body);
    }
  }
  attachFile() {
    console.log(event.detail.files[0]);
    this.dId = event.detail.files[0].contentVersionId;
    this.type = event.detail.files[0].mimeType;
    this.el = document.createElement("p");
    this.el.innerText = event.detail.files[0].name;
    this.template
      .querySelector("lightning-file-upload")
      .parentElement.appendChild(this.el);
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
