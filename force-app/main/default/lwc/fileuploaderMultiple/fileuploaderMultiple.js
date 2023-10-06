import { LightningElement, api, wire } from "lwc";
// import { createElement } from "lwc";
// import { getRecord, getFieldValue } from "lightning/uiRecordApi";
// import IMAGE_URL_FIELD from "@salesforce/schema/ContentDocument.LatestPublishedVersion.VersionDataUrl";

export default class FileuploaderMultiple extends LightningElement {
  start = 0;
  total = 0;
  getImage() {
    this.event1 = event.detail.files;
    for (let i = 0; i < this.event1.length; i++) {
    this.template.querySelector('c-file-url').file = this.event1[i].documentId;
    console.log(this.template.querySelector('c-file-url').file);
    this.template.querySelector('c-file-url').createEl();
    }
  }

  next() {
  }

  previous() {
    }
}
