<!DOCTYPE html>
<html lang="en">
<head>
    <title>测试websocket</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css">
</head>
<body>
<div class="container">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupSelect01">用户</label>
        </div>
        <select class="custom-select" id="inputGroupSelect01">
            <option selected>选择一个...</option>
        </select>
    </div>
    <div class="input-group mb-3">
        <input type="text" class="form-control">
        <div class="input-group-append">
            <span class="input-group-text" id="btn1">发送给所有人</span>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="text" class="form-control">
        <div class="input-group-append">
            <span class="input-group-text" id="btn2">发送给单人</span>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
<script language=javascript>
    $(function () {
        var websocket;
        if ('WebSocket' in window) {
            console.log("WebSocket");
            websocket = new WebSocket("ws://localhost:8080/echo");
        } else if ('MozWebSocket' in window) {
            console.log("MozWebSocket");
            websocket = new MozWebSocket("ws://echo");
        } else {
            console.log("SockJS");
            websocket = new SockJS("http://127.0.0.1:8080/sockjs/echo");
        }
        websocket.onopen = function (evnt) {
            console.log("链接服务器成功!", evnt.data);
        };
        websocket.onmessage = function (evnt) {
            console.log('收到消息:', evnt.data);
            var json = JSON.parse(evnt.data);
            if (json.hasOwnProperty('users')) {
                var users = json.users;
                for (var i = 0; i < users.length; i++) {
                    $("#inputGroupSelect01").append('<option value="' + users[i] + '">' + users[i] + '</option>');
                }
            } else {
                //打印消息
                toast(json.msg, 'info')
            }
        };
        websocket.onerror = function (evnt) {
        };
        websocket.onclose = function (evnt) {
            console.log("与服务器断开了链接!")
        }
        $('#btn2').bind('click', function () {
            if (websocket != null) {
                //根据勾选的人数确定是群聊还是单聊
                var value = $(this).parent().parent().find('input').val();
                //得到选择的用户
                var name = $("#inputGroupSelect01").find("option:selected").val();
                console.log('选中的用户', name);
                if (name === '选择一个...') {
                    toast('请选择一个用户', 'warning')
                } else {
                    var object = {
                        to: name,
                        msg: value,
                        type: 2
                    };
                    //将object转成json字符串发送给服务端
                    var json = JSON.stringify(object);
                    websocket.send(json);
                }
            } else {
                console.log('未与服务器链接.');
            }
        });
        $('#btn1').bind('click', function () {
            if (websocket != null) {
                //根据勾选的人数确定是群聊还是单聊
                var value = $(this).parent().parent().find('input').val();
                var object = {
                    msg: value,
                    type: 1
                };
                //将object转成json字符串发送给服务端
                var json = JSON.stringify(object);
                websocket.send(json);
            } else {
                console.log('未与服务器链接.');
            }
        });
    })

    function toast(text, icon) {
        $.toast({
            text: text,
            heading: '新消息',
            icon: icon,
            showHideTransition: 'slide',
            allowToastClose: true,
            hideAfter: 3000,
            stack: 5,
            position: 'top-right',

            bgColor: '#444444',
            textColor: '#eeeeee',
            textAlign: 'left',
            loader: true,
            loaderBg: '#006eff'
        });
    }
</script>
</body>
</html>