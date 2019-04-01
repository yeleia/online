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
    <link rel="stylesheet" href="${request.contextPath}/static/jquery-confirm.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/global.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/index.css">
    <style>
        #mystyle{
            margin-left: 25%;
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
        <li class="left-active"><a id="mystyle" href="javascript:void(0);">管理员管理</a>
        </li>
        <li><a id="mystyle" href="javascript:void(0);">团队管理</a></li>
        <li><a id="mystyle" href="javascript:void(0);">用户管理</a></li>
        <hr>
        <li><a id="mystyle" href=""></a></li>
        <li><a id="mystyle" href="">微赛事管理</a></li>
        <li><a id="mystyle"href="">微赛事报名</a></li>
        <hr>
        <li><a id="mystyle" href="">记录</a></li>
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
                               aria-expanded="false">用户 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:signOut();">退出登录</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <!--校运会-->
    <div style="padding: 5px 20px;" class="items show">
        <blockquote style="padding: 1px 20px;background-color: #FCFCFC">
            <div class="page-header">
                <h3>川农运动赛事——校运会</h3>
            </div>
        </blockquote>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <button type="button" class="btn btn-success">添加新一届运动会</button>
            <button type="button" class="btn btn-warning">修改历史运动会</button>
            <button type="button" class="btn btn-danger">删除历史运动会</button>
        </div>
        <div class="sports-list">
            <div class="col-xs-12 col-sm-4 col-md-4">
                <div class=" sports-box">
                    <a href="../sports.html" target="_blank" class="sports-link">
                        <div class="sports-img"></div>
                        <div class="sports-des">
                            <h3>第39届运动会</h3>
                            <p>这是运动会主题</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!--预赛成绩——单项-->
    <div style="padding: 5px 20px;" class="items">
        <blockquote style="padding: 1px 20px;background-color: #FCFCFC">
            <div class="page-header">
                <h3>预赛成绩——单项</h3>
            </div>
        </blockquote>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <!-- 触发模态框 -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#primPerson">成绩录入</button>
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
                                成绩录入
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
                                    <label class="col-sm-2 control-label">学号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_id" value=""
                                               placeholder="请输入学号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">校区</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>雅安校区</option>
                                            <option>都江堰校区</option>
                                            <option>温江校区</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>信息工程学院</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>物联网工程</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
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
                                成绩更新
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
                                    <label class="col-sm-2 control-label">学号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_id" value=""
                                               placeholder="请输入学号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">校区</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>雅安校区</option>
                                            <option>都江堰校区</option>
                                            <option>温江校区</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>信息工程学院</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>物联网工程</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>学号</th>
                    <th>校区</th>
                    <th>学院</th>
                    <th>专业</th>
                    <th>性别</th>
                    <th>比赛项目</th>
                    <th>成绩</th>
                    <th>加分</th>
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
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                data-target="#primPersonRe">更新
                        </button>
                        <button type="button" class="btn btn-danger btn-xs delete">删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                data-target="#primPersonRe">更新
                        </button>
                        <button type="button" class="btn btn-danger btn-xs delete">删除
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

        <!-- <div class="col-xs-12 col-sm-12 col-md-12 copyright" align="right">&copy; 2018 四川农业大学 Powered by <a href="http://www.wingstudio.org"
            target="_blank" title="前往WingStudio工作室官网">WingStudio</a>
    </div> -->
    </div>
    <!--预赛成绩——团体项-->
    <div style="padding: 5px 20px;" class="items">
        <blockquote style="padding: 1px 20px;background-color: #FCFCFC">
            <div class="page-header">
                <h3>预赛成绩——团体项</h3>
            </div>
        </blockquote>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#primGroup">成绩录入</button>
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
                                成绩录入
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">校区</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>雅安校区</option>
                                            <option>都江堰校区</option>
                                            <option>温江校区</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>信息工程学院</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
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
                                成绩更新
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">校区</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>雅安校区</option>
                                            <option>都江堰校区</option>
                                            <option>温江校区</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>信息工程学院</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>学院</th>
                    <th>比赛项目</th>
                    <th>团队分数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
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
                <tr>
                    <td>2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
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
    <!--决赛成绩——单项-->
    <div style="padding: 5px 20px;" class="items">
        <blockquote style="padding: 1px 20px;background-color: #FCFCFC">
            <div class="page-header">
                <h3>决赛成绩——单项</h3>
            </div>
        </blockquote>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <!-- 触发模态框 -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#finalPerson">成绩录入</button>
        </div>
        <!-- 成绩录入的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="finalPerson" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                成绩录入
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="stu_name" name="stu_name"
                                               placeholder="请输入姓名">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_id" value="" id="stu_id"
                                               placeholder="请输入学号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">校区</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>雅安校区</option>
                                            <option>都江堰校区</option>
                                            <option>温江校区</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>信息工程学院</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>物联网工程</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- 成绩更新的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="finalPersonRe" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                成绩更新
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
                                    <label class="col-sm-2 control-label">学号</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_id" value=""
                                               placeholder="请输入学号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">校区</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>雅安校区</option>
                                            <option>都江堰校区</option>
                                            <option>温江校区</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>信息工程学院</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">专业</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>物联网工程</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>学号</th>
                    <th>校区</th>
                    <th>学院</th>
                    <th>专业</th>
                    <th>性别</th>
                    <th>比赛项目</th>
                    <th>成绩</th>
                    <th>加分</th>
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
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                data-target="#finalPerson">更新
                        </button>
                        <button type="button" class="btn btn-danger btn-xs  delete">删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!--二级运动员-->
    <div style="padding: 5px 20px;" class="items">
        <blockquote style="padding: 1px 20px;background-color: #FCFCFC">
            <div class="page-header">
                <h3>二级运动员</h3>
            </div>
        </blockquote>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#athlete">成绩录入</button>
        </div>
        <!-- 成绩录入的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="athlete" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                成绩录入
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别/集体*</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- 成绩修改的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="athleteRe" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                成绩修改
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别/集体*</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>类型</th>
                    <th>项目</th>
                    <th>成绩</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-success btn-xs" data-toggle="modal"
                                data-target="#athleteRe">修改
                        </button>
                        <button type="button" class="btn btn-danger btn-xs  delete">删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!--校记录-->
    <div style="padding: 5px 20px;" class="items">
        <blockquote style="padding: 1px 20px;background-color: #FCFCFC">
            <div class="page-header">
                <h3>校记录</h3>
            </div>
        </blockquote>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#schoolRecord">添加新记录</button>
        </div>
        <!-- 成绩录入的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="schoolRecord" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                成绩录入
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别/集体*</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- 成绩更新的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="schoolRecordRe" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                成绩修改
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别/集体*</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">比赛项目</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>立定跳远</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">成绩</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入成绩">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>类型</th>
                    <th>项目</th>
                    <th>成绩</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-success btn-xs" data-toggle="modal"
                                data-target="#schoolRecordRe">修改
                        </button>
                        <button type="button" class="btn btn-danger btn-xs  delete">删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!--弃权记录-->
    <div style="padding: 5px 20px;" class="items">
        <blockquote style="padding: 1px 20px;background-color: #FCFCFC">
            <div class="page-header">
                <h3>弃权记录</h3>
            </div>
        </blockquote>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#abstention">添加新记录</button>
        </div>
        <!-- 成绩录入的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" id="" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="abstention" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                成绩录入
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">校区</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>雅安校区</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>信息工程学院</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">弃权人数</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="stu_score" name="stu_score"
                                               placeholder="请输入弃权人数">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- 成绩修改的模态框 -->
        <form method="post" action="" class="form-horizontal" role="form" onsubmit="" style="margin: 20px;">
            <div class="modal fade" id="abstentionRe" tabindex="-1" role="dialog" aria-labelledby="addScore"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                成绩修改
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">校区</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>雅安校区</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">学院</label>
                                    <div class="col-sm-9">
                                        <select class="form-control">
                                            <option>信息工程学院</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">弃权人数</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="stu_score"
                                               placeholder="请输入弃权人数">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                            <span id="tip"> </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-xs-12 col-sm-12 col-md-12">
            <table class="table table-bordered table-hover" style="background-color:white;">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>校区</th>
                    <th>学院</th>
                    <th>弃权人数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-success btn-xs" data-toggle="modal"
                                data-target="#abstentionRe">修改
                        </button>
                        <button type="button" class="btn btn-danger btn-xs  delete">删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12 copyright" align="right">&copy; 2018 四川农业大学 Powered by <a
            href="http://www.wingstudio.org"
            target="_blank" title="前往WingStudio工作室官网">WingStudio</a>
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