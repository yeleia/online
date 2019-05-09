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
        <li><a id="mystyle" href="/getOwnMessage?id=${(user.id)!}">个人信息管理</a></li></li>
        <li  class="left-active"><a id="mystyle" href="/getAllDoc?id=${(user.id)!}">文档管理</a></li>
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
            <span>加入小组文档</span>
            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                新增文档
            </button>
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>文档名</th>
                    <th>团队名</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="tbody">
                <#if groupDoc??&&(groupDoc?size>0)>
                <#list groupDoc as groupDoc>
                <tr>
                    <td>
                        ${groupDoc.docname}
                    </td>
                    <td>
                        ${groupDoc.groupName}
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs">在线编辑</button>
                        <button type="button" class="btn btn-primary btn-blue">预览</button>
                        <button type="button" class="btn btn-danger btn-xs delete">下载</button>
                    </td>
                </tr>
                </#list>
                <#else>
                </#if>
                </tbody>
            </table>
            <span>个人文档</span>
            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                新增文档
            </button>
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>文档名</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="tbody">
                <#if groupDoc??&&(groupDoc?size>0)>
                <#list groupDoc as groupDoc>
                <tr>
                    <td>
                        ${groupDoc.docname}
                    </td>
                    <td>
                        ${groupDoc.groupName}
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs">在线编辑</button>
                        <button type="button" class="btn btn-primary btn-blue">预览</button>
                        <button type="button" class="btn btn-danger btn-xs delete">下载</button>
                    </td>
                </tr>
                </#list>
                <#else>
                </#if>
                </tbody>
            </table>
        </div>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            新增文档
                        </h4>
                    </div>
                    <div class="modal-body">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> 从本地导入
                                    <input type="file">
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">新建
                                </label>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary">
                            保存
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
    </div>
</div>
    <script>
        function saveOwn() {
            var username=$("#stuname").val();
            var userpass=$("#stupass").val();
            var sex=$("#stusex").val();
            var campuse=$("#stucampuse").val();
            var profession=$("#stuprefession").val();
            var id=$("#userId").val();
            $.ajax({
                type:"post",
                dataType:'json',
                url:"/saveOwn",
                data:{"id":id,"userpass":userpass,"username":username,"sex":sex,"campuse":campuse,"profession":profession},
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