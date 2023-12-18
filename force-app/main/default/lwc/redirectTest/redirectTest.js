import { LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";
import { LightningAlert } from "lightning/alert";

export default class RedirectTest extends NavigationMixin(LightningElement) {
    navigate(){
        this[NavigationMixin.Navigate]({
            type: "standard__webPage",
            attributes: {
               url: "https://mvclouds-3e-dev-ed.develop.lightning.force.com/lightning/r/Contact/0035j00001FL40UAAT/view"
            }
        });
    }
        async handleAlertClick() {
          await LightningAlert.open({
            message: "this is the alert message",
            variant: "header", // if headerless, theme not applicable
            theme: "default", 
            label: "Error", // this is the header text
          });
          //Alert has been closed
          
        }
    }