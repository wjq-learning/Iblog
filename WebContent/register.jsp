<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iblog.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Iblog</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="css/unicorn.login.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body>
        <div id="logo" style="text-align:center;color:#fff;">
            <h3>Iblog<h3>
        </div>
        <div id="registerbox">            
            <form id="registerform" class="form-vertical"  method="post"/>
				<p>请输入下列信息</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on" title="用户邮箱"><i class="icon-user"></i></span>
                            <input type="text" id="userID" placeholder="请输入用户邮箱" name="userID"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on" title="用户昵称"><i class="icon-user"></i></span>
                            <input type="text" id="nickname" placeholder="请输入昵称" name="nickname"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on" title="密码"><i class="icon-lock"></i></span>
                            <input type="password" id="password1" placeholder="请输入密码" name="password1"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on" title="确认密码"><i class="icon-lock"></i></span>
                            <input type="password" id="password2" placeholder="请确认输入密码" name="password2"/>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                	<span class="pull-left"></span>
                    <span class="pull-right"><input id="register" type="buttin" class="btn btn-inverse" value="注册"/></span>
                </div>
            </form>
        </div>
        
        <script src="js/jquery.min.js"></script>
        <script src="js/unicorn.login.js"></script> 
        <script type="text/javascript">
		$(document).ready(function(){
    		
    		$("#register").click(function(){
    			var userID = $("#userID").val().trim();
    			var nickname = $("#nickname").val().trim();
    			var password1 = $("#password1").val().trim();
    			var password2 = $("#password2").val().trim();

				if(password1==password2){
					
    				$.ajax({
						type: "POST",
						url: "Register.action",
						async: false,
						data: {"userID":userID, "nickname":nickname, "password":password1},
						success: function(textStatus){
							if(textStatus=="success"){  
			                   	alert("注册成功");
								location.href="login.jsp";
			                } 
							else {
								alert("该邮箱账号已被使用");
							}
						}
					});
    			} 
    			else {
    				alert("两次输入密码不匹配");
    			}
    		});
		});
        </script> 
    </body>
</html>