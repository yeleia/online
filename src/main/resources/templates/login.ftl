<!DOCTYPE HTML>
<html>
<head>
    <title>在线文档</title>
    <link href="${request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- -->
    <script>var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++) {if ( __links[i].getAttribute('data-t') == '_blank' ) { __links[i].addEventListener('click', __linkClick, false);}}</script>
    <script src="${request.contextPath}/static/js/jquery.min.js"></script>
    <script>$(document).ready(function(c) {
        $('.alert-close').on('click', function(c){
            $('.message').fadeOut('slow', function(c){
                $('.message').remove();
            });
        });
    });
    </script>
</head>
<body>
<!-- contact-form -->
<div class="message warning">
    <div class="inset">
        <div class="login-head">
            <h1><center>Login</center></h1>
        </div>
        <form>
            <li>
                <input type="text" class="text" name="usernumber" value="usernumber" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'usernumber';}"><a href="#" class=" icon user"></a>
            </li>
            <div class="clear"> </div>
            <li>
                <input type="password" value="userpass"  name="userpass" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'userpass';}"> <a href="#" class="icon lock"></a>
            </li>
            <li>
                    <input type="submit" onclick="login()" value="登陆" >
            </li>

        </form>
    </div>
</div>
<div class="clear"> </div>
</body>
<script>
    function login() {
        var usernumber=document.getElementsByName("usernumber").values();
        var userpass=document.getElementsByName("userpass").values();
        $.ajax({
            type:"post",
            url:,
            data:{"usernumber":usernumber,"userpass":userpass},
            success:function (result) {
                
            }
        })
    }
</script>
</html>