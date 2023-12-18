/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';
// import saveSign from '@salesforce/apex/SignatureHelper.saveSign';
// import { ShowToastEvent } from 'lightning/platformShowToastEvent';

//declaration of variables for calculations
let isDownFlag, 
    mouse = {a: 0, b: 0},
    previous = {a: 0, b: 0};
       
    
    let canvasElement, ctx; //storing canvas context
    let dataURL,convertedDataURI; //holds image data
    
    export default class CapturequestedEventignature extends LightningElement {
        
    @track eraseOn = false;
    @track color = "#0000A0"; //blue color
    @track size = 1; //weight of line width and dot.       

    @track points = [];
    @track path = [];

    //event listeners added for drawing the signature within shadow boundary
    constructor() {
        super();
        this.template.addEventListener('mousemove', this.handleMouseMove.bind(this));
        this.template.addEventListener('mousedown', this.handleMouseDown.bind(this));
        this.template.addEventListener('mouseup', this.handleMouseUp.bind(this));
        this.template.addEventListener('mouseout', this.handleMouseOut.bind(this));
    }

    connectedCallback(){
        let element = this.template.querySelector('canvas');
        console.log(element);
        console.log('element');
    }
    //retrieve canvase and context
    renderedCallback(){
        canvasElement = this.template.querySelector('canvas');
        ctx = canvasElement.getContext("2d");
    }
    
    //handler for mouse move operation
    handleMouseMove(event){
        this.searchCoordinatesForEvent('move', event);      
    }
    
    //handler for mouse down operation
    handleMouseDown(event){
        this.searchCoordinatesForEvent('down', event);         
    }
    
    //handler for mouse up operation
    handleMouseUp(event){
        this.searchCoordinatesForEvent('up', event);       
    }

    //handler for mouse out operation
    handleMouseOut(event){
        this.searchCoordinatesForEvent('out', event);         
    }

    handleIncrease(){
        if (this.size < 10)
            this.size++;
    }
    
    handleDecrease(){
        if (this.size > 1) 
            this.size--; 
    }

    handleSaveClick(){    
        //set to draw behind current content
        ctx.globalCompositeOperation = "destination-over";
        ctx.fillStyle = "#FFF"; //white
        ctx.fillRect(0,0,canvasElement.width, canvasElement.height); 

        //convert to png image as dataURL
        dataURL = canvasElement.toDataURL("image/png");
        //convert that as base64 encoding
        convertedDataURI = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
        
    //     saveSign({strSignElement: convertedDataURI})
    //         .then(result => {
    //             this.attachment = result;
    //             console.log('attachment id=' + this.attachment.Id);
    //             //show success message
    //             this.dispatchEvent(
    //                 new ShowToastEvent({
    //                     title: 'Success',
    //                     message: 'Attachment created with Signature',
    //                     variant: 'success',
    //                 }),
    //             );
    //         })
    //         .catch(error => {
    //             //show error message
    //             this.dispatchEvent(
    //                 new ShowToastEvent({
    //                     title: 'Error creating Attachment record',
    //                     message: error.body.message,
    //                     variant: 'error',
    //                 }),
    //             );
    //         });
            
    }

    handleClearClick(){
        ctx.clearRect(0, 0, canvasElement.width, canvasElement.height);
        this.path = [];    
    }

    handleErase(){
        this.eraseOn = !this.eraseOn;
    }

    handleUndo(){
        console.log(this.path.length);
        this.path.pop();
        console.log(this.path.length);
        ctx.clearRect(0, 0, canvasElement.width, canvasElement.height);
        this.path.forEach(p =>{
            ctx.beginPath();
            ctx.moveTo(p[0].a, p[0].b);
            for (let i = 1; i < p.length; i++) {
                ctx.lineTo(p[i].a, p[i].b)
            }
             ctx.stroke();
        });
    }

    searchCoordinatesForEvent(requestedEvent, event){
        event.preventDefault();
        if (requestedEvent === 'down') {
            this.setupCoordinate(event);           
            isDownFlag = true;
            this.points = [];
            this.points.push({a: previous.a, b: previous.b});
        }
        if (requestedEvent === 'up' || requestedEvent === "out") {
            isDownFlag = false;
            this.path.push(this.points);
        }
        if (requestedEvent === 'move') {
            if (isDownFlag) {
                this.setupCoordinate(event);
                if (this.eraseOn) {
                    this.erase();
                }
                else{
                    this.points.push({a: previous.a, b: previous.b});
                    this.redraw();
                }
            }
        }
    }

    //This method is primary called from mouse down & move to setup cordinates.
    setupCoordinate(eventParam){
        //get size of an element and its position relative to the viewport 
        //using getBoundingClientRect which returns left, top, right, bottom, x, y, width, height.
        const clientRect = canvasElement.getBoundingClientRect();
        previous.a = mouse.a;
        previous.b = mouse.b;
        mouse.a = eventParam.clientX -  clientRect.left;
        mouse.b = eventParam.clientY - clientRect.top;
    }

    //For every mouse move based on the coordinates line to redrawn
    redraw() {
        ctx.beginPath();
        ctx.moveTo(previous.a, previous.b);
        ctx.lineTo(mouse.a, mouse.b);
        ctx.strokeStyle = this.color; //sets the color, gradient and pattern of stroke
        ctx.lineWidth = this.size;        
        ctx.closePath(); //create a path from current point to starting point
        ctx.stroke(); //draws the path
    }
    
    erase() {
        ctx.beginPath();
        ctx.moveTo(previous.a, previous.b);
        ctx.lineTo(mouse.a, mouse.b);
        ctx.strokeStyle = 'white'; //sets the color, gradient and pattern of stroke
        ctx.lineWidth = this.size;        
        ctx.closePath(); //create a path from current point to starting point
        ctx.stroke(); //draws the path
    }
    //this draws the dot
    // drawDot(){
    //     ctx.beginPath();
    //     ctx.fillStyle = this.color; //blue color
    //     ctx.fillRect(mouse.a, mouse.b, this.size, this.size); //fill rectrangle with coordinates
    //     ctx.closePath();
    // }
}