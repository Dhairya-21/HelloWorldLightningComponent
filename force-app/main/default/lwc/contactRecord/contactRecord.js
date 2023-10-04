import { LightningElement, api, track} from "lwc";
// import CreateAcc from '@salesforce/apex/AccountWizardClass.CreateAcc'

export default class ContactRecord extends LightningElement {
  @api record = "Name";
  @track fields = ["Name", "Phone", "Email",'AccountId', 'Title'];
  // @wire(CreateAcc) acc;
  constructor(){
    super();
    console.log('Hello1');
  }
  connectedCallback(){
    console.log('CallBack');
    // console.log(this.acc);
  }
}