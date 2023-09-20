({
    getAllAccounts : function(component, event, helper) {
        var Accs = component.get("c.getAccounts");
        Accs.setCallback(this,function (response){
            var state = response.getState();
            if (state == "SUCCESS") {
                component.set("v.Accs", response.getReturnValue());
            }
        });
        $A.enqueueAction(Accs);
    },
    getAllContacts : function(component, event, helper){
        console.log('getAllContacts');
        var AccId = component.get("v.Select");
        var Cont = component.get("c.getContacts");
        Cont.setParams({
            "AccId" : AccId
        })
        Cont.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.Cont", response.getReturnValue());
            }
        });
        $A.enqueueAction(Cont);
        console.log(component.get("v.Cont"));
    }
})
