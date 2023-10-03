({
  // Search account using search key and set contact count
  SearchAcc: function (component, num) {
    var searchTerm = component.find("input" + num).get("v.value");
    var action = component.get("c.getAccounts");
    action.setParams({ searchKey: searchTerm });
    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        var list = [];
        var conts = response.getReturnValue();
        for (var k in conts) {
          list.push({ value: conts[k], key: k });
        }
        component.set("v.Acc" + num, list);
      }
    });
    $A.enqueueAction(action);
  },

  // Search account using account name
  SearchCont: function (component, i, a) {
    var action = component.get("c.getContacts");
    action.setParams({
      name: i
    });
    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state == "SUCCESS") {
        component.set("v.Cont" + a, response.getReturnValue());
      }
    });
    $A.enqueueAction(action);
  }

  //   SetCount: function (component, Acc) {
  //     var count = component.get("c.getContactsValue");
  //     var AccId = component.find(Acc);
  //     count.setParams({
  //       AccId: AccId
  //     });
  //     count.setCallback(this, function (response) {
  //       var state = response.getState();
  //       if (state === "SUCCESS") {
  //         component.set("v.count", response.getReturnValue());
  //       }
  //     });
  //     $A.enqueueAction(count);
  //   }
});
