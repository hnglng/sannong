<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--doctype html-->
<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Benefitting Agriculture - Project Application Page</title>
    
		<link href="css/custom.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="content/static/css/sannong/validation.css" rel="stylesheet">
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
                <span class="col-sm-9 rightBorder equalCol">
                    <h3 class="borderBottom">申报项目</h3>
                    <form class="projectAppForm" id="projectApplicationForm">
                        <ul>
                            <div id="questionnaire">
                                <script id="question-template-radio" type="text/x-handlebars-template">
                                    <li class="J_group_choice">
                                        {{fromOne}}. {{questionContent}}
                                        <div class="radioRow">
                                            <span class="radioCustom"><input type="radio" name="answers[{{fromZero}}]" value="{{questionId}}:a"><label>{{option1}}</label></span>
                                            <span class="radioCustom"><input type="radio" name="answers[{{fromZero}}]" value="{{questionId}}:b"><label>{{option2}}</label></span>
                                            <span class="radioCustom"><input type="radio" name="answers[{{fromZero}}]" value="{{questionId}}:c"><label>{{option3}}</label></span>
                                            <span class="radioCustom"><input type="radio" name="answers[{{fromZero}}]" value="{{questionId}}:d"><label>{{option4}}</label></span>
                                            <span class="radioCustom"><input type="radio" name="answers[{{fromZero}}]" value="{{questionId}}:e"><label>{{option5}}</label></span>
                                        </div>
                                    </li>
                                </script>
                                <script id="question-template-checkbox" type="text/x-handlebars-template">
                                    <li class="J_group_choice">
                                        {{fromOne}}. {{questionContent}}
                                        <div class="checkboxRow">
                                            <span class="checkboxCustom"><input type="checkbox" name="answers[{{fromZero}}]" value="{{questionId}}:a"><label>{{option1}}</label></span>
                                            <span class="checkboxCustom"><input type="checkbox" name="answers[{{fromZero}}]" value="{{questionId}}:b"><label>{{option2}}</label></span>
                                            <span class="checkboxCustom"><input type="checkbox" name="answers[{{fromZero}}]" value="{{questionId}}:c"><label>{{option3}}</label></span>
                                            <span class="checkboxCustom"><input type="checkbox" name="answers[{{fromZero}}]" value="{{questionId}}:d"><label>{{option4}}</label></span>
                                            <span class="checkboxCustom"><input type="checkbox" name="answers[{{fromZero}}]" value="{{questionId}}:e"><label>{{option5}}</label></span>
                                        </div>
                                    </li>
                                </script>
                            </div>
                        </ul>

                        <div class="row">
                            <aside class="userFormCol-1">姓名</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-172" id="userRealName" name="applicant.realName"></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">职位</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-172" id="jobTitle" name="applicant.jobTitle" ></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">工作单位</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-281" id="company" name="applicant.company"></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">单位地址</aside>
                            <aside class="userFormCol-right">
                                <div class="width-87">
                                    <select id="provinceSelect" name="applicant.companyProvince">
                                        <option value="1">北京市</option>
                                        <option value="2">天津市</option>
                                        <option value="3">河北省</option>
                                        <option value="4">山西省</option>
                                        <option value="5">内蒙古自治区</option>
                                        <option value="6">辽宁省</option>
                                        <option value="7">吉林省</option>
                                        <option value="8">黑龙江省</option>
                                        <option value="9">上海市</option>
                                        <option value="10">江苏省</option>
                                        <option value="11">浙江省</option>
                                        <option value="12">安徽省</option>
                                        <option value="13">福建省</option>
                                        <option value="14">江西省</option>
                                        <option value="15">山东省</option>
                                        <option value="16">河南省</option>
                                        <option value="17">湖北省</option>
                                        <option value="18">湖南省</option>
                                        <option value="19">广东省</option>
                                        <option value="20">广西壮族自治区</option>
                                        <option value="21">海南省</option>
                                        <option value="22">重庆市</option>
                                        <option value="23">四川省</option>
                                        <option value="24">贵州省</option>
                                        <option value="25">云南省</option>
                                        <option value="26">西藏自治区</option>
                                        <option value="27">陕西省</option>
                                        <option value="28">甘肃省</option>
                                        <option value="29">青海省</option>
                                        <option value="30">宁夏回族自治区</option>
                                        <option value="31">新疆维吾尔自治区</option>
                                        <option value="32">台湾</option>
                                        <option value="33">香港特别行政区</option>
                                        <option value="34">澳门特别行政区</option>
                                    </select>
                                </div>
                                <div class="width-87">
                                    <select id="applicant.companyCity" name="applicant.companyCity">
                                        <option value="1">市辖区</option>
                                        <option value="2">县</option>
                                    </select>
                                </div>
                                    <div class="width-87">
                                    <select id="applicant.companyDistrict" name="applicant.companyDistrict">
                                        <option value='1'>东城区</option>
                                        <option value='2'>西城区</option>
                                        <option value='3'>崇文区</option>
                                        <option value='4'>宣武区</option>
                                        <option value='5'>朝阳区</option>
                                        <option value='6'>丰台区</option>
                                        <option value='7'>石景山区</option>
                                        <option value='8'>海淀区</option>
                                        <option value='9'>门头沟区</option>
                                        <option value='10'>房山区</option>
                                        <option value='11'>通州区</option>
                                        <option value='12'>顺义区</option>
                                        <option value='13'>昌平区</option>
                                        <option value='14'>大兴区</option>
                                        <option value='15'>怀柔区</option>
                                        <option value='16'>平谷区</option>
                                    </select>
                                </div>
                                <input type="text" class="width-273" id="jobAddress" name="applicant.companyAddress">
                            </aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">工作电话</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-281" id="deskPhone" name="applicant.deskPhone"></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">电子邮件</aside>
                            <aside class="userFormCol-right"><input type="text" class="width-281" id="mailbox" name="applicant.mailbox"></aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">手机号码</aside>
                            <aside class="userFormCol-right">
                                <input type="text" class="width-281" id="cellphone" name="applicant.cellphone">
                                <a href="#" class="white-bt" id="action-send-code" name="action-send-code">获取验证码</a>
                            </aside>
                        </div>
                        <div class="row">
                            <aside class="userFormCol-1">验证码</aside>
                            <aside class="userFormCol-right">
                                <div class="width-87">
                                    <input type="text" id="validationCode" name="sms.smsValidationCode"/>
                                </div>
                            </aside>
                        </div>
                        <div class="row">
                            <input type="submit" id="projectApplicationFormSubmit" value="提交"/>
                        </div>

                    </form>
                </span>

                <span class="col-sm-3 sidebar equalCol">
                    <h3>常见问题</h3>
                    <div id="accordion" class="panel-group faqAccordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="#collapseOne" data-parent="#accordion" data-toggle="collapse" class="panel-toggle">
                                  这仅仅是一个虚拟的文字 内容使页面看起来实际
                                </a>
                            </div><!-- end panel-heading -->
                            <div class="panel-collapse in" id="collapseOne">
                                <div class="panel-body">
                                这仅仅是一个虚拟的文字，内容使页面看起来实际.  这 仅仅是一个虚拟的文字，内 容使页面
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="#collapseTwo" data-parent="#accordion" data-toggle="collapse" class="panel-toggle collapsed">
                              拟的文字，内容使页
                                </a>
                            </div><!-- end panel-heading -->
                            <div class="panel-collapse collapse" id="collapseTwo">
                                <div class="panel-body">
                                这仅仅是一个虚拟的文字，内容使页面看起来实际.  这仅仅是一个虚拟的文字，内容使页面看起来实 拟的文字，内容使页面看起来实际
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="#collapseThree" data-parent="#accordion" data-toggle="collapse" class="panel-toggle collapsed">
                                这仅仅是一个虚拟的文字内 容使页面看起来实际
                                </a>
                            </div><!-- end panel-heading -->
                            <div class="panel-collapse collapse" id="collapseThree">
                                <div class="panel-body">
                                这仅仅是一个虚拟的文字，内容使页面看起来实际.  这仅仅是一个虚拟的文字，内容使页面看起来实 拟的文字，内容使页面看起来实际
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="txtAlignRight">
                        有更多问题？请看<br/>
                        <a href="faq" class="orange-link">常见问题</a>
                    </p>
                </span>
            </div>
        </div>
    </section>
    <!-- /CONTENT SECTION -->

    <jsp:include page='footer.jsp'/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


    <script src="js/custom.js"></script>
    <script src="js/select.js"></script>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <script data-main="content/static/js/sannong/pages/projectapplication" src="content/static/js/lib/require-2.1.15.js"></script>
    </body>
</html>