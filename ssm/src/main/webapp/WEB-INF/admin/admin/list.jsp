<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=utf-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <title>文档列表 - 光年(Light Year Admin)后台管理系统模板</title>
  <link rel="icon" href="../favicon.ico" type="image/ico">
  <meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
  <meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
  <meta name="author" content="yinqi">
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/materialdesignicons.min.css" rel="stylesheet">
  <link href="../css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid">

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-toolbar clearfix">
          <form class="pull-right search-bar" method="post" action="${base}/admin/select" role="form">
            <div class="input-group">
              <div class="input-group-btn">
                <input type="hidden" name="search_field" id="search-field" value="title">
                <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                  用户名 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">用户名</a> </li>
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">姓名</a> </li>
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">电话</a> </li>
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">邮箱</a> </li>
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">性别</a> </li>
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">角色</a> </li>
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">状态</a> </li>

                </ul>
              </div>
              <input type="text" class="form-control" value="" name="keyword" placeholder="请输入名称">
            </div>
          </form>
          <div class="toolbar-btn-action">
            <a class="btn btn-primary m-r-5" href="${base}/admin/toAdd"><i class="mdi mdi-plus"></i> 新增</a>
            <a onclick="enableAll()"  class="btn btn-success m-r-5" ><i class="mdi mdi-check"></i> 启用</a>
            <a onclick="disableAll()"  class="btn btn-warning m-r-5" ><i class="mdi mdi-block-helper"></i> 禁用</a>
            <a onclick="deleteAll()"  class="btn btn-danger" ><i class="mdi mdi-window-close"></i> 删除</a>
          </div>
        </div>
        <div class="card-body">

          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>
                  <label class="lyear-checkbox checkbox-primary">
                    <input type="checkbox" id="check-all"><span></span>
                  </label>
                </th>
                <th>编号</th>
                <th>用户名</th>
                <th>姓名</th>
                <th>头像</th>
                <th>手机</th>
                <th>邮箱</th>
                <th>性别</th>
                <th>角色</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>

              <form action="" method="post" name="myForm">
              <c:forEach var="a" items="${p.list}">
                <tr>
                  <td>
                    <label class="lyear-checkbox checkbox-primary">
                      <input type="checkbox" name="ids" value="${a.id}"><span></span>
                    </label>
                  </td>
                  <td>${a.id}</td>
                  <td>${a.account}</td>
                  <td>${a.name}</td>
                  <td><img class="img-avatar img-avatar-48 m-r-10" src="${base}/upload/${a.headPic}" alt=""></td>
                  <td>${a.phone}</td>
                  <td>${a.email}</td>
                  <td>${a.sex==0?'男':'女'}</td>
                  <td>${a.role.rolename}</td>
                  <td>
                    <c:if test="${a.status==0}">
                      <font class="text-success">正常</font>
                    </c:if>
                    <c:if test="${a.status==1}">
                      <font class="text-warning">冻结</font>
                    </c:if>
                    <c:if test="${a.status==2}">
                      <font class="text-danger">禁用</font>
                    </c:if>
                  </td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-xs btn-default" href="${base}/admin/queryById?id=${a.id}" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                      <a class="btn btn-xs btn-default" href="${base}/admin/delete?id=${a.id}" onclick="return confirm('确定删除？')" title="" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              </form>
              </tbody>
            </table>
          </div>
          <ul class="pagination">
            <p style="align-content: end">
            <li><a href="${base}/admin/show?pageNum=${p.prePage}">«</a></li>
            <c:forEach var="i" items="${p.navigatepageNums}">
              <li
                  <c:if test="${p.pageNum == i}">class="active"</c:if>
              ><a href="${base}/admin/show?pageNum=${i}">${i}</a></li>
            </c:forEach>
            <li><a href="${base}/admin/show?pageNum=${p.nextPage}">»</a></li>
            共<span style="color: red">${p.total}</span>条记录
              <span style="color: red">${p.pageNum}/${p.pages}</span>页</p>
          </ul>

        </div>
      </div>
    </div>

  </div>

</div>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../js/main.min.js"></script>
<script type="text/javascript">
  $(function(){
    $('.search-bar .dropdown-menu a').click(function() {
      var field = $(this).data('field') || '';
      $('#search-field').val(field);
      $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
    });
  });
  //通过不同的按钮或者不同的连接 提供同一个表单的不同功能
  function enableAll() {
    document.myForm.action="${base}/admin/enableAll";
    document.myForm.submit();
  }
  function disableAll() {
    document.myForm.action="${base}/admin/disableAll";
    document.myForm.submit();
  }
  function deleteAll() {
    return confirm("确定删除选中的这些数据吗？")
    document.myForm.action="${base}/admin/deleteAll";
    document.myForm.submit();
  }
</script>
</body>
</html>