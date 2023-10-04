import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import IMAGE_URL_FIELD from "@salesforce/schema/ContentDocument.LatestPublishedVersion.VersionDataUrl";
export default class ChildFile extends LightningElement {
  @api file;
  //   getFile(str) {
  //     this.file = str;
  //   }
  @wire(getRecord, { recordId: "$file", fields: [IMAGE_URL_FIELD] })
  contentDocImage;

  get imageUrl() {
    return getFieldValue(this.contentDocImage.data, IMAGE_URL_FIELD);
  }
}
