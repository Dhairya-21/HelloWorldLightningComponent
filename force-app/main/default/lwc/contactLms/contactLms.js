import { LightningElement, api, track, wire } from "lwc";
import getContacts from "@salesforce/apex/lwcClass.getContacts";
import {
  publish,
  subscribe,
  unsubscribe,
  createMessageContext,
  releaseMessageContext
} from "lightning/messageService";
import SAMPLEMC from "@salesforce/messageChannel/msgchl__c";

export default class ContactLms extends LightningElement {
  @api acId;
  @track accountRecord;
  @track error;
//   acs = 1;
  @api cont = [];
  @wire(getContacts, { accIds: "$acId" }) wiredData({ error, data }) {
    if (data) {
      this.accountRecord = data;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.accountRecord = undefined;
    }
  }
  context = createMessageContext();

  connectedCallback() {
    this.subscribeMC();
  }

  displayMessage(message) {
    this.receivedMessage = message
      ? JSON.stringify(message, null, "\t")
      : "no message payload";
    this.acId = this.receivedMessage.slice(21, -3);
    console.log(this.acId);
  }

  subscribeMC() {
    // if (this.subscription) {
    //   return;
    // }
    this.subscription = subscribe(this.context, SAMPLEMC, (message) => {
      this.displayMessage(message);
    });
  }
  showConts() {
    this.accountRecord.forEach((element) => {
      this.cont.push(element);
      console.log(element.LastName);
      console.log(element.Id);
      console.log(element);
    });
    this.acs = JSON.parse(JSON.stringify(this.cont));
    console.log(this.cont);
    console.log(this.acs);
  }
}
