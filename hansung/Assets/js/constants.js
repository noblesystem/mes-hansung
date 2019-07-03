var devExtremeOptions = {
    value: 'value',
    instance: 'instance',
    disabled: 'disabled',
    selectedItem: 'selectedItem'
};

var CRUD = {
    C: 'C',
    R: 'R',
    U: 'U',
    D: 'D'
};

var IsCrud = function (action) {
    return CRUD.C === action
        || CRUD.R === action
        || CRUD.U === action
        || CRUD.D === action;
}