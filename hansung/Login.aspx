<!DOCTYPE html>
<html lang="en">
<head>
    <title>HANSUNG</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%--    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/Assets/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Assets/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Assets/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Assets/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Assets/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Assets/css/util.css">
    <link rel="stylesheet" type="text/css" href="/Assets/css/main.css">
    <!--===============================================================================================-->--%>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/cookie.js"></script>
<%--    <link href="/Assets/css/jquery-confirm.min.css" rel="stylesheet" />--%>
</head>
<body>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="/Assets/images/img-01.png" alt="IMG">
                </div>

                <form class="login100-form validate-form">
                    <span class="login100-form-title">
                        Member Login
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Required">
                        <input class="input100" type="text" id="userid" placeholder="아이디" />
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Required">
                        <input class="input100" type="password" id="pwd" placeholder="비밀번호" />
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="container-login100-form-btn">
                        <button type="button" id="btnLogin"  class="login100-form-btn" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Login">
                            Login
                        </button>
                    </div>

                    <div class="text-center p-t-12">
                        <a class="txt2" href="#">
                            Forgot Username / Password?
                        </a>
                    </div>

                    <div class="text-center p-t-136">
                        <a class="txt2" href="#">
                            Create your Account
                            <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
<%--
    <!--===============================================================================================-->
    <script src="/Assets/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="/Assets/vendor/bootstrap/js/popper.js"></script>
    <script src="/Assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="/Assets/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="/Assets/vendor/tilt/tilt.jquery.min.js"></script>

    <script src="/Assets/js/jquery-confirm.min.js"></script>
    <script src="/Assets/js/lodash.core.min.js"></script>
    <script src="/Assets/js/lodash.fp.min.js"></script>
    <script src="/Assets/js/lodash.min.js"></script>
    <script src="/Assets/js/mapping.fp.js"></script>

    <script src="/Assets/js/ajax-util.js"></script>
    <script src="/Assets/js/progress-bar.js"></script>
    <script src="/Assets/js/message.js"></script>
--%>

    <script>
        $(document).ready(function (e) {
            $('#userid').keypress(function (evt) {
                if (evt.keyCode == 13) {
                    $('#pwd').select();
                }
            });

            $('#pwd').keypress(function (evt) {
                if (evt.keyCode == 13) {
                    fn_search();
                }
            });
            $('#btnLogin').click(function (evt) {
                if ($("#userid").val() == "") {
                    alert("아이디를 입력해주십시요.");
                    return;
                }
                if ($("#pwd").val() == "") {
                    alert("비밀번호를 입력해주십시요.");
                    return;
                }
                var param = JSON.stringify({ userid: $('#userid').val(), pwd: $('#pwd').val() });
                $.ajax({
                    type: "POST",
                    url: "/websvc_common.asmx/login",
                    data: JSON.stringify({param : param}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        var result = JSON.parse(data.d);
                        if (result.code == "OK") {
                            ///alert(getCookie('userid'));
                            location.href = '/default.aspx';
                            return;
                        }
                        else {
                            alert('아이디와 암호를 확인하여주십시요!');
                            location.href = '/login.aspx';
                            return;
                        }
                    },
                    error: function (request, status, error) {
                        //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                        alert("code = " + request.status + " error = " + error); // 실패 시 처리
                    }
                });
            });
        });
        //$('#btnEmployeeLogin').click(function () {
        //    var $this = $(this);
        //    try {
        //        $this.prop('disabled', true);

        //        let username = $('#txtUsername').val();
        //        let password = $('#txtPassword').val();

        //        if (username === undefined || username === '') {
        //            message.error('Please enter your username !');
        //            return;
        //        }
        //        if (password === undefined || password === '') {
        //            message.error('Please enter your password !');
        //            return;
        //        }

        //        $.ajax({
        //            type: ajaxConfig.POST,
        //            contentType: ajaxConfig.contentType,
        //            dataType: ajaxConfig.dataType,
        //            url: '/ServiceApi.asmx/EmployeeLogin',
        //            data: JSON.stringify({ 'username': username, 'password': password })
        //        }).done(function (emp) {
        //            if (emp && emp.d) {
        //                const msg = JSON.parse(emp.d).Message;
        //                if (msg) {
        //                    if (msg.MessageType !== messageType.Success) {
        //                        message.error(msg.MessageContent);
        //                    } else {
        //                        window.location.href = '/';
        //                    }
        //                }
        //            } else {
        //                message.error('ERROR_SERVER_NOT_RESPOND: Server did not respond any results.');
        //            }
        //        }).fail((jqXhr, textStatus, errorThrow) => {
        //            message.error(textStatus + ': ' + errorThrow);
        //        }).always(() => {

        //        });
        //    } catch (err) {
        //        message.error(`ERROR_LOGIN: ${err} !`);
        //    } finally {
        //        $this.prop('disabled', false);
        //    }
        //});

    </script>
    <!--===============================================================================================-->
    <script src="/Assets/js/main.js"></script>

</body>
</html>