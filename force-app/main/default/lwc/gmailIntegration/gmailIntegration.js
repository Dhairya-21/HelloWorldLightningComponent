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

  @track file;

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
    this.subject = event.target.value;
    // console.log(this.subject);
  }
  text() {
    this.body = event.target.value;
    // console.log(this.body);
  }
  send() {
    this.contact = JSON.parse(JSON.stringify(this.cont)).data;
    if (this.contact.Email === undefined) {
      this.email = 'koshtidhairya99@gmail.com'
      // console.log('No email');
      this.body += ' (No Email. So Self)'
    }else{
      this.email=this.contact.Email;
    }
      // this.subject = this.template.querySelector("lightning-input").value;
      // this.body = this.template.querySelector("lightning-textarea").value;
      if (this.subject === "" || this.body === "") {
        this.showToast("error", "Subject or Body cannot be empty");
      } else {
        // console.log(this.subject);
      // console.log(this.body);
      sendEmail({
        address: this.email,
        subject: this.subject,
        body: this.body,
        cvId: this.dId
      })
      .then((result) => {
        this.cont = result;
        this.showToast("success", "Email sent successfully!");
        })
        .catch((error) => {
          this.error = error;
        });
    }
  }
  attachFile() {
    this.file = event.target.files[0];
    // this.name = this.name.slice(12);
    console.log(this.name.name);
    this.el = document.createElement("p");
    this.el.innerText = this.file.name;
    this.template
      .querySelectorAll("lightning-input")[1]
      .parentElement.appendChild(this.el);

    // console.log(event.detail.files[0]);
    // this.dId = event.detail.files[0].contentVersionId;
    // this.el = document.createElement("p");
    // this.el.innerText = event.detail.files[0].name;
    // this.template
    //   .querySelector("lightning-file-upload")
    //   .parentElement.appendChild(this.el);
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
  rmv() {
    this.showToast("error", "Recipient cannot be removed");
  }
}
