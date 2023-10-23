import { LightningElement, track } from "lwc";
// import { NavigationMixin } from "lightning/navigation";

export default class Student_Form extends LightningElement {
  @track Student = {};

  changeEv() {
    this.Student[event.target.label] = event.target.value;
  }

  register() {
    console.log(this.Student);
    // this[NavigationMixin.Navigate]({
    //     type: 'standard__component',
    //     attributes:{
    //         componentName: 'c__Image'
    //     },
    // });
  }

  reset() {
    this.Student = {};
    this.template.querySelectorAll("lightning-input").forEach((element) => {
      element.value = "";
    });
    this.template.querySelectorAll("lightning-textarea").forEach((element) => {
      element.value = "";
    });
  }
}
