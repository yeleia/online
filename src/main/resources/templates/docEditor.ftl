<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/paging/css/jquery.pagination.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/jquery-confirm.min.css">
    <script type="text/javascript" src="${request.contextPath}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/ueditor/ueditor.all.js"></script>
    <script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${request.contextPath}/static/js/jquery-confirm.min.js"></script>
    <script src="${request.contextPath}/static/paging/js/jquery.pagination.min.js"></script>
    <script src="${request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        #container{
            height:70%;

        }
        #edui1_iframeholder{
            height: 150px;
        }
        .container{
            width:100%;
            padding-left: 0px;
            margin-left: 0px;
        }
        .left{
            margin-left: 10px;
            margin-top: 30px;
            position: fixed;
            width:65%;
            top:0px;
            left:0px;
            height: 100%;
            background: #FFFFFF;
        }
       .right{
            position: fixed;
            width:30%;
            left:70%;
            height: 100%;
            background: #f2fcff;
        }
        .title{
            width: 100%;
            height: 40px;
            background: #f3f5ee;
            text-align: center;

        }
    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <button onclick="javascript:history.go(-1)">返回</button>
        <div style="margin-bottom: 10px;margin-top: 10px">
            文档名：<input type="text" value="${(doc.docname)!}">
        </div>
        <!-- 加载编辑器的容器 -->
        <textarea id="container"  name="content" type="text/plain">
                ${(doc.content)!}
        </textarea>
        <div style="position:relative">
            <button onclick="sendDoc()" style="position:absolute;left:90%">保存</button>
        </div>
    </div>
    <div class="right">
        <div class="title">
            <h2>聊天室</h2>
        </div>
        <div class="chat" style="height: 450px;border:1px solid #c3c3c3">
            <input type="hidden" value="${(user.username)!}" id="nickname">
            <input type="button" value="开始讨论" id="btnClick1"><br>
            <div id="resultDiv" style="width: 350px;height: 400px">
            </div>
            <div style="margin-left:70px;position:absolute;bottom:60px">
                <input type="text" id="msg"><button onclick="btnClick2()" id="btnClick2">发送</button>
            </div>
        </div>
    </div>
</div>
<script>
    var webSocket;
    function btnClick2() {
        var msg = $("#msg").val();
        $("#msg").val('');
        webSocket.send(msg)
    };
    function sendDoc(){
        var msg=$("#container").val();
        webSocket.send(msg);
    }
    $("#btnClick1").click(function () {
        var nickname = $("#nickname").val();
       /* if(nickname==null||nickname=='') {
            alert("必须输入昵称");
            return;
        }*/
       /* $(this).attr("disabled", "disabled");*/
        webSocket = new WebSocket("ws://localhost:8080/myws2/"+nickname);

        webSocket.onopen = function (event) {
            /*$("#resultDiv").append("<p>连接成功！</p>");*/
        }
        webSocket.onerror = function (event) {
            $("#resultDiv").append("<p>onerrors:" + event.data + "</p>");
        }
        webSocket.onmessage = function (event) {
            $("#resultDiv").append("<p>" + event.data + "</p>");
        }
    });
</script>
<!-- 实例化编辑器 -->
<script type="text/javascript" style="width:100%;height:300px;">
    var ue = UE.getEditor('container').setHeight(300);
</script>


</body>
</html>