import { LightningElement, track } from "lwc";

import { ShowToastEvent } from "lightning/platformShowToastEvent";

import Upload from "@salesforce/apex/dPClass.Upload";
import DeleteFiles from "@salesforce/apex/dPClass.DeleteFiles";
import ListFiles from "@salesforce/apex/dPClass.ListFiles";

import main from "@salesforce/apex/dropboxClass.main";

export default class Dropbox extends LightningElement {
  @track names = [];
  @track name = "None";

  @track file;

  // Upload File
  // redirect(){
  //   main().then((result) => {
  //     console.log(result);
  //   }).catch((err) => {
  //     console.log(err);
  //   });
  // }

  onUpload() {
    this.file = event.detail.files[0];
    // console.log(JSON.parse(JSON.stringify(this.file)));
  }

  uploadTo() {
    Upload({ content: this.file.documentId })
      .then((result) => {
        if (result === "success") {
          this.ShowToast(result, "Successful! File Added");
        } else {
          this.ShowToast(result, "Error! Failed to Insert File");
        }
      })
      .catch((error) => {
        console.log(error);
        this.ShowToast("error", "Error! Failed to load resources");
      });
  }

  // Show list of files
  onList() {
    ListFiles()
      .then((result) => {
        this.obj = JSON.parse(result);
        this.names = [];
        this.obj.entries.forEach((element) => {
          this.names.push(element.name);
        });
      })
      .catch((error) => {
        console.log(error);
        this.ShowToast("error", "Error! Failed to load all files");
      });
  }

  // Display Files
  onRefresh() {
    this.onList();
    this.template.querySelectorAll("div")[3].innerHTML = "";
    this.names.forEach((element) => {
      // console.log(element);
      this.el = document.createElement("p");
      this.el.innerText = element;
      this.el.onclick = this.setval(element);
      this.template.querySelectorAll("div")[3].appendChild(this.el);
    });
  }

  setval(e) {
    this.name = e;
    // console.log(this.name);
  }
  // Delete Files
  onDelete() {
    // console.log(this.name);
    DeleteFiles({ file: this.name })
      .then((result) => {
        if (result === "success") {
          this.ShowToast(result, "Successful! Deleted.");
        } else {
          this.ShowToast(result, "Failed! We hit a snag");
        }
      })
      .catch((error) => {
        console.log(error);
        this.ShowToast("error", "Failed! Something went wrong.");
      });
  }

  ShowToast(n, m) {
    let toastEvent = new ShowToastEvent({
      title: n.charAt(0).toUpperCase() + n.slice(1),
      message: m,
      variant: n
    });
    this.dispatchEvent(toastEvent);
  }
}
