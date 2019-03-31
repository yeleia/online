//cookie工具类
function cookieUtil(){
    //s20是代表20秒
    //h是指小时，如12小时则是：h12
    //d是天数，30天则：d30

    //创建cookie
    this.setCookie=function(name,value,time){
        var strsec = this.getSec(time);
        var exp = new Date();
        exp.setTime(exp.getTime() + strsec*1);
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
    }
    //解析字符串
    this.getSec=function(str){
        var str1=str.substring(1,str.length)*1;
        var str2=str.substring(0,1);
        if (str2=="s")
        {
            return str1*1000;
        }
        else if (str2=="h")
        {
            return str1*60*60*1000;
        }
        else if (str2=="d")
        {
            return str1*24*60*60*1000;
        }
    }
    //获取cookie
    this.getCookie=function(name){
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    }
    //删除cookie
    this.delCookie=function(name){
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval=getCookie(name);
        if(cval!=null)
            document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
}
/**
 * 注销登录
 * */
function signOut(){
    $('#mySmallModal').modal('show');
    $('#smallModalSure').click(function(){
        $(location).attr('href','login.html');
    });
}
