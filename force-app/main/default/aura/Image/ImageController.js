({
    init : function(component, event, helper) {
    },
    Showimg : function(component, event, helper) {
        var bcolor = component.get("v.bcolor");
        var size = component.get("v.size");
        var fcolor = component.get("v.fcolor");
        var div1 = component.find("Imgdiv").getElement();
        div1.style.display = "block";
        div1.style.backgroundColor = bcolor;
        var p1 = component.find("description").getElement();
        p1.style.fontSize = size + 'pt';
        p1.style.color = fcolor;
    }
})
