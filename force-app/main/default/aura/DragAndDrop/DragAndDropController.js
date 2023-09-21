({
//   doInit: function (component, event, helper) {
//     helper.SetCount(component, "v.Acc")
//   },
  SearchAcc1: function (component, event, helper) {
    helper.SearchAcc(component, 1);
  },
  SearchAcc2: function (component, event, helper) {
    helper.SearchAcc(component, 2);
  },
  render1:function(component, event, helper){
    var i = event.target.value;
    console.log(i);
  },
//   render2:function(component, event, helper){
//     helper.renderIt(component, event, 2);
//   }
});
