var messageType = {
    Error: 0,
    Success: 1,
    Warning: 2,
    Exception:3
}

var message = {
    error: function (content) {
        $.alert({
            title: 'Message',
            icon: 'fa fa-warning',
            type: 'red',
            animation: 'scale',
            content: content
        });
    },

    success: function (content) {
        $.alert({
            title: 'Message',
            icon: 'fa fa-check',
            type: 'green',
            animation: 'scale',
            content: content
        });
    },
    warning: function (content, columnClass = 'col-md-6 col-md-offset-3') {
        $.alert({
            title: 'Message',
            icon: 'fa fa-warning',
            type: 'orange',
            animation: 'scale',
            //columnClass: columnClass,
            content: content
        });
    },
    confirm: function (content, confirmCb) {
        $.confirm({
            title: 'Confirmation !',
            content: content,
            type: 'red',
            typeAnimated: true,
            draggable: true,
            animationSpeed: 200,
            animation: 'scale',
            closeAnimation: 'scale',
            buttons: {
                confirm: {
                    text: 'Yes',
                    btnClass: 'btn-blue',
                    action: confirmCb
                },
                cancel: {
                    text: 'No',
                    btnClass: 'btn-dark',
                    action: function () {
                        //close popup
                    }
                }
            }
        });
    }
}
