import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import IMAGE_URL_FIELD from "@salesforce/schema/ContentDocument.LatestPublishedVersion.VersionDataUrl";

export default class FileUrl extends LightningElement {
  @api file = '0015j00001AyGjZAAV';
  // @api file;
  @wire(getRecord, { recordId: "$file", fields: [IMAGE_URL_FIELD] })
  recordID;

  @api createEl() {
    this.el = document.createElement("img");
    this.el.src = this.imgURL();
    this.template.querySelector("div").appendChild(this.el);
  }

  imgURL() {
    this.p = document.createElement("p");
    this.p.innerText = this.file;
    this.template.querySelector("div").appendChild(this.p);
    // console.log(this.recordID.config.recordID);
    // console.log(this.recordID.config.fields);
    // console.log(this.recordID.recordID);
    return getFieldValue(this.recordID.data, IMAGE_URL_FIELD);
  }
}
