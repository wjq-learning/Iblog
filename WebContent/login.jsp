<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="GotoMainPage.action" method="post"/>
				<p>请输入用户邮箱和密码进行登录</p>
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
                            <span class="add-on" title="密码"><i class="icon-lock"></i></span>
                            <input type="password" id="password" placeholder="请输入密码" name="password"/>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="register.jsp" class="flip-link" id="to-recover">尚未注册?</a></span>
                    <span class="pull-right"><input id="login" type="button" class="btn btn-inverse" value="登录" /></span>
                </div>
            </form>
        </div>
        
        <script src="js/jquery.min.js"></script>
        <script src="js/unicorn.login.js"></script>
        <script type="text/javascript">
		$(document).ready(function(){
    		
    		$("#login").click(function(){
    			var userID = $("#userID").val().trim();
    			var password = $("#password").val().trim();

				if(userID != "" && password != ""){
					
    				$.ajax({
						type: "POST",
						url: "Login.action",
						async: false,
						data: {"userID":userID, "password":password},
						success: function(textStatus){
							if(textStatus=="success"){  
			                   	alert("登录成功");
			                   	$("#loginform").submit();
			                } 
							else {
								alert("账号密码错误");
							}
						}
					});
    			} 
    			else {
    				alert("请输入账号密码");
    			}
    		});
		});
        </script> 
    </body>
</html>
