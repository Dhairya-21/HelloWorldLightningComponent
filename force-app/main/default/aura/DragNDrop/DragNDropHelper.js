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
  },

  ShowConts: function(component, Acc){
    var action = component.get("c.getContacts");
    var accId = Acc;
    action.setParams({
      AccID : accId
    });
    action.setCallback(this, function(response){
      var state = response.getState();
      if(state = "SUCCESS"){
        component.set("v.Cont1", response.getReturnValue());
      }
    });
    $A.enqueueAction(action);
  }
});
