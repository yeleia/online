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
    <!--小组管理-->
    <div style="padding: 5px 20px;" class="items show">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">小组名</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="groupname"
                               value="${(group.groupname)!}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">小组名成员</label>
                    <div class="col-sm-9">
                        <table class="table table-bordered table-hover" style="background-color:white;">
                            <thead>
                            <tr>
                                <th>姓名</th>
                                <th>学号</th>
                                <th>性别</th>
                                <th>学院</th>
                                <th>专业</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody">
                                 <#if userVo??&&(userVo?size>0)>
                                     <#list userVo as userVo>
                                     <tr>
                                         <td>${userVo.username}</td>
                                         <td>${userVo.usernumber}</td>
                                         <td>${userVo.sex}</td>
                                         <td>${userVo.campuse}</td>
                                         <td>${userVo.profession}</td>
                                         <td><button type="button" class="btn btn-danger btn-xs delete">移除</button></td>
                                     </tr>
                                     </#list>
                                 </#if>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="checkbox">
                    <label class="col-sm-2 control-label">选择小组成员</label>
                    <div class="col-sm-9">
                         <#if allUser??&&(allUser?size>0)>
                             <#list allUser as users>
                                 <label><input type="checkbox" name="checkbox" id="checkbox" value="${users.id}">${users.username}</label>
                             </#list>
                         </#if>
                    </div>
                </div>
                <button onclick="addGroupUser(${(group.id)!})" style="margin-top: 70px;margin-right:30px " class="btn btn-primary btn-xs">添加小组</button>
            </form>
        </div>
    </div>


    <script>
        function addGroupUser(id) {
            var checkID=[];
            $("input[name='checkbox']:checked").each(function(i){
                checkID[i] = $(this).val();
            });
            var groupname=$("#groupname").val();
            $.ajax({
                type:"post",
                dataType:'json',
                url:"/addGroupUser",
                data:{"groupid":id,"groupname":groupname,"userid":checkID},
                traditional:true,
                success:function (result) {
                    alert("添加成功")
                    var html='';
                    for(var i in result) {
                        html += '<tr><td>' +result[i].username+'</td><td>'+result[i].usernumber+'</td><td>'+result[i].sex+'</td><td>'+result[i].campuse+'</td><td>'+result.profession+'</td><td><button type="button" class="btn btn-danger btn-xs delete">移除</button></td></tr>';
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