import { LightningElement } from 'lwc';
// import readFileFromRecord from '@salesforce/apex/ReadFileData.readFileFromRecord';
import { loadScript } from 'lightning/platformResourceLoader';
// import sheetjs from '@salesforce/resourceUrl/sheetjs';
import sheetminjs from '@salesforce/resourceUrl/sheetminjs';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

let XLS = {};

export default class FilesCSV extends LightningElement {

    strAcceptedFormats = [".xls", ".xlsx"];
    strUploadFileName; 
    objExcelToJSON;
    connectedCallback() {
        Promise.all([loadScript(this, sheetminjs)]).then(() => {
          console.log(10);
          // eslint-disable-next-line no-undef
            XLS = XLSX;
        }).catch((error) => {
            console.log('An error has occured: '+ error);
        })
    }


    handleUploadFinished(event) {
        const strUploadedFile = event.detail.files;
        if (strUploadedFile.length && strUploadedFile !== "") {
          this.strUploadFileName = strUploadedFile[0].name;
          this.handleProcessExcelFile(strUploadedFile[0]);
        }
      }
      handleProcessExcelFile(file) {
        let objFileReader = new FileReader();
        objFileReader.onload = (event) => {
          let objFiledata = event.target.result;
          let objFileWorkbook = XLS.read(objFiledata, {type: "binary"});
          this.objExcelToJSON = XLS.utils.sheet_to_row_object_array(objFileWorkbook.Sheets.Sheet3);
          //Verify if the file content is not blank
          if (this.objExcelToJSON.length === 0) {
            this.strUploadFileName = "";
            this.dispatchEvent(new ShowToastEvent({
                title: "Error",
                message: "Kindly upload the file with data",
                variant: "error"
              })
            );
          }
          if (this.objExcelToJSON.length > 0) {
            //Remove the whitespaces from the javascript object
            Object.keys(this.objExcelToJSON).forEach((key) => {
              const replacedKey = key.trim().toUpperCase().replace(/\s\s+/g, "_");
              if (key !== replacedKey) {
                this.objExcelToJSON[replacedKey] = this.objExcelToJSON[key];
                delete this.objExcelToJSON[key];
              }
            });
            console.log('objExcelToJSON' + this.objExcelToJSON);
            console.log(this.objExcelToJSON.length);
            console.log(this.objExcelToJSON[0].Manager);
          }
        };
        objFileReader.onerror = function (error) {
          this.dispatchEvent(new ShowToastEvent({
              title: "Error while reading the file",
              message: error.message,
              variant: 'error'
            })
          );
        };
        objFileReader.readAsBinaryString(file);
      }
}