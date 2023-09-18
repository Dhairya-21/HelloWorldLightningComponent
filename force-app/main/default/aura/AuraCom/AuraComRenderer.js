({
    // Your renderer method overrides go here
    render: function () {
        var i = this.superRender();
        console.log('Hello');
        return i;
    },
    rerender: function(){
        this.superReRender();
        console.log("rerender");
    },
    afterRender: function(){
        this.superAfterRender();
        console.log('after rerender');
    },
    unrender: function(){
        this.unRender();
        console.log('unrender');
    }

})
