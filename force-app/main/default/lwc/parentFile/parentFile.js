import { LightningElement, api } from "lwc";
// import {
//   subscribe,
//   unsubscribe,
//   APPLICATION_SCOPE,
//   MessageContext,
//   publish
// } from "lightning/messageService";

export default class ParentFile extends LightningElement {
  // @api passFile();
  file1;
  // connectedCallback(){
  //     this.passFile();
  // }

  passFile() {
    console.log(event.detail.files[0].documentId);
    this.file1 = event.detail.files[0].documentId;
    // this.template.querySelector('c-child-file').getFile(event.detail.files[0].documentId);

  }
}
