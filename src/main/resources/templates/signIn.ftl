<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
  <#--  <script>
        function Login() {
            var usernumber = $("#usernumber").val();
            var userpass = $("#userpass").val();
            $.ajax({
                type:"post",
                dataType:'json',
                url:"/login",
                data:{"usernumber":usernumber,"userpass":userpass},
                success:function (result) {
                    alert(JSON.stringify(result))

                }
            })
        }
    </script>-->
</head>
<body>
<form action="/login" method="post">
    <input type="text" name="usernumber" id="usernumber" >
    <input type="text" name="userpass" id="userpass" >
    <input type="submit"  value="登陆" >
</form>
</body>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</html>