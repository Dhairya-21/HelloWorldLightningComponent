({
    init : function(component,event, helper) {
        var SS = component.get("v.SelStep");
        component.set("v.SelStepS", parseInt(SS));
    }
    // event.preventDefault();
    SelectStep1 : function(component, event, helper) {
        helper.SelectStep(component, 1);
    },
    SelectStep2 : function(component, event, helper) {
        helper.SelectStep(component, 2);
    },
    SelectStep3 : function(component, event, helper) {
        helper.SelectStep(component, 3);
    },
    NextStep : function(component, event, helper){
        helper.NextStep(component);
        var SS = component.get("v.SelStep");
        component.set("v.SelStepS", parseInt(SS));
    },
    PrevStep : function(component, event, helper){
        helper.PrevStep(component);
    }
})
