import { LightningElement, track, wire } from "lwc";
// import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin } from "lightning/navigation";

export default class LoginPage extends NavigationMixin(LightningElement) {
  @track isShowModal = true;
  @track isShowStudent = false;
  @track isShowTeacher = false;
  @track username = "";
  @track password1 = "";

  //   @wire wiredRecords;

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

  email() {
    this.username = event.target.value;
  }

  password() {
    this.password1 = event.target.value;
  }

  login() {
    // console.log("Hello");
    if (this.username === "admin" && this.password1 === "12345") {
      this[NavigationMixin.Navigate](
        {
          type: "standard__webPage",
          attributes: {
            url: "https://mvclouds-3e-dev-ed.develop.my.site.com/portal/s/"
          }
        },
        true
      );
      // this.dispatchEvent(
      //   new ShowToastEvent({
      //     title: "Success",
      //     message: "Logged In Successfully",
      //     variant: "success"
      //   })
      // );
    } else {
      // error
      console.log("error");
      // this.dispatchEvent(
      //   new ShowToastEvent({
      //     title: "Error",
      //     message: "Invalid Username or Password",
      //     variant: "error"
      //   })
      // );
    }
  }
}
