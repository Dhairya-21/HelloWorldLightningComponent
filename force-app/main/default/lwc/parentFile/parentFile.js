import { LightningElement, api } from 'lwc';

export default class ParentFile extends LightningElement {
    // @api passFile();
    file1;
    // connectedCallback(){
    //     this.passFile();
    // }
    passFile(){
        console.log(event.detail.files[0].documentId);
        this.file1 = event.detail.files[0].documentId;
        // this.template.querySelector('c-child-file').getFile(event.detail.files[0].documentId);
        // this.template.querySelector('c-child-File').getFile(20);
    }
}