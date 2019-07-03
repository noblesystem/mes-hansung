<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page9-1.aspx.cs" Inherits="hansung.page9.page9_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <b>Menu Action Permission</b>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div id="btnAddNew"></div>

                                <div id="btnUpdate"></div>

                                <div id="btnDelete"></div>
                            </div>
                            <div class="col-md-2">
                                <br />
                            </div>
                            <div class="col-md-4">
                                <div id="gridBoxEmployee"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div id="dataGridPermission"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="popupMenuActionPermissionCu">
        <div data-options="dxTemplate: { name: 'addNewTitle' }">
            <b>Add New</b>
        </div>

        <div data-options="dxTemplate: { name: 'updateTitle' }">
            <b>Update</b>
        </div>

        <div data-options="dxTemplate: { name: 'content' }">

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="gridBoxMenu">Menu <span style="color: red">(*)</span></label>
                        <div id="gridBoxMenu"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div id="chkAllowRetrieve"></div>
                </div>
           
                <div class="col-md-6">
                    <div id="chkAllowCreate"></div>   
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div id="chkAllowUpdate"></div>   
                </div>
      
                <div class="col-md-6">
                    <div id="chkAllowDelete"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div id="chkAllowUpload"></div>
                </div>
                <div class="col-md-6">
                    <div id="chkAllowPrint"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div id="chkAllowExport"></div>
                </div>
                <div class="col-md-6">
                    <div id="chkAll"></div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 text-center" >
                    <div id="btnSave"></div>
                    <div id="btnClose"></div>
                </div>
            </div>
        </div>
    </div>
    <script>

        $(document).ready(function () {

            $("#btnSave").dxButton({
                stylingMode: "contained",
                text: "Save",
                type: "default"
            });

            $("#btnClose").dxButton({
                stylingMode: "contained",
                text: "Close",
                type: "danger"

            });

            $("#chkAllowRetrieve").dxCheckBox({
                text: "Allow Retrieve",
                value: false,
                disabled: false
            });

            $("#chkAllowCreate").dxCheckBox({
                text: "Allow Add New",
                value: false
            });

            $("#chkAllowUpdate").dxCheckBox({
                text: "Allow Update",
                value: false
            });

            $("#chkAllowDelete").dxCheckBox({
                text: "Allow Delete",
                value: false
            });

            $("#chkAllowUpload").dxCheckBox({
                text: "Allow Upload",
                value: false
            });

            $("#chkAllowPrint").dxCheckBox({
                text: "Allow Print",
                value: false
            });
            
            $("#chkAllowExport").dxCheckBox({
                text: "Allow Export",
                value: false
            });

            $("#chkAll").dxCheckBox({
                text: "All(check/uncheck)",
                value: false
            });


            var makeAsyncMenuDataSource = function () {
                return new DevExpress.data.CustomStore({
                    loadMode: "raw",
                    key: "Id",
                    load: function (loadOptions) {
                        var d = $.Deferred();
                        $.ajax({
                            type: ajaxConfig.GET,
                            contentType: ajaxConfig.contentType,
                            dataType: ajaxConfig.dataType,
                            url: '/ServiceApi.asmx/GetAvailableMenus'
                        }).done(function (emp) {
                            if (emp && emp.d)
                                d.resolve(emp.d);
                            else
                                d.resolve(null);
                        });
                        return d.promise();
                    }
                });
            };

            var getMenuActionPermissionsByEmpId = function (empId) {
                if (!empId || empId <= 0) {
                    return {};
                } else {
                    var d = $.Deferred();
                    $.ajax({
                        type: ajaxConfig.POST,
                        contentType: ajaxConfig.contentType,
                        dataType: ajaxConfig.dataType,
                        url: '/ServiceApi.asmx/GetMenuActionPermissionsByEmpId',
                        data: JSON.stringify({ 'empId': empId })
                    }).done(function (permission) {
                        if (permission && permission.d)
                            d.resolve(permission.d);
                        else
                            d.resolve({});
                    });
                    return d.promise();
                }
            };

            var dataGridPermission = $("#dataGridPermission").dxDataGrid({
                columns: [
                    { dataField: "EmpId", caption: "EmpId", visible: false },
                    { dataField: "MenuId", caption: "MenuId", visible: false },
                    { dataField: "MenuGroup.Description", caption: "Group Name", groupIndex: 0 },
                    { dataField: "Menu.Description", caption: "Menu Name" },
                    { dataField: "IsAllowRetrieve", caption: "Allow Retrieve" },
                    { dataField: "IsAllowCreate", caption: "Allow Create" },
                    { dataField: "IsAllowUpdate", caption: "Allow Update" },
                    { dataField: "IsAllowDelete", caption: "Allow Delete" },
                    { dataField: "IsAllowUpload", caption: "Allow Upload" },
                    { dataField: "IsAllowPrint", caption: "Allow Print" },
                    { dataField: "IsAllowExport", caption: "Allow Export" }
                ],
                keyExpr: "id",
                columnAutoWidth: true,
                searchPanel: {
                    highlightCaseSensitive: false,
                    highlightSearchText: true,
                    placeholder: "Search...",
                    searchVisibleColumnsOnly: false,
                    text: "",
                    visible: true,
                    width: 240
                },
                loadPanel: {
                    enabled: true,
                    height: 100,
                    width: 250,
                    indicatorSrc: "https://js.devexpress.com/Content/data/loadingIcons/rolling.svg"
                },
                showBorders: true,
                showRowLines: true,
                showColumnLines: true,
                paging: { pageSize: 10 },
                pager: {
                    showPageSizeSelector: true,
                    allowedPageSizes: [5, 10, 20],
                    showInfo: true
                },
                headerFilter: {
                    visible: true,
                    allowSearch: true
                },
                selection: { mode: "single" },
                filterRow: { visible: true },
                allowColumnReordering: true,
                allowColumnResizing: false,
                hoverStateEnabled: true,
                "export": {
                    enabled: true,
                    fileName: "Menu Action Permission",
                    allowExportSelectedData: true
                },
                groupPanel: {
                    visible: true
                },
                onContentReady: function (e) { e.component.option("loadPanel.enabled", false); },
                onCellPrepared: function (e) {
                    if (e && e.rowType === 'header') {
                        e.cellElement.css('font-weight', 'bold');
                    }
                },
                focusedRowEnabled: true,
                columnChooser: {
                    enabled: true,
                    mode: "select"
                }
            }).dxDataGrid(devExtremeOptions.instance);

            var loadDataGrid = function (empId) {
                if (empId && empId > 0) {
                    const dataSourceAsync = getMenuActionPermissionsByEmpId(empId);
                    if (dataSourceAsync != null) {
                        dataSourceAsync.done(function (res) {
                            const dataSource = {
                                store: {
                                    type: 'array',
                                    key: ['EmpId', 'MenuId'],
                                    data: res
                                }
                            };

                            dataGridPermission.option({
                                dataSource: dataSource
                            });
                        });
                    }
                }
            };

            var gridBoxMenu = $("#gridBoxMenu").dxDropDownBox({
                keyExpr: "Id",
                deferRendering: false,
                placeholder: "Select menu...",
                displayExpr: function (m) {
                    return m && `${m.Description} < ${m.Href} >`;
                },
                showClearButton: true,
                dataSource: makeAsyncMenuDataSource(),
                contentTemplate: function (e) {
                    const value = e.component.option("value"),
                        $dataGrid = $("<div>").dxDataGrid({
                            dataSource: e.component.option("dataSource"),
                            columns: [
                                //{ dataField: "MenuCode", caption: "Menu Code" },
                                { dataField: "Description", caption: "Menu Name" },
                                { dataField: "Href", caption: "Href" }
                            ],
                            hoverStateEnabled: true,
                            paging: { enabled: true, pageSize: 10 },
                            filterRow: { visible: true },
                            scrolling: { mode: "infinite" },
                            selection: { mode: "single" },
                            selectedRowKeys: [value],
                            height: "100%",
                            onSelectionChanged: function (selectedItems) {
                                const keys = selectedItems.selectedRowKeys,
                                    hasSelection = keys.length;

                                const selectedValue = hasSelection ? keys[0] : null;
                                e.component.option("value", hasSelection ? keys[0] : selectedValue);
                                e.component.close();
                            }
                        }),
                    dataGrid = $dataGrid.dxDataGrid(devExtremeOptions.instance);
                    e.component.on("valueChanged", function (args) {
                        dataGrid.selectRows(args.value, false);
                    });
                    return $dataGrid;
                }
            }).dxDropDownBox(devExtremeOptions.instance);

            var popupMenuActionPermissionCu = $("#popupMenuActionPermissionCu").dxPopup({
                visible: false,
                maxHeight: '360px',
                maxWidth: '350px',
                showCloseButton: true
            }).dxPopup(devExtremeOptions.instance);

            var onShowPopupMenuActionPermissionCu = function (action, empId, menuId) {
                if (!IsCrud(action) || empId <= 0) return;

                //popupMenuActionPermissionCu.option('titleTemplate', menuId <= 0 ? 'addNewTitle' : 'updateTitle');
                popupMenuActionPermissionCu.show();
            };

            DevExpress.ui.dxOverlay.baseZIndex(2000);

            var makeAsyncPermissionDataSource = function () {
                return new DevExpress.data.CustomStore({
                    loadMode: "raw",
                    key: "id",
                    load: function (loadOptions) {
                        var d = $.Deferred();
                        $.ajax({
                            type: ajaxConfig.GET,
                            contentType: ajaxConfig.contentType,
                            dataType: ajaxConfig.dataType,
                            url: '/ServiceApi.asmx/GetAvailableEmployees'
                        }).done(function (emp) {
                            if (emp && emp.d)
                                d.resolve(emp.d);
                            else
                                d.resolve(null);
                        });
                        return d.promise();
                    }
                });
            };

            var gridBoxEmployee = $("#gridBoxEmployee").dxDropDownBox({
                keyExpr: "id",
                deferRendering: false,
                placeholder: "Select employee...",
                displayExpr: function (e) {
                    return e && `${e.employeecode} < ${e.name} >`;
                },
                showClearButton: true,
                dataSource: makeAsyncPermissionDataSource(),
                contentTemplate: function (e) {
                    const value = e.component.option("value"),
                        $dataGrid = $("<div>").dxDataGrid({
                            dataSource: e.component.option("dataSource"),
                            columns: [
                                { dataField: "employeecode", caption: "Employee Code" },
                                { dataField: "name", caption: "Employee Name" }
                            ],
                            hoverStateEnabled: true,
                            paging: { enabled: true, pageSize: 10 },
                            filterRow: { visible: true },
                            scrolling: { mode: "infinite" },
                            selection: { mode: "single" },
                            selectedRowKeys: [value],
                            height: "100%",
                            onSelectionChanged: function (selectedItems) {
                                const keys = selectedItems.selectedRowKeys,
                                    hasSelection = keys.length;

                                const selectedValue = hasSelection ? keys[0] : null;
                                e.component.option("value", hasSelection ? keys[0] : selectedValue);
                                e.component.close();

                                loadDataGrid(selectedValue);
                            }
                        }),
                    dataGrid = $dataGrid.dxDataGrid(devExtremeOptions.instance);
                    e.component.on("valueChanged", function (args) {
                        dataGrid.selectRows(args.value, false);
                    });
                    return $dataGrid;
                }
            }).dxDropDownBox(devExtremeOptions.instance);

            $("#btnAddNew").dxButton({
                stylingMode: "contained",
                text: "Add New",
                type: "success",
                width: 100,
                onClick: function () {
                    const selectedEmployeeId = gridBoxEmployee.option(devExtremeOptions.value);
                    if (!selectedEmployeeId) {
                        message.error('Please select employee to grant permission !');
                        return;
                    }
                    onShowPopupMenuActionPermissionCu(CRUD.C, selectedEmployeeId, 0);
                }
            });

            $("#btnUpdate").dxButton({
                stylingMode: "contained",
                text: "Update",
                type: "default",
                onClick: function () {
                    alert("btnAddNew was clicked");
                }
            });

            $("#btnDelete").dxButton({
                stylingMode: "contained",
                text: "Delete",
                type: "danger",
                onClick: function () {
                    alert("btnAddNew was clicked");
                }
            });

        });
    </script>
</asp:Content>
