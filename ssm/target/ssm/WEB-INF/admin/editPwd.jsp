<%@page contentType="text/html;charset=utf-8"
        isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>修改密码 - 光年(Light Year Admin)后台管理系统模板</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
    <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
    <meta name="author" content="yinqi">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
</head>

<body>


<div class="container-fluid">

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <%--target="_top" 到上一级菜单 不然还是在二级菜单上显示--%>
                    <form target="_top" method="post" action="${base}/admin/editPwd" onsubmit="return check()" class="site-form">
                        <input type="hidden" name="id" value="${admin.id}"/>
                        <div class="form-group">
                            <label for="oldpwd">旧密码</label>
                            <input type="password" class="form-control" onblur="checkPwd(this)" name="oldpwd" id="oldpwd"
                                   placeholder="输入账号的原登录密码">
                        </div>
                        <div class="form-group">
                            <label for="newPwd">新密码</label>
                            <input type="password" class="form-control" name="password" id="newpwd"
                                   placeholder="输入新的密码">
                        </div>
                        <div class="form-group">
                            <label for="newPwd2">确认新密码</label>
                            <input type="password" class="form-control" name="confirmpwd" id="newpwd2"
                                   placeholder="请输入正确的邮箱地址">
                        </div>
                        <button type="submit" class="btn btn-primary">修改密码</button>
                    </form>

                </div>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>

<script src="js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="js/lightyear.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>

</body>
</html>
<script>
    function check(){
        var oldPwd=$("#oldpwd").val();
        var newPwd=$("#newpwd").val();
        var newPwd2=$("#newpwd2").val();
        if(oldPwd=="" || newPwd2=="" || newPwd==""){
            lightyear.loading('show');
            setTimeout(function() {
                lightyear.loading('hide');
                lightyear.notify('密码不能为空', 'danger',1000);
            },1000);
            return false;
        }
        if(!b){
            lightyear.loading('show');
            setTimeout(function() {
                lightyear.loading('hide');
                lightyear.notify('原密码输入错误', 'danger',1000);
            },1000);
            return false;
        }
        if(newPwd!=newPwd2){
            lightyear.loading('show');
            setTimeout(function() {
                lightyear.loading('hide');
                lightyear.notify('两次密码不一致', 'danger',1000);
            },1000);
            return false;
        }
        return true;
    }
    var b;
    function checkPwd(pwd){
        var value=pwd.value;
        $.post("${base}/admin/checkPwd?pwd="+value,function(result){
            b=result;
        })
    }
</script>