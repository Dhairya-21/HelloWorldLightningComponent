import { LightningElement,api,track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from "lightning/actions";

import SendEmailMessage from "@salesforce/apex/AddnEmail.SendEmailMessage";


export default class sendEmail extends NavigationMixin(LightningElement) {
    @api recordId;
    
    @track href; 
    // 'https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id=' + this.recordId;

    @track toAddress = '';
    @track ccAddress = '';
    @track bccAddress = '';
    @track subject = '';
    @track body = '';
    @track footerbody = '';
    
    connectedCallback(){
        console.log('connected');
        console.log(this.recordId);
        this.href = 'https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id=' + this.recordId;
        this.footerbody = '<p>Please check the account record <a href="https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id='
       + this.recordId 
       +'"> here</a>.</p><p>This email is sent from koshtidhairya99@gmail.com</p><br /><p>Regards,</p>';
    }

    renderedCallback(){
        console.log('rendered');
        console.log(this.recordId);
        this.href = 'https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id=' + this.recordId;
        this.footerbody = '<p>Please check the account record <a href="https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id='
       + this.recordId 
       +'"> here</a>.</p><p>This email is sent from koshtidhairya99@gmail.com</p><br /><p>Regards,</p>';
    }    
    
    // Modal Show / Hide
    // showModalBox() {  
        //     this.isShowModal = true;
        // }
        // hideModalBox() {  
            //     this.isShowModal = false;
            // }
            
            Cancel(){
                this.dispatchEvent(new CloseActionScreenEvent());
    }

    // Email Creds
    toAdd(event){
        this.toAddress = event.target.value;
        this.href = 'https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id=' + this.recordId;
        this.footerbody = '<p>Please check the account record <a href="https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id='
       + this.recordId 
       +'"> here</a>.</p><p>This email is sent from koshtidhairya99@gmail.com</p><br /><p>Regards,</p>';
    }
    ccAdd(event){
        this.ccAddress = event.target.value;
    }
    bccAdd(event){
        this.bccAddress = event.target.value;
    }
    subjectChange(event){
        this.subject = event.target.value;
    }
    bodyChange(event){
        this.body = event.target.value;
    }

    // Send Email Button
    sendEmail(){
        this.href = 'https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id=' + this.recordId;
        this.footerbody = '<p>Please check the account record <a href="https://mvclouds-3e-dev-ed.develop.my.salesforce-sites.com/AccountPage?Id='
       + this.recordId 
       +'"> here</a>.</p><p>This email is sent from koshtidhairya99@gmail.com</p><br /><p>Regards,</p>';
        if(this.toAddress === '' || this.subject === '' || this.body === ''){
            this.dispatchEvent(new ShowToastEvent({
                title: "Required fields missing",
                message: "Pleasse fill all required fields to send the email",
                variant: "error"
            }));
        } else{
            this.body = this.body + this.footerbody;
            SendEmailMessage({ToAdd: this.toAddress, CCAdd: this.ccAddress, BCCAdd: this.bccAddress, Subject: this.subject, Body: this.body, recordId: this.recordId}).then((result) => {
                if (result === 'Success') {
                    this.dispatchEvent(new ShowToastEvent({
                        title: "Email sent",
                        message: "The email has been sent successfully",
                        variant: "success"
                    }));
                }
            }).catch((err) => {
                console.log(err);
                this.dispatchEvent(new ShowToastEvent({
                    title: "Apex Class Error",
                    message: "Some Error Has Occured in Apex Class",
                    variant: "error"
                }));
            });
        }
    }
}