({
  Search: function (component) {
    var searchTerm = component.find("input1").get("v.value");
    var action = component.get("c.getByName");
    action.setParams({ searchKey: searchTerm });
    action.setCallback(this,function(response){
        var state= response.getState();
        if(state === "SUCCESS"){
            component.set("v.Accs1", response.getReturnValue());
        }
    });
    $A.enqueueAction(action);
  }
});
