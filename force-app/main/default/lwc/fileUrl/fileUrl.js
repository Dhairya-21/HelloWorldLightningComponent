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
    this.el = document.createElement("img");
    this.el.src = this.imgURL();
    // this.el.className = this.total;
    if (this.total === 0) {
      this.el.style.display = "block";
    } else {
      this.el.style.display = "none";
    }
    //
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
      this.i = this.template.querySelectorAll("img");
      this.i[this.start - 1].style.display = "none";
      this.i[this.start].style.display = "block";
      this.start++;
    }
  }
  previous() {
    if (this.start > 0) {
      this.start--;
      this.i = this.template.querySelectorAll("img");
      this.i[this.start].style.display = "none";
      this.i[this.start - 1].style.display = "block";
    }
  }
}
