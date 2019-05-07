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
        <li><a id="mystyle" href="/getAdminList">管理员管理</a></li>
        <li class="left-active"><a id="mystyle" href="/getGroupByUserId?id=${(user.id)!}">小组管理</a></li>
        <li><a id="mystyle" href="/getUser">用户管理</a></li>
        <li><a id="mystyle" href="/getOwnMessage?id=${(user.id)!}">个人信息管理</a></li>
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
    <!--小组管理-->
    <div style="padding: 5px 20px;" class="items show">
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
                                        <input type="text" class="form-control" id="groupname"
                                               placeholder="请输入小组名">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button onclick="addGroup(${(user.id)!})" type="button" class="btn btn-primary">
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
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="tbody">
                 <#if group??&&(group?size>0)>
                     <#list group as group>
                        <tr>
                          <td>${group.groupname}</td>
                          <td>
                                  <a href="/toAddGroup?id=${(group.id)!}"><button type="button" class="btn btn-primary btn-xs"
                                      data-target="#primPersonRe">管理小组</button></a>
                              <button type="button" class="btn btn-danger btn-xs delete">删除</button>
                          </td>
                        </tr>
                     </#list>
                 </#if>
                </tbody>
            </table>
        </div>
    </div>
    </div>
    <script>
        function addGroup(id) {
            var groupname=$("#groupname").val();
            $.ajax({
                type:"post",
                dataType:'json',
                url:"/addGroup",
                data:{"groupname":groupname,"creator":id},
                success:function (result) {
                    alert("添加成功")
                    var html='<tr><td>'+groupname+'</td><td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal"\n' +
                            '                                data-target="#primPersonRe">管理小组\n' +
                            '                        </button>\n' +
                            '                        <button type="button" class="btn btn-danger btn-xs delete">删除\n' +
                            '                        </button></td></tr>';
                    $("#tbody").append(html);
                    $('#primPerson').modal('hide');

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