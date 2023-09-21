({
  ContactsGet: function (component, event, helper) {
    var page = component.get("v.Psize");
    var action = component.get("c.getContacts");
    action.setParams({});
    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state == "SUCCESS") {
        component.set("v.Cont", response.getReturnValue());
        component.set("v.Tsize", component.get("v.Cont").length);
        component.set("v.start", 0);
        component.set("v.end", page - 1);
        var Pagination = [];
        for (var i = 0; i < page; i++) {
          Pagination.push(response.getReturnValue()[i]);
        }
        component.set("v.PList", Pagination);
      }
    });
    $A.enqueueAction(action);
  },

  onChangeEvent: function (component, event, helper) {
    var change = component.find("records").get("v.value");
    var Pagination = [];
    var ConList = component.get("v.Cont");
    for (var i = 0; i < change; i++) {
      Pagination.push(ConList[i]);
    }
    component.set("v.PList", Pagination);
    component.set("v.Psize", Number(change));
    component.set("v.start", 0);
    component.set("v.end", Number(change) - 1);
  },

  onChangeSearch: function (component, event, helper) {
    var search = component.find("input1").get("v.value");
    var action = component.get("c.getByName");
    var size = component.get("v.Tsize");
    action.setParams({
      searchKey: search,
    });
    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state == "SUCCESS") {
        component.set("v.PList", response.getReturnValue());
        component.set("v.Tsize", component.get("v.Cont").length);
        var Pagination = [];
        for (var i = 0; i < size; i++) {
          Pagination.push(response.getReturnValue()[i]);
        }
        component.set("v.PList", Pagination);
      }
    });
    $A.enqueueAction(action);
  },

  previous: function (component, event, helper) {
    var ConList = component.get("v.Cont");
    var end = component.get("v.end");
    var start = component.get("v.start");
    var page = Number(component.get("v.Psize"));
    var Pagination = [];
    var count = 0;
    for (var i = start - page; i < start; i++) {
      if (i > -1) {
        Pagination.push(ConList[i]);
        count++;
      } else {
        start++;
      }
    }
    start = start - count;
    end = end - count;
    component.set("v.start", start);
    component.set("v.end", end);
    component.set("v.PList", Pagination);
  },

  next: function (component, event, helper) {
    var ConList = component.get("v.Cont");
    var end = component.get("v.end");
    var start = component.get("v.start");
    var page = Number(component.get("v.Psize"));
    var Pagination = [];
    var count = 0;
    for (var i = end + 1; i < end + page + 1; i++) {
      if (ConList.length > end) {
        Pagination.push(ConList[i]);
        count++;
      } else {
        start++;
      }
    }
    start = start + count;
    end = end + count;
    component.set("v.start", start);
    component.set("v.end", end);
    component.set("v.PList", Pagination);
  }
});
