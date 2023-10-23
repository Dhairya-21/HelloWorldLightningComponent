import { LightningElement, track } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class LoginPage extends LightningElement {
  @track isShowModal = true;
  @track isShowStudent = false;
  @track isShowTeacher = false;

  student() {
    this.isShowModal = false;
    this.isShowStudent = true;
    this.isShowTeacher = false;
  }
  teacher() {
    this.isShowModal = false;
    this.isShowStudent = false;
    this.isShowTeacher = true;
  }

  login() {
    this.dispatchEvent(
      new ShowToastEvent({
        title: "Success",
        message: "Logged In Successfully",
        variant: "success"
      })
    );
  }
}
