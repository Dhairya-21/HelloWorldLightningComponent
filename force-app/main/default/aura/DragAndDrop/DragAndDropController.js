({
  //   doInit: function (component, event, helper) {
  //     helper.SetCount(component, "v.Acc")
  //   },

  // Search Account Methods
  SearchAcc1: function (component, event, helper) {
    helper.SearchAcc(component, 1);
  },
  SearchAcc2: function (component, event, helper) {
    helper.SearchAcc(component, 2);
  },

  //Finding Contacts
  render1: function (component, event, helper) {
    // var id1 = component
    var i = event.target.id;
    component.set('v.AccName1', i);
    helper.SearchCont(component, i, 1);
    component.set("v.hide1", 2);
  },
  render2: function (component, event, helper) {
    var i = event.target.id;
    component.set('v.AccName2', i);
    helper.SearchCont(component, i, 2);
    component.set("v.hide2", 2);
  },
  
  // Draggable contact methods
  dStart: function (component, event, helper) {
    var i = event.target.id;
    component.set("v.Tcon", i);
    console.log(component.get("v.Tcon"));
  },

  ondrop: function (component, event, helper) {
    event.preventDefault();
  },

  dOver: function (component, event, helper) {
    var FAcc = event.target.id;
    var TCon = component.get("v.Tcon");
    var action = component.get("c.TransferCon");
    action.setParams({
      TConId: TCon,
      FAccId: FAcc
    });
    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        console.log("Transfer SuccessFull");
      }
    });
    $A.enqueueAction(action);
  }
});
