import { LightningElement, api, wire } from "lwc";
import { getRecords, getFieldValue } from "lightning/uiRecordApi";
import IMAGE_URL_FIELD from "@salesforce/schema/ContentDocument.LatestPublishedVersion.VersionDataUrl";

export default class FileuploaderMultiple extends LightningElement {
  file = ['0695j00000IGppLAAT'];
  
  @wire(getRecords, {records :[{ recordIds: '$file', fields: IMAGE_URL_FIELD }]}) f1;
  CrImage(){
}

file1() {
    this.ev = event.detail.files;
    for (let i = 0; i < this.ev.length; i++) {
        // this.file.push(this.ev[i].documentId);
        this.ad = this.ev[i].documentId;
        this.el = document.createElement('img');
        this.el.src = getFieldValue(this.f1.data, IMAGE_URL_FIELD);
        console.log(this.f1.data);
        this.template.appendChild(this.el);
    }
}
clickit(){
      this.el = document.createElement('img');
      this.el.src = getFieldValue(this.f1.data, IMAGE_URL_FIELD);
      console.log(this.f1.data);
      this.template.appendChild(this.el);
  }
}
