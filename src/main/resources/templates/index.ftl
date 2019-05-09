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
        <li class="left-active"><a id="mystyle" href="">管理员管理</a></li>
        <li><a id="mystyle" href="/getGroupByUserId?id=${(user.id)!}">小组管理</a></li>
        <li><a id="mystyle" href="/getUser">用户管理</a></li>
        <li><a id="mystyle" href="/getOwnMessage?id=${(user.id)!}">个人信息管理</a></li>
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
            <!-- 触发模态框 -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#primPerson">添加管理员</button>
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
                                管理员信息录入
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="stuname"
                                               placeholder="请输入姓名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">账号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="stunumber" value=""
                                               placeholder="请输入学号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="stupass" value=""
                                               placeholder="请输入密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="stusex" value=""
                                               placeholder="请输入性别">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="stucampuse" value=""
                                               placeholder="请输入学院">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="stuprefession" value=""
                                               placeholder="请输入专业">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="add()" class="btn btn-primary">
                                保存
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <span></span>
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
                <tbody id="tbody">
                <#if users??&&(users?size>0)>
                <#list users as user>
                <tr>
                    <td>
                        ${user.username}
                    </td>
                    <td>
                        ${user.usernumber}
                    </td>
                    <td>
                        ${user.userpass}
                    </td>
                    <td>
                        ${user.sex}
                    </td>
                    <td>
                        ${user.campuse}
                    </td>
                    <td>
                        ${user.profession}
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                data-target="#primPersonRe">更新
                        </button>
                        <button type="button" onclick="deleteAd(${user.id})" class="btn btn-danger btn-xs delete">删除
                        </button>
                    </td>
                </tr>
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
                                          管理员信息更新
                                      </h4>
                                  </div>
                                  <div class="modal-body">
                                      <form class="form-horizontal" role="form">
                                          <div class="form-group">
                                              <label class="col-sm-2 control-label">姓名</label>
                                              <div class="col-sm-9">
                                                  <input type="text" value="${user.username}"  class="form-control" id="username"
                                                         placeholder="请输入姓名">
                                              </div>
                                          </div>
                                          <div class="form-group">
                                              <label class="col-sm-2 control-label">账号</label>
                                              <div class="col-sm-9">
                                                  <input type="text"  value="${user.usernumber}" class="form-control" id="usernumber"
                                                         placeholder="请输入学号">
                                              </div>
                                          </div>
                                          <div class="form-group">
                                              <label class="col-sm-2 control-label">密码</label>
                                              <div class="col-sm-9">
                                                  <input type="text" value="${user.userpass}" class="form-control" id="userpass"
                                                         placeholder="请输入密码">
                                              </div>
                                          </div>
                                          <div class="form-group">
                                              <label class="col-sm-2 control-label">性别</label>
                                              <div class="col-sm-9">
                                                  <input type="text"  class="form-control" id="sex" value="${user.sex}"
                                                         placeholder="请输入性别">
                                              </div>
                                          </div>
                                          <div class="form-group">
                                              <label class="col-sm-2 control-label">学院</label>
                                              <div class="col-sm-9">
                                                  <input type="text" class="form-control" id="campuse" value="${user.campuse}"
                                                         placeholder="请输入学院">
                                              </div>
                                          </div>
                                          <div class="form-group">
                                              <label class="col-sm-2 control-label">专业</label>
                                              <div class="col-sm-9">
                                                  <input type="text" class="form-control" id="profession" value="${user.profession}"
                                                         placeholder="请输入专业">
                                              </div>
                                          </div>
                                      </form>
                                  </div>
                                  <div class="modal-footer">
                                      <button type="button" onclick="updateSave(${user.id})" class="btn btn-primary">
                                          保存更新
                                      </button>
                                      <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                      </button>
                                      <span> </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </form>
                </#list>
                <#else>
                </#if>
                </tbody>
            </table>
        </div>
        <!--分页框-->
       <#-- <div class="col-xs-12 col-sm-12 col-md-12">
            <div class=" pagination" style="display: flex;">
            </div>
        </div>-->

    </div>



</div>
    <script>
        function add() {
            var username=$("#stuname").val();
            var usernumber=$("#stunumber").val();
            var userpass=$("#stupass").val();
            var sex=$("#stusex").val();
            var campuse=$("#stucampuse").val();
            var profession=$("#stuprefession").val();
            $.ajax({
                type:"post",
                dataType:'json',
                url:"/addAdmin",
                data:{"usernumber":usernumber,"userpass":userpass,"username":username,"sex":sex,"campuse":campuse,"profession":profession},
                success:function (result) {
                    alert("添加成功")
                    var html='<tr><td>'+username+'</td><td>'+usernumber+'</td><td>'+userpass+'</td><td>'+sex+'</td><td>'+campuse+'</td><td>'+profession+'</td><td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal"\n' +
                            '                                data-target="#primPersonRe">更新\n' +
                            '                        </button>\n' +
                            '                        <button type="button" class="btn btn-danger btn-xs delete">删除\n' +
                            '                        </button></td></tr>';
                    $("#tbody").append(html);
                    $('#primPerson').modal('hide');

                }
            })
        }
        function updateSave(id) {
            alert("ad")
            var username=$("#username").val();
            var usernumber=$("#usernumber").val();
            var userpass=$("#userpass").val();
            var sex=$("#sex").val();
            var campuse=$("#campuse").val();
            var profession=$("#profession").val();
            $.ajax({
                type:"post",
                dataType:'json',
                url:"/updateAdmin",
                data:{"id":id,"usernumber":usernumber,"userpass":userpass,"username":username,"sex":sex,"campuse":campuse,"profession":profession},
                success:function (result) {
                    alert("修改成功")
                    $("#tbody").html('');
                    var html='';
                    for(var i in result){
                         html+='<tr><td>'+result[i].username+'</td><td>'+result[i].usernumber+'</td><td>'+result[i].userpass+'</td><td>'+result[i].sex+'</td><td>'+result[i].campuse+'</td><td>'+result[i].profession+'</td><td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal"\n' +
                                '                                data-target="#primPersonRe">更新\n' +
                                '                        </button>\n' +
                                '                        <button type="button" class="btn btn-danger btn-xs delete">删除\n' +
                                '                        </button></td></tr>';
                    }
                    $("#tbody").append(html);
                    $('#primPersonRe').modal('hide');

                }
            })
        }
        function deleteAd(id) {
            $.ajax({
                type:"post",
                dataType:'json',
                url:"/deleteAdmin",
                data:{"id":id},
                success:function (result) {
                    alert("删除成功")
                    $("#tbody").html('');
                    var html='';
                    for(var i in result){
                        html+='<tr><td>'+result[i].username+'</td><td>'+result[i].usernumber+'</td><td>'+result[i].userpass+'</td><td>'+result[i].sex+'</td><td>'+result[i].campuse+'</td><td>'+result[i].profession+'</td><td><button type="button" class="btn btn-primary btn-xs" data-toggle="modal"\n' +
                                '                                data-target="#primPersonRe">更新\n' +
                                '                        </button>\n' +
                                '                        <button type="button" class="btn btn-danger btn-xs delete">删除\n' +
                                '                        </button></td></tr>';
                    }
                    $("#tbody").append(html);

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