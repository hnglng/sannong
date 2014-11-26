<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 11/22/14
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Benefitting Agriculture - End Users Project Application Form</title>

  <link href="css/custom.css" rel="stylesheet" type="text/css">
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css">

  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <script src="js/custom.js"></script>
  <script src="js/select.js"></script>

  <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->

</head>

<body>

<jsp:include page='header.jsp'/>

<!-- PAGE TITLE -->
<div class="page-title withOutTitle">
</div>
<!-- /PAGE TITLE -->

<!-- CONTENT SECTION -->
<section class="contentSection">
  <div class="container">
    <div class="row">
        	<span class="col-sm-3 sidebar equalCol">
          	<h3>菜单</h3>
            <ul>
              <li class="active"><a href="#">项目申请<span></span></a></li>
              <li><a href="#">用户配置文件<span></span></a></li>
              <li><a href="#">更新密码<span></span></a></li>
            </ul>
          </span>
          <span class="col-sm-9 leftBorder equalCol">
						<!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
              <li role="presentation" class="active"><a href="#1" role="tab" data-toggle="tab">问卷题集</a></li>
              <li role="presentation"><a href="#2" role="tab" data-toggle="tab">问卷题集二</a></li>
              <li role="presentation"><a href="#3" role="tab" data-toggle="tab">问卷题集三</a></li>
              <li role="presentation"><a href="#4" role="tab" data-toggle="tab">问卷题集四</a></li>
              <li role="presentation"><a href="#5" role="tab" data-toggle="tab">问卷题集五</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
              <div role="tabpanel" class="tab-pane active" id="1">
                <ul class="steps">
                  <li class="active">
                    <span class="no">1</span>
                    <span class="stepHeading">问卷题集-</span>
                  </li>
                  <li>
                    <span class="no">2</span>
                    <span class="stepHeading">问卷题集-</span>
                  </li>
                  <li>
                    <span class="no">3</span>
                    <span class="stepHeading">问卷题集-</span>
                  </li>
                  <li>
                    <span class="no">4</span>
                    <span class="stepHeading">问卷题集-</span>
                  </li>
                  <li>
                    <span class="no">5</span>
                    <span class="stepHeading">问卷题集-</span>
                  </li>
                </ul>
                <div class="brown-bg">项目状态</div>
                <ul class="step-1-listing">
                  <li>
                    <a href="#"><h4>这仅仅是一个虚拟的文字，内容使页面</h4></a>
                    <p>这仅仅是一个虚拟的文字，内容使页面看起来实际.  这仅仅是一个虚拟的文字，内容使页面看起来实 拟的文字，内容使页面看起来实际</p>
                  </li>
                  <li>
                    <a href="#"><h4>这仅仅是一个虚拟</h4></a>
                    <p>这仅仅是一个虚拟的文字，内容使页面看起来实际.  这仅仅是一个虚拟的文字，内容使页面看起来实 拟的文字，内容使页面看起来实际</p>
                  </li>
                  <li>
                    <a href="#"><h4>这仅仅是一个虚拟的文字，内容使页面看起来实际</h4></a>
                    <p>这仅仅是一个虚拟的文字，内容使页面看起来实际.  这仅仅是一个虚拟的文字，内容使页面看起来实 拟的文字，内容使页面看起来实际</p>
                  </li>
                  <li>
                    <a href="#"><h4>这仅仅是一个虚拟的文字，内容</h4></a>
                    <p>这仅仅是一个虚拟的文字，内容使页面看起来实际.  这仅仅是一个虚拟的文字，内容使页面看起来实 拟的文字，内容使页面看起来实际</p>
                  </li>
                </ul>
                <div class="light-gray-txt">
                  如果需要修改问卷调查的答案，请致电免费电话
                  400-XXXX-XXXX联系我们的工作人员
                </div>
                <div class="float-right step-1-bts">
                  <a href="#" class="orange-bt-small">保存</a><a href="#" class="orange-bt-small">提交</a>
                </div>
              </div>
              <div role="tabpanel" class="tab-pane" id="2">Tab2</div>
              <div role="tabpanel" class="tab-pane" id="3">Tab3</div>
              <div role="tabpanel" class="tab-pane" id="4">Tab4</div>
              <div role="tabpanel" class="tab-pane" id="5">Tab5</div>
            </div>
          </span>
    </div>
  </div>
</section>
<!-- /CONTENT SECTION -->

<!-- FOOTER -->
<footer>
  <div class="container">
    <div class="row">
          <span class="col-sm-5 copyright">
            Copyright © 2000-2015 XXXX.com. All Rights Reserved. B2-20052010-6
          </span>
          <span class="col-sm-7">
            <ul>
              <li><a href="#">关于我们</a></li>
              <li><a href="#">联系我们</a></li>
              <li><a href="#">网站地图</a></li>
              <li><a href="#">免责条款</a></li>
              <li><a href="#">应用服务</a></li>
              <li><a href="#">招聘信息</a></li>
            </ul>
          </span>
    </div>
  </div>
  <div class="logosRow">
    <img src="images/footer-logos.jpg"/>
  </div>
</footer>
<!-- /FOOTER -->

</body>
</html>
