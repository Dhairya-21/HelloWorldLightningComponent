import { LightningElement } from "lwc";
import { NavigationMixin } from "lightning/navigation";

export default class HomePage extends NavigationMixin(LightningElement) {
  register() {
    this[NavigationMixin.Navigate](
      {
        type: "standard__webPage",
        attributes: {
          url: "https://mvclouds-3e-dev-ed.develop.my.site.com/portal/s/login/SelfRegister"
        }
      },
      true
    );
  }

  login() {
    this[NavigationMixin.Navigate](
      {
        type: "standard__webPage",
        attributes: {
          url: "https://mvclouds-3e-dev-ed.develop.my.site.com/portal/s/login"
        }
      },
      true
    );
  }
}
