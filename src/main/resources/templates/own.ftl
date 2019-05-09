<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <title>在线系统后台管理</title>
    <link rel="stylesheet" href="${request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/paging/css/jquery.pagination.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/jquery-confirm.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/global.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/index.css">
    <style>
        #mystyle{
            margin-left: 25%;
        }
        th{
            text-align: center;
            color: #182350;
        }
        td{
            text-align: center;
        }
        .table{
            position: relative;
        }
        #ret{
            position: absolute;
            bottom:0;
        }
    </style>
</head>

<body>
<!-- 左边导航栏 -->
<div class="left-nav">
    <div align="center" style="color:#ffffff;margin-top: 20px;">
        <h3>在线系统</h3>
        <hr style="height: 2px;box-shadow: 1px 1px 5px #888888;background-color: #032A33; width: 90%">
    </div>
    <ul class="left-list">
        <li><a id="mystyle" href="">管理员管理</a></li>
        <li><a id="mystyle" href="/getGroupByUserId?id=${(user.id)!}">小组管理</a></li>
        <li><a id="mystyle" href="/getUser">用户管理</a></li>
        <li class="left-active"><a id="mystyle" href="/getOwnMessage?id=${(user.id)!}">个人信息管理</a></li></li>
        <li><a id="mystyle" href="/getAllDoc?id=${(user.id)!}">文档管理</a></li>
        <li><a id="mystyle" href="javascript:void(0);">文档版本</a></li>
    </ul>
</div>

<!-- 右边内容主体 -->
<div class="main-body">
    <div>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1"
                            aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand">在线系统后台管理</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">${(user.username)!}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:signOut();">退出登录</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <!--管理员管理-->
    <div style="padding: 5px 20px;" class="items show">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">名字</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username"
                               value="${(user.username)!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="col-sm-2 control-label">学号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="usernumber"
                               value="${(user.usernumber)!}" disabled="true">
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="userpass"
                               value="${(user.userpass)!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="sex"
                               value="${user.sex}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">学院</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="campuse"
                               value="${user.campuse}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstname" class="col-sm-2 control-label">名字</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="profession"
                               value="${user.profession}">
                    </div>
                </div>
                <input type="hidden" value="${user.id}" id="userId">
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" onclick="saveOwn()" class="btn btn-default">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>



</div>
    <script>
        function saveOwn() {
            var username=$("#username").val();
            var usernumber=$("#usernumber").val();
            var userpass=$("#userpass").val();
            var sex=$("#sex").val();
            var campuse=$("#campuse").val();
            var profession=$("#profession").val();
            var id=$("#userId").val();
            $.ajax({
                type:"post",
                dataType:'json',
                url:"/saveOwn",
                data:{"id":id,"userpass":userpass,"usernumber":usernumber,"username":username,"sex":sex,"campuse":campuse,"profession":profession},
                success:function (result) {
                    alert("修改成功")
                    window.location.href="/getOwnMessage?id="+id;
                }
            })
        }
    </script>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${request.contextPath}/static/js/jquery-confirm.min.js"></script>
<script src="${request.contextPath}/static/paging/js/jquery.pagination.min.js"></script>
<script src="${request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${request.contextPath}/static/js/global.js"></script>
<script src="${request.contextPath}/static/js/index.js"></script>

</body>

</html>