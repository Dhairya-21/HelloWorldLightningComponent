({
  SelectStep: function (component, num) {
    console.log("Feature Depriciated ");
    // component.set("v.SelStep", num);
    // if (num == 3) {
    //     component.find("NextBtn").set("v.label", "Finish");
    // } else {
    //     component.find("NextBtn").set("v.label", "Next");
    // }
    // console.log(num);
  },

  NextStep: function (component) {
    var step = component.get("v.SelStep");
    if (step == 1) {
      component.find("NextBtn").set("v.label", "Next");
      component.find("NextBtn").set("v.variant", "Brand");
      step += 1;
      component.set("v.SelStep", step);
      var action = component.get("c.CreateAcc");
      action.setParams({
        name: component.find("AName").get("v.value"),
        phone: component.find("APhone").get("v.value"),
        rating: component.find("rating").get("v.value")
      });
      console.log("Problem2");
      action.setCallback(this, function (response) {
        var state = response.getState();
        if ((state = "SUCCESS")) {
          component.set("v.Acc", response.getReturnValue());
        }
      });
      $A.enqueueAction(action);
    } else if (step == 2) {
      component.find("NextBtn").set("v.label", "Finish");
      component.find("NextBtn").set("v.variant", "Success");
      step += 1;
      component.set("v.SelStep", step);
      var action = component.get("c.CreateCon");
      action.setParams({
        name: component.find("CName").get("v.value"),
        rating: component.find("Email").get("v.value"),
        phone: component.find("CPhone").get("v.value")
      });
      action.setCallback(this, function (response) {
        var state = response.getState();
        if ((state = "SUCCESS")) {
          component.set("v.Cont", response.getReturnValue());
        }
      });
      $A.enqueueAction(action);
    } else if (step == 3) {
      console.log("finish");
    }
    // console.log(step);
  },

  PrevStep: function (component) {
    var step = component.get("v.SelStep");
    step -= 1;
    component.find("NextBtn").set("v.label", "Next");
    component.find("NextBtn").set("v.variant", "Brand");
    component.set("v.SelStep", step);
    // console.log(step);
  }
});
