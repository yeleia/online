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
        <li class="left-active"><a id="mystyle" href="javascript:void(0);">小组管理</a></li>
        <li><a id="mystyle" href="javascript:void(0);">用户管理</a></li>
        <li><a id="mystyle" href="javascript:void(0);">文档管理</a></li>
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
                               aria-expanded="false">test<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:signOut();">退出登录</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <!--小组管理-->
    <div style="padding: 5px 20px;" class="items">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <!-- 触发模态框 -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#primPerson">添加小组</button>
        </div>
        <!-- 成绩录入的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="primPerson" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                添加小组
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">小组名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入小组名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">小组成员</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>温江校区</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- 成绩更新的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="primPersonRe" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                小组信息更新
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">小组名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入小组名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">小组成员</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>温江校区</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>小组</th>
                    <th style="width: 60%">成员</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#--<tr>
                    <td></td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                data-target="#primPersonRe">更新
                        </button>
                        <button type="button" class="btn btn-danger btn-xs delete">删除
                        </button>
                    </td>
                </tr>-->
                </tbody>
            </table>
        </div>
        <!--分页框-->
        <#--<div class="col-xs-12 col-sm-12 col-md-12">
            <div class=" pagination" style="display: flex;">
            </div>
        </div>-->
    </div>
    <!--用户管理-->
    <div style="padding: 5px 20px;" class="items">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#primGroup">添加用户</button>
        </div>
        <!-- 成绩录入的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="primGroup" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                添加用户
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入姓名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">账号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入账号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入性别">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入学院">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入专业">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- 成绩更新的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="primGroupRe" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                用户信息更新
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入姓名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">账号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入账号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入性别">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入学院">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_name"
                                               placeholder="请输入专业">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>账号</th>
                    <th>密码</th>
                    <th>性别</th>
                    <th>学院</th>
                    <th>专业</th>
                    <th>操作</th>

                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                data-target="#primGroupRe">更新
                        </button>
                        <button type="button" class="btn btn-danger btn-xs  delete">删除
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--分页框-->
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class=" pagination" style="display: flex;">
            </div>
        </div>

    </div>
    <!--文档管理-->
    <!-- 点击文档管理弹出选择小组-->
    <div style="padding: 5px 20px;" class="items">
        <!--编辑框-->
        <#--<div style="width: 60%;background: #0000cc;float: left">
            dd
        </div>
        <!--聊天框&ndash;&gt;
        <div style="width: 35%;background: #2b542c;float: right">
            ab
        </div>-->
        <div style="width: 40%;height: auto;border: #0f0f0f; ">
            <font style="font-size:20px;font-style: normal;color: #777">选择分享的团队或者个人</font>
        </div>
        <div style="width: 20%;float: left">
            <div class="radio">
                <label>
                    <input type="radio" aria-selected="true"  name="optionsRadios" id="optionsRadios1" value="option1" checked> 团队
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">个人
                </label>
            </div>
        </div>
        <!--加载团队和个人-->
        <div style="width: 60%; float: left;background: #1b6d85">
            加载团队和个人列表
        </div>

    </div>
    <!--文档版本-->
    <div style="padding: 5px 20px;" class="items">
        文档版本
    </div>

</div>
<!-- Small modal -->
<div class="modal fade bs-example-modal-sm" id="mySmallModal" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="mySmallModalLabel">信息</h4>
            </div>
            <div class="modal-body">
                是否确认退出
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary btn-sm" id="smallModalSure">确认</button>
            </div>
        </div>
    </div>
</div>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${request.contextPath}/static/js/jquery-confirm.min.js"></script>
<script src="${request.contextPath}/static/paging/js/jquery.pagination.min.js"></script>
<script src="${request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${request.contextPath}/static/js/global.js"></script>
<script src="${request.contextPath}/static/js/index.js"></script>

</body>

</html>