import { LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";

export default class RedirectTest extends NavigationMixin(LightningElement) {
    navigate(){
        this[NavigationMixin.Navigate]({
            type: "standard__webPage",
            attributes: {
               url: "https://mvclouds-3e-dev-ed.develop.lightning.force.com/lightning/r/Contact/0035j00001FL40UAAT/view"
            }
        });
    }
}