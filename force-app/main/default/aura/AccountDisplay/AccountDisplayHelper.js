({
    init : function(component) {
        var acclist = component.get("c.AccountD");
        acclist.setCallback(this,function(response){
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.Accounts", response.getReturnValue());
                console.log("its working");
            }
        });
        $A.enqueueAction(acclist);
    }
})
