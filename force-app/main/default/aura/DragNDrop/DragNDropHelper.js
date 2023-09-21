({
  Search: function (component, num) {
    var searchTerm = component.find("input" + num).get("v.value");
    var action = component.get("c.getByName");
    action.setParams({ searchKey: searchTerm });
    action.setCallback(this,function(response){
        var state= response.getState();
        if(state === "SUCCESS"){
            component.set("v.Accs" + num, response.getReturnValue());
        }
    });
    $A.enqueueAction(action);
  }
});
