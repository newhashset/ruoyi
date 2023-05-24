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

          <form action="#!" method="post" class="row">

            <div class="form-group col-md-12">
              <label for="title">栏目名</label>
              <input type="text" class="form-control" id="title" name="title" value="" placeholder="请输入标题" />
            </div>

            <div class="form-group col-md-12">
              <label for="title">url地址</label>
              <input type="text" class="form-control" id="title" name="title" value="" placeholder="请输入标题" />
            </div>
            <div class="form-group col-md-12">
              <label for="seo_description">描述</label>
              <textarea class="form-control" id="seo_description" name="seo_description" rows="5" value="" placeholder="描述"></textarea>
            </div>
            <div class="form-group col-md-12">
              <label>栏目缩略图</label>
              <div class="form-controls">

                <ul class="list-inline clearfix lyear-uploads-pic">
                  <li class="col-xs-4 col-sm-3 col-md-2">
                    <figure>
                      <img src="../images/gallery/15.jpg" alt="图片一">
                      <figcaption>
                        <a class="btn btn-round btn-square btn-primary" href="#!"><i class="mdi mdi-eye"></i></a>
                        <a class="btn btn-round btn-square btn-danger" href="#!"><i class="mdi mdi-delete"></i></a>
                      </figcaption>
                    </figure>
                  </li>
                  <li class="col-xs-4 col-sm-3 col-md-2">
                    <a class="pic-add" id="add-pic-btn" href="#!" title="点击上传"></a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="form-group col-md-12">
              <label for="status">是否为父栏目</label>
              <div class="clearfix">
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="status" value="0"><span>是</span>
                </label>
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="status" value="1" checked><span>否</span>
                </label>
              </div>
            </div>
            <div class="form-group col-md-12">
              <label for="type">父栏目</label>
              <div class="form-controls">
                <select name="type" class="form-control" id="type">
                  <option value="1">小说</option>
                  <option value="2">古籍</option>
                  <option value="3">专辑</option>
                  <option value="4">自传</option>
                </select>
              </div>
            </div>
            <div class="form-group col-md-12">
              <label for="sort">排序</label>
              <input type="text" class="form-control" id="sort" name="sort" value="0" />
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