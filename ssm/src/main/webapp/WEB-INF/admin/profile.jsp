<%@page contentType="text/html;charset=utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>个人信息 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">
<link href="css/style.min.css" rel="stylesheet">
</head>
  
<body>

    <!--页面主要内容-->
    <div class="container-fluid">

      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">

              <div class="edit-avatar">
                <img id="img" class="img-avatar img-avatar-48 m-r-10" src="${base}/upload/${empty admin.headPic?'default.jsp':admin.headPic}" alt="..." class="img-avatar">
                <div class="avatar-divider"></div>
                <div class="edit-avatar-content">
                  <button class="btn btn-default" onclick="cli()">修改头像</button>
                  <input id="myHead" type="file" onchange="showImg(this)" name="myHead" style="display:none"/>
                  <p class="m-0">选择一张你喜欢的图片，裁剪后会自动生成264x264大小，上传图片大小不能超过2M。</p>
                </div>
              </div>
              <hr>
              <form target="_top" method="post" action="${base}/admin/profile" class="site-form">
                <div class="form-group">
                  <label for="account">用户名</label>
                  <input type="text" class="form-control" name="account" id="account" value="${admin.account}" disabled="disabled" />
                </div>
                <div class="form-group">
                  <label for="name">昵称</label>
                  <input type="text" class="form-control" name="name" id="name" placeholder="输入您的昵称" value="${admin.name}">
                </div>
                <div class="form-group">
                  <label for="email">邮箱</label>
                  <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="请输入正确的邮箱地址" value="${admin.email}">
                  <small id="emailHelp" class="form-text text-muted">请保证您填写的邮箱地址是正确的。</small>
                </div>
                <div class="form-group">
                  <label for="remark">简介</label>
                  <textarea class="form-control" name="remark" id="remark" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">保存</button>
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
<script>
  function cli(){
    document.getElementById("myHead").click();
  }
  function showImg(o){
    var imgFile=o.files[0];
    var src=window.URL.createObjectURL(imgFile);
    document.getElementById("img").setAttribute("src",src);
  }
</script>
</body>
</html>