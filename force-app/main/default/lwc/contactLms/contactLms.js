import { LightningElement, wire } from 'lwc';
import getContacts from "@salesforce/apex/lwcClass.getContacts";
export default class ContactLms extends LightningElement {
    @wire (getContacts) wiredData;
    
}