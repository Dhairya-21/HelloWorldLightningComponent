import { LightningElement, track } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin } from "lightning/navigation";

export default class RegisterPage extends NavigationMixin(LightningElement) {
  @track isShowModal = true;
  @track isShowTeacher = false;
  @track isShowStudent = false;

  @track fname1 = "";
  @track lname1 = "";
  @track email1 = "";
  @track password1 = "";
  @track cpassword1 = "";
  @track age1 = "";
  @track phone1 = "";
  @track add = "";

  teacher() {
    this.isShowModal = false;
    this.isShowStudent = false;
    this.isShowTeacher = true;
    // console.log('teacher');
  }

  student() {
    this.isShowModal = false;
    this.isShowStudent = true;
    this.isShowTeacher = false;
    // console.log('student');
  }

  fname() {
    this.fname1 = event.target.value;
  }

  lname() {
    this.lname1 = event.target.value;
  }

  email() {
    this.email1 = event.target.value;
  }

  password() {
    this.password1 = event.target.value;
  }

  cpassword() {
    this.cpassword1 = event.target.value;
  }

  age() {
    this.age1 = event.target.value;
  }

  phone() {
    this.phone1 = event.target.value;
  }

  address() {
    this.add = event.target.value;
  }

  create() {
    if (
      this.fname1 === "" ||
      this.lname1 === "" ||
      this.email1 === "" ||
      this.password1 === "" ||
      this.cpassword1 === "" ||
      this.age1 === "" ||
      this.phone1 === ""
    ) {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error",
          message: "Required fields cannot be blank",
          variant: "error"
        })
      );
    } else if (this.cpassword1 !== this.password1) {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error",
          message: "Passwords don't match",
          variant: "error"
        })
      );
    } else {
      if (this.isShowStudent === true) {
        console.log("student");
        this[NavigationMixin.Navigate]({
          type: "standard__webPage",
          attributes: {
            url: "https://mvclouds-3e-dev-ed.develop.my.site.com/portal/s/"
          }
        });
      } else if (this.isShowTeacher === true) {
        console.log("teacher");
        this[NavigationMixin.Navigate]({
          type: "standard__webPage",
          attributes: {
            url: "https://mvclouds-3e-dev-ed.develop.my.site.com/portal/s/"
          }
        }, true);
      }
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Success",
          message: "The account has been created successfully",
          variant: "success"
        })
      );
    }
  }

  reset() {
    console.log("reset");
    this.fname1 = "";
    this.lname1 = "";
    this.email1 = "";
    this.password1 = "";
    this.cpassword1 = "";
    this.age1 = "";
    this.phone1 = "";
    this.add = "";
  }
}
