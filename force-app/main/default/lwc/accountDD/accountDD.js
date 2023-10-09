// import getContacts from "@salesforce/apex/lwcClass.getContacts";
import { LightningElement, api, wire } from "lwc";
import getAccounts from "@salesforce/apex/lwcClass.getAccounts";
import {
  publish,
  subscribe,
  unsubscribe,
  createMessageContext,
  releaseMessageContext
} from "lightning/messageService";
import SAMPLEMC from "@salesforce/messageChannel/msgchl__c";

export default class AccountDD extends LightningElement {
  @wire(getAccounts) wiredData;
  @api records = this.wiredData;
  context = createMessageContext();
  accId;
  showCon() {
    this.accId = event.target.value;
    const message = {
      messageToSend: this.accId
    };
    publish(this.context, SAMPLEMC, message);
  }
}
