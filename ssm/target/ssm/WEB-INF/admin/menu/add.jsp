  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>新增文档 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="../favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/materialdesignicons.min.css" rel="stylesheet">
<!--标签插件-->
<link rel="stylesheet" href="../js/jquery-tags-input/jquery.tagsinput.min.css">
<link href="../css/style.min.css" rel="stylesheet">
</head>
  
<body>
<div class="container-fluid">

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">

          <form action="${base}/menu/add" method="post" class="row">
            <div class="form-group col-md-12">
              <label for="title">权限名</label>
              <input type="text" class="form-control" id="title" name="name" value="" placeholder="请输入标题" />
            </div>
            <div class="form-group col-md-12">
              <label for="seo_keywords">URL</label>
              <input type="text" class="form-control" id="seo_keywords" name="url" value="" placeholder="关键词" />
            </div>
            <div class="form-group col-md-12">
              <label for="icon">图标</label>
              <input type="text" class="form-control" id="icon" name="icon" value="" placeholder="图标" />
            </div>


            <div class="form-group col-md-12">
              <label for="type">父权限</label>
              <div class="form-controls">
                <select name="parentid" class="form-control" id="type">
                  <option value="-1">一级菜单</option>
                       <c:forEach var="m" items="${menus}">
                  <option value="${m.id}">${m.name}</option>
                 </c:forEach>

                </select>
              </div>
            </div>
            <div class="form-group col-md-12">
              <label for="sort">排序</label>
              <input type="text" class="form-control" id="sort" name="sort" value="0" />
            </div>
      <div class="form-group col-md-12">
      <label for="createBy">创建者</label>
      <input type="text" class="form-control" id="createBy" name="createBy" value="${admin.id}" readonly />
      </div>
            <div class="form-group col-md-12">
              <label for="status">状态</label>
              <div class="clearfix">
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="status" value="0"><span>禁用</span>
                </label>
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="status" value="1" checked><span>启用</span>
                </label>
              </div>
            </div>
            <div class="form-group col-md-12">
              <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">确 定</button>
              <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
            </div>
          </form>

        </div>
      </div>
    </div>

  </div>

</div>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/perfect-scrollbar.min.js"></script>
<!--标签插件-->
<script src="../js/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="../js/main.min.js"></script>
</body>
</html>