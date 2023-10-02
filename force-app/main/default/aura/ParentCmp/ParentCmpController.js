({
    Selected : function(component, event, helper) {
        // component.set("v.file1", "Selected now");
        var UF = event.getParam("files");
        UF.forEach(file => component.set("v.File1", file.documentId));
        var evt = $A.get("e.c:PassVal");
        evt.setParams({"value":component.get("v.File1")});
        evt.fire();
        // UF.forEach(file => component.set("v.file1", file.name));
    },
})
