import { LightningElement, api, track, wire } from "lwc";
// import { createElement } from "lwc";
// import { getRecord, getFieldValue } from "lightning/uiRecordApi";
// import IMAGE_URL_FIELD from "@salesforce/schema/ContentDocument.LatestPublishedVersion.VersionDataUrl";

export default class FileuploaderMultiple extends LightningElement {
  @track r = "";
  getImage() {
    this.event1 = event.detail.files[0];
    this.template.querySelector("c-file-url").file = this.event1.documentId;
    this.r = this.event1.Name;
  }
}
