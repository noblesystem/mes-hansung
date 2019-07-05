var progressBarConfig = {
    //elementName: 'div',
    //tagId: 'loadpanel',
    //position: 'container',
    //message: 'Loading...',
    //height: null,
    //width: null
};

var progressBarMessage = {
    //saving: 'Đang lưu dữ liệu...',
    //loading: 'Đang tải dữ liệu...',
    //deleting: 'Đang xóa dữ liệu...',
    //colleating: 'Đang đối chiếu tờ khai...',
    //checking: 'Đang kiểm tra dữ liệu...'
};

var progressBar = {
    create: function () {
        var elements = document.getElementsByClassName('jconfirm');
        while (elements.length) elements[0].parentNode.removeChild(elements[0]);

        const div = document.createElement(progressBarConfig.elementName);
        div.id = progressBarConfig.tagId;
        div.className = progressBarConfig.tagId;
        document.body.appendChild(div);
    },
    remove: function (instance) {
        const element = document.getElementById(progressBarConfig.tagId);
        if (element) {
            element.parentNode.removeChild(element);
        }
        if (instance /*hide*/) {
            try {
                instance.hide();
            } catch (e) {
                console.log('hide: ' + e);
            }
        }
        if (instance /*dispose & remove*/) {
            try {
                $('#' + progressBarConfig.tagId).dxLoadPanel("dispose");
                $('#' + progressBarConfig.tagId).remove();
                instance = null;
            } catch (e) {
                console.log('remove: ' + e);
            }
        }
    },
    getInstance: function (options) {
        this.create();
        const settings = $.extend({
            name: progressBarConfig.tagId,
            position: progressBarConfig.position,
            message: progressBarConfig.message,
            height: progressBarConfig.height,
            width: progressBarConfig.width
        }, options);

        return $('.' + settings.name).dxLoadPanel({
            position: { of: '#' + settings.position },
            visible: false,
            showIndicator: true,
            showPane: true,
            shading: true,
            height: settings.height,
            width: settings.width,
            closeOnOutsideClick: false,
            message: settings.message
        }).dxLoadPanel("instance");
    },
    show: function (options, onShown) {
        const instance = this.getInstance(options);
        if (instance) {
            instance.on('shown', onShown);
        }
        instance.show();
        return instance;
    },
    hide: function (instance) {
        this.remove(instance);
    }
};




