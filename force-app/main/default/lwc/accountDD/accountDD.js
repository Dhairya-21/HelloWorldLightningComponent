import { LightningElement, api, wire } from 'lwc';
import getAccounts from "@salesforce/apex/lwcClass.getAccounts";
// import getContacts from "@salesforce/apex/lwcClass.getContacts";
export default class AccountDD extends LightningElement {
    @wire (getAccounts) wiredData;
    @api records = this.wiredData;
    accId;
    showCon(){
       console.log(event.target.value);
       this.accId = event.target.value;
    }
}