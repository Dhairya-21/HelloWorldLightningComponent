import { LightningElement, track } from "lwc";
import Upload from "@salesforce/apex/dPClass.Upload";

export default class Dropbox extends LightningElement {
  @track file;

  onUpload() {
    this.file = event.detail.files[0];
    // this.file = JSON.parse(JSON.stringify(this.fl));
    console.log(JSON.parse(JSON.stringify(this.file)));
  }

  redirect() {}

  authorise() {
    Upload({ content: this.file.documentId })
      .then((result) => {
        this.result = result;
      })
      .catch((error) => {
        this.error = error;
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error",
            message: "The transaction has Failed",
            variant: "error"
          })
        );
      });
    console.log(this.result);
    if (this.result === "success") {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Success",
          message: "The image has been uploaded",
          variant: "success"
        })
      );
    } else {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error",
          message: "The transaction has Failed",
          variant: "error"
        })
      );
    }
  }
}
