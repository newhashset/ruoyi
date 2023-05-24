    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <form class="pull-right search-bar" method="get" action="#!" role="form">
        <div class="input-group">
        <div class="input-group-btn">
        <input type="hidden" name="search_field" id="search-field" value="title">
        <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
        标题 <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">标题</a> </li>
        <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">栏目</a> </li>
        </ul>
        </div>
        <input type="text" class="form-control" value="" name="keyword" placeholder="请输入名称">
        </div>
        </form>
        <div class="toolbar-btn-action">
        <a class="btn btn-primary m-r-5" href="${base}/menu/toAdd"><i class="mdi mdi-plus"></i> 新增</a>
        <a class="btn btn-success m-r-5" href="#!"><i class="mdi mdi-check"></i> 启用</a>
        <a class="btn btn-warning m-r-5" href="#!"><i class="mdi mdi-block-helper"></i> 禁用</a>
        <a class="btn btn-danger" href="#!"><i class="mdi mdi-window-close"></i> 删除</a>
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
        <th>菜单名</th>
        <th>url</th>
        <th>图标</th>
        <th>父菜单</th>
        <th>创建人</th>
        <th>创建时间</th>
        <th>状态</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="m" items="${p.list}">
            <tr>
            <td>
            <label class="lyear-checkbox checkbox-primary">
            <input type="checkbox" name="ids" value="${m.id}"><span></span>
            </label>
            </td>
            <td>${m.id}</td>
            <td>${m.name}</td>
            <td>${m.url}</td>
            <td>${m.icon}</td>
            <td>${m.parentid}</td>
            <td>${m.createBy}</td>
            <td>
            <fmt:formatDate value="${m.createTime}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
            <c:if test="${m.status == 1}">
                <font class="text-success">正常</font>
            </c:if>
            <c:if test="${m.status == 0}">
                <font class="text-danger">禁用</font>
            </c:if>
            </td>
            <td>
            <div class="btn-group">
            <a class="btn btn-xs btn-default" href="#!" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
            <a class="btn btn-xs btn-default" href="#!" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
            </div>
            </td>
            </tr>
        </c:forEach>
        </tbody>
        </table>
        </div>
        <ul class="pagination">
        <li><a href="${base}/menu/show?pageNum=${p.prePage}">«</a></li>
        <c:forEach var="i" items="${p.navigatepageNums}">
            <li  <c:if test="${p.pageNum == i}">class="active"</c:if>
            ><a href="${base}/menu/show?pageNum=${i}">${i}</a></li>
        </c:forEach>
        <li><a href="${base}/menu/show?pageNum=${p.nextPage}">»</a></li>
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
        </script>
        </body>
        </html>