var ajaxConfig = {
    contentType: 'application/json; charset=utf-8',
    POST: 'POST',
    GET: 'GET',
    DELETE: 'DELETE',
    dataType: 'json'
}

//Just use for json request
var ajax = {
    action: function (type, url, data) {
    //Return async promise
        return $.ajax({
            type: type,
            contentType: ajaxConfig.contentType,
            url: url,
            data: JSON.stringify(data)
        });
    },
    post: function (url, data) {
        let a = this.action(ajaxConfig.POST, url, data);
        return a;
    },
    get: function (url, data) {
        return this.action(ajaxConfig.GET, url, data);
    },
    delete: function (url, data) {
        return this.action(ajaxConfig.DELETE, url, data);
    }
}