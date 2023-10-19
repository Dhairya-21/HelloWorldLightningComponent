({
  toast: function (component, event, helper) {
    component.find("tmsg").showToast({
      title: "Successful",
      message: "Contact Insertion was successful"
    });
  }
});