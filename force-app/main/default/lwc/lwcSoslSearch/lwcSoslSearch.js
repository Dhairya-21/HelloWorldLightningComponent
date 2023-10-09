import { LightningElement, api, track, wire } from "lwc";
import try1 from "@salesforce/apex/lwcSosl.try1";

export default class LwcSoslSearch extends LightningElement {
  @track v = [];
  @track searchTerm;
  @wire(try1, { st: "$searchTerm", lNum: "$v" }) wiredData;
  showChange() {
    this.ev = event.target.value;
    if (this.v.includes(this.ev)) {
      this.v.splice(this.v.indexOf(this.ev), 1);
    } else {
      this.v.push(this.ev);
    }
  }
  handleOnClick() {
    this.searchTerm = this.template.querySelector("lightning-input").value;
  }
}
