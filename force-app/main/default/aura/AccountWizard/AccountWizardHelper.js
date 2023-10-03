({
  // SelectStep: function (component, num) {
  //   console.log("Feature Depriciated ");
  //   component.set("v.SelStep", num);
  //   if (num == 3) {
  //       component.find("NextBtn").set("v.label", "Finish");
  //   } else {
  //       component.find("NextBtn").set("v.label", "Next");
  //   }
  //   console.log(num);
  // },

  NextStep: function (component) {
    var step = component.get("v.SelStep");

    // First Step Creating Account
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
      action.setCallback(this, function (response) {
        var state = response.getState();
        if ((state = "SUCCESS")) {
          component.set("v.Acc", response.getReturnValue());
          component.find("tmsg").showToast({
            "title": 'Creating Account',
            "message": 'Your Account has been created'
          });
        }
      });
      $A.enqueueAction(action);
    }

    // Second Step Adding Contact 
    else if (step == 2) {
      component.find("NextBtn").set("v.label", "Finish");
      component.find("NextBtn").set("v.variant", "Success");
      step += 1;
      component.set("v.SelStep", step);
      var action = component.get("c.CreateCon");
      action.setParams({
        name: component.find("CName").get("v.value"),
        email: component.find("Email").get("v.value"),
        phone: component.find("CPhone").get("v.value"),
        accId: component.get("v.Acc").Id
      });
      action.setCallback(this, function (response) {
        var state = response.getState();
        if ((state = "SUCCESS")) {
          component.set("v.Cont", response.getReturnValue());
          component.find("tmsg").showToast({
            "title": 'Contact Created',
            "message": "Your Contact has been created successfully.",
          });
        }
      });
      $A.enqueueAction(action);
    }

    //Third Step creating event
    else if (step == 3) {
      var action = component.get("c.CreateEvent");
      action.setParams({
        subject: component.find("Subject").get("v.value"),
        start: component.find("start").get("v.value"),
        endt: component.find("endt").get("v.value"),
        accId: component.get("v.Acc").Id
      });
      action.setCallback(this, function (response) {
        var state = response.getState();
        if ((state == "SUCCESS")) {
          component.find("tmsg").showToast({
            "title": 'Event Created',
            "message": "Your Event has been created successfully.",
          });
        }
      });
      $A.enqueueAction(action);

    }
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
