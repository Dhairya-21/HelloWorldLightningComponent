import { LightningElement } from "lwc";
import { NavigationMixin } from "lightning/navigation";

export default class Navbar extends NavigationMixin(LightningElement) {
  navigateToHome() {
    this[NavigationMixin.Navigate]({
      type: "standard__namedPage",
      attributes: {
        pageName: "home"
      }
    });
  }

  navigateToContacts() {
    this[NavigationMixin.Navigate]({
      type: "standard__objectPage",
      attributes: {
        objectApiName: "Contact",
        actionName: "list"
      }
    });
  }

  // Add more navigation methods for other pages as needed
}
