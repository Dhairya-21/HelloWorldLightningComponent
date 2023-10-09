import { LightningElement, api, track, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import IMAGE_URL_FIELD from "@salesforce/schema/ContentDocument.LatestPublishedVersion.VersionDataUrl";

export default class FileUrl extends LightningElement {
  @api file;
  start = 1;
  total = 0;
  @wire(getRecord, { recordId: "$file", fields: [IMAGE_URL_FIELD] })
  recordID;

  @api createEl() {
    console.log(this.file);
    console.log(this.recordID.data);
    this.el = document.createElement("img");
    this.el.src = this.imgURL();
    this.template.querySelector("p").parentElement.appendChild(this.el);
    this.template
      .querySelector("p")
      .parentElement.appendChild(document.createElement("br"));
    this.total++;
  }

  imgURL() {
    return getFieldValue(this.recordID.data, IMAGE_URL_FIELD);
  }

  next() {
    if (this.start < this.total) {
      this.start++;
    }
  }
  previous() {
    if (this.start > 0) {
      this.start--;
    }
  }
}
