/**
 * Created by Bright Huang on 11/1/14.
 */

(function($) {

    "use strict";

    var myinfo = {};
    myinfo.Model = {};
    myinfo.View = {};

    function validateForm(formName){

        var validator = $("#" + formName ).validate({
            rules: {
                "jobTitle": "required",
                "company": "required",
                "provinceSelect": "required",
                "citySelect": "required",
                "districtSelect": "required",
                "companyAddress": "required",
                "mailbox": {
                    email:true
                },
                "deskPhone": {
                    isTel: true
                },
                "cellphone": {
                    required: true,
                    isCellphone: true
                },
                "sms.smsValidationCode":{
                    digits: true,
                    rangelength:[4,4]
                },
                password: {
                    required: true,
                    minlength: 6
                }
            },
            messages: {
                "jobTitle": "必填",
                "company": "必填",
                "provinceSelect": "必填",
                "citySelect": "必填",
                "districtSelect": "必填",
                "companyAddress": "必填",
                "mailbox": "请输入正确格式的电子邮件",
                "deskPhone": {
                    isTel: "请输入正确格式的电话号码 如:010-12345678"
                },
                "cellphone": {
                    required: "必填",
                    isCellphone: "请正确填写您的手机号码",
                    remote: "姓名或手机号码不存在"
                },
                "sms.smsValidationCode":{
                    digits: "只能输入整数",
                    rangelength: $.validator.format("请输入一个长度为{0}的整数验证码")
                },
                "password": {
                    required: "请输入密码",
                    minlength: $.validator.format("密码不能小于{0}个字 符")
                }

            },
            success: function(label, element) {
            },
            errorPlacement:function(error,element) {
                if ( element.is(":radio") ) {
                    error.appendTo(element.parent().parent());

                }else if ( element.is(":checkbox") ) {
                    error.appendTo(element.next());

                }else if (element.attr("name") == "cellphone") {
                    error.insertAfter(element);
                } else{
                    error.insertAfter(element);
                }

            },
            submitHandler:function(form){
                form.submit();
            }
        });
        return validator;
    }

    function addCities(){
        var provinceIndex = $("#provinceSelect").val();
        var options = {
            url: 'getCities',
            type: 'POST',
            data: {'provinceIndex': provinceIndex},
            success: function(data){
                myinfo.Controller.addCitySelections(data);
            },
            fail: function(data){
            }
        }
        myinfo.Controller.ajaxRequest(options);
    }

    function addProvinces(){
        var options = {
            url: 'getProvinces',
            type: 'POST',
            success: function(data){
                myinfo.Controller.addProvinceSelections(data);
            },
            fail: function(error){
            }
        }
        myinfo.Controller.ajaxRequest(options);
    }

    function addDistricts(){
        var cityIndex= $('#citySelect').val();
        var options = {
            url: 'getDistricts',
            type: 'POST',
            data: {'cityIndex': cityIndex},
            success: function(data){
                myinfo.Controller.addDistrictSelections(data);
            },
            fail: function(data){

            }
        }
        myinfo.Controller.ajaxRequest(options);
    }

    function init(){
        $.validator.addMethod("isTel", function(value, element) {
            var tel = /^\d{3,4}-?\d{7,9}$/; //电话号码格式010-12345678
            return this.optional(element) || (tel.test(value));
        }, "请正确填写您的电话号码");


        $.validator.addMethod("isCellphone", function(value, element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1})||(18[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码");
    }

    myinfo.Controller = {
        ajaxRequest : function(options) {
            return $.ajax({
                cache: false,
                data: options.data,
                dataType: options.dataType,
                type: options.type,
                url: options.url
            }).success(function (data, status, xhr) {
                options.success(data);
            }).fail(function (xhr, status, error) {
                options.fail(error);
            }).always(function (xhr, status, error) {

            });
        },
        addProvinceSelections: function(provinces) {
            var provinceSelect = $('#provinceSelect');
            $('#provinceSelect option').remove();
            $('#citySelect option').remove();
            $('#districtSelect option').remove();

            for (var i in provinces){
                var optionValue = provinces[i].provinceIndex;
                var optionText = provinces[i].provinceName;
                var option = "<option value=" + optionValue + ">" + optionText + "</option>";
                provinceSelect.append(option);
            }
            addCities();
        },
        addCitySelections: function(cities) {
            var citySelect = $('#citySelect');
            $('#citySelect option').remove();
            $('#districtSelect option').remove();

            for (var i in cities){
                var optionValue = cities[i].cityIndex;
                var optionText = cities[i].cityName;
                var option = "<option value=" + optionValue + ">" + optionText + "</option>";
                citySelect.append(option);
            }
            addDistricts();
        },

        addDistrictSelections: function(districts) {
            var districtSelect = $('#districtSelect');
            $('#districtSelect option').remove();

            for (var i in districts){
                var optionValue = districts[i].districtIndex
                var optionText = districts[i].districtName;
                var option = "<option value=" + optionValue + ">" + optionText + "</option>";
                districtSelect.append(option);
            }
        },
        addEventListener: function(){

            var userInfoForm = "userInfoForm";
            var myInfoForm = "myInfoForm";

            $("#provinceSelect").change(function(event){
                addCities();
            });

            $("#citySelect").change(function(event){
                $('#districtSelect option').remove();
                addDistricts();
            });

            $("#register-btn").click(function(event){
                if (validateForm(myInfoForm).form() == true){
                    $("#myInfoForm").submit();
                }
            });

            $("#register-btn").click(function(event){
                if (validateForm(myInfoForm).form() == true){
                    $("#userInfoForm").submit();
                }
            });

            $("#confirmedSubmit").click(function(event){
                $("#myInfoForm").submit();
            });


            $("#validationCode").keyup(function(){
                if (validateForm(myInfoForm).element($("#validationCode")) == true && $("#validationCode").val() != ""){
                    $("#applicationSubmit").removeAttr("disabled");
                    $("#applicationSubmit").removeClass().addClass("btn btn-success");
                } else {
                    $("#applicationSubmit").attr({disabled: "disabled"});
                    $("#applicationSubmit").removeClass().addClass("btn btn-default");
                }

            });

            $("#action-send-code").click(function(event){
                if (validateForm(myInfoForm).form() == true){
                    var options = {
                        url: 'regcode',
                        type: 'GET',
                        data: {
                            mobile: $("#cellphone").val(),
                            smstype: $("#action-send-code").attr("data-type")
                        },
                        success: function(data){

                        },
                        fail: function(data){

                        }
                    }
                    myinfo.Controller.ajaxRequest(options);
                }
            });

            $("#userInfoSubmit").click(function(event){
                if (validateForm(userInfoForm).form() == true){
                	$("#userInfoForm").ajaxSubmit(function(message) {
                		return false;
                	});
                }
            });
        }
    };

    $(function() {
        init();
        addProvinces();
        myinfo.Controller.addEventListener();

    });

    //Sannong.ProjectApplication = myinfo;
    return myinfo;
})(jQuery);
