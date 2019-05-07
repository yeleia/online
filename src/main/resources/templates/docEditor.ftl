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
    <style>
        #container{
            height:80%;

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
            background: plum;
        }
        .title{
            width: 100%;
            height: 120px;
            background: #a8a9a0;
            text-align: center;
        }
    </style>

</head>
<body>

<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${request.contextPath}/static/js/jquery-confirm.min.js"></script>
<script src="${request.contextPath}/static/paging/js/jquery.pagination.min.js"></script>
<script src="${request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<div class="container">
    <div class="left">
        <div style="margin-bottom: 5px">
            文档名：<input>
        </div>
        <!-- 加载编辑器的容器 -->
        <script id="container" name="content" type="text/plain">

        </script>
        <div style="position:relative">
            <button style="position:absolute;left:90%">保存</button>
        </div>
        <!-- 实例化编辑器 -->
        <script type="text/javascript" style="width:100%;height:300px;">
            var ue = UE.getEditor('container').setHeight(300);
        </script>

    </div>
    <div class="right">
        <div class="title">聊天室</div>
        <div class="chat">聊天....?</div>
    </div>
</div>
</body>
</html>