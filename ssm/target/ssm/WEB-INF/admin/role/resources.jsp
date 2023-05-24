<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>设置权限 </title>
<link rel="icon" href="favicon.ico" type="image/ico">
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
          <div class="card-header"><h4>设置权限</h4></div>
          <div class="card-body">

            <form action="${base}/role/addMenu" method="post">
              <div class="form-group">
                <label for="example-text-input">角色名称</label>
                <input class="form-control" type="text" value="${r.rolename}" readonly name="rolename" placeholder="角色名称">
                <input type="hidden" name="roleid" value="${r.id}">
              </div>
              <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>
                      <label class="lyear-checkbox checkbox-primary">
                        <input name="checkbox" type="checkbox" id="check-all">
                        <span> 全选</span>
                      </label>
                    </th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${menus}" var="one">
                  <c:if test="${one.parentid==-1}">
                  <tr>
                    <td>
                      <label class="lyear-checkbox checkbox-primary">
                        <input name="menuids" type="checkbox" class="checkbox-parent" dataid="id-${one.id}" value="${one.id}">
                        <span> ${one.name}</span>
                      </label>
                    </td>
                  </tr>
                  <c:forEach items="${menus}" var="two">
                    <c:if test="${two.parentid==one.id}">
                  <tr>
                    <td class="p-l-20">
                      <label class="lyear-checkbox checkbox-primary">
                        <input name="menuids" type="checkbox" class="checkbox-parent checkbox-child" dataid="id-${one.id}-${two.id}" value="${two.id}">
                        <span> ${two.name}</span>
                      </label>
                    </td>
                  </tr>

                  <tr>
                    <td class="p-l-40">
                      <c:forEach items="${menus}" var="three">
                        <c:if test="${three.parentid==two.id}">
                      <label class="lyear-checkbox checkbox-primary checkbox-inline">
                        <input name="menuids" type="checkbox" class="checkbox-child" dataid="id-${one.id}-${two.id}-${three.id}" value="${three.id}">
                        <span> ${three.name}</span>
                      </label>
                        </c:if>
                      </c:forEach>
                    </td>
                  </tr>

                    </c:if>
                   </c:forEach>
                  </c:if>
                </c:forEach>
                </tbody>
              </table>
                <div class="form-group col-md-12">
                  <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">确 定</button>
                  <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
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
<script type="text/javascript" src="../js/main.min.js"></script>

<script type="text/javascript" src="../js/chosen.jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    //动态选择框，上下级选中状态变化
    $('input.checkbox-parent').on('change', function(){
        var dataid = $(this).attr("dataid");
        $('input[dataid^=' + dataid + '-]').prop('checked', $(this).is(':checked'));
    });
    $('input.checkbox-child').on('change', function(){
        var dataid = $(this).attr("dataid");
            dataid = dataid.substring(0, dataid.lastIndexOf("-"));
        var parent = $('input[dataid=' + dataid + ']');
        if($(this).is(':checked')){
            parent.prop('checked', true);
            //循环到顶级
            while(dataid.lastIndexOf("-") != 2){
                dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                parent = $('input[dataid=' + dataid + ']');
                parent.prop('checked', true);
            }
        }else{
            //父级
            if($('input[dataid^=' + dataid + '-]:checked').length == 0){
                parent.prop('checked', false);
                //循环到顶级
                while(dataid.lastIndexOf("-") != 2){
                    dataid = dataid.substring(0, dataid.lastIndexOf("-"));
                    parent = $('input[dataid=' + dataid + ']');
                    if($('input[dataid^=' + dataid + '-]:checked').length == 0){
                        parent.prop('checked', false);
                    }
                }
            }
        }
    });
});
//进入分配权限页面 先默认展示 角色原来的权限
//获取所有权限id
//获取角色包含的权限id
//获取两种id一致时 复选框才是选中（checked = true）
  var menuids = document.getElementsByName("menuids");
  var menus=${json};
  for(var i=0;i<menus.length;i++){//角色对应的权限
    for(var j=0;j<menuids.length;j++){//通过复选框组件获取所有权限
       if(menuids[j].value==menus[i].id){
         menuids[j].checked=true;
       }
    }
  }

</script>
</body>
</html>