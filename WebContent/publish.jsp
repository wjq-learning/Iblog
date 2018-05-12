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
		<title>Iblog-go sharing!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/fullcalendar.css" />	
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
		<script src="js/excanvas.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.ui.custom.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.flot.min.js"></script>
        <script src="js/jquery.flot.resize.min.js"></script>
        <script src="js/jquery.peity.min.js"></script>
        <script src="js/fullcalendar.min.js"></script>
        <script src="js/unicorn.js"></script>
        <script src="js/unicorn.dashboard.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
	<body>
		<div id="header"><h1></h1></div>
		<div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse">
                    <a href="#">
                        <i class="icon icon-user"></i>
                        <span class="text">
                            ${user.nickname}
                        </span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a href="login.jsp">
                        <i class="icon icon-share-alt"></i>
                        <span class="text">注销</span>
                    </a>
                </li>
            </ul>
        </div>
        <div id="sidebar">
            <ul>
                <li class="active">
                    <a href="GotoMainPage.action">
                        <i class="icon icon-home"></i> 
                        <span>首页</span>
                    </a>
                </li>
                <li>
                    <a href="GotoMyspace.action">
                        <i class="icon icon-tag"></i> 
                        <span>个人空间</span>
                    </a>
                </li>
                <li>
                    <a href="GotoMyfollow.action">
                        <i class="icon icon-user"></i> 
                        <span>关注列表</span>
                    </a>
                </li>
                <li>
                    <a href="GotoMyfan.action">
                        <i class="icon icon-user"></i> 
                        <span>粉丝列表</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon icon-pub"></i> 
                        <span>发布微博</span>
                    </a>
                </li>
                
            </ul>
        </div>
        
        
		<div id="content">
			<div id="content-header">
				<h1>发布微博</h1>
			</div>
			<div id="breadcrumb">
				<a href="main.html" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="#" class="current">发布微博</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon">
										<i class="icon-align-justify"></i>									
									</span>
									<h5>发布微博</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="eform" action="Publish.action" class="form-horizontal" method="post" />
	                                    <div id="info1" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	微博内容:
	                                        </label>
	                                        <div class="controls">
	                                            <textarea  name="content" id="jname" style="width:700px;height:400px"></textarea>
	                                        </div>
	                                    </div>
	                                    <div class="form-actions">
	                                        <input type="submit" value="提交" class="btn btn-primary" />
	                                        <input type="reset" value="重置" class="btn btn-primary" />
	                                    </div>
	                                </form>
								</div>
							</div>			
						</div>
				</div>	
			</div>	
		<c:choose>
		<c:when test="${info==0}">
            <div class="alert alert-error">
    	 保存失败
            </div>
		</c:when>
		<c:when test="${info==1}">
            <div class="alert alert-success">
       	 保存成功
            </div>
        </c:when>
		</c:choose>
			
		</div>
        <div class="row-fluid">&nbsp;</div>
        <div class="row-fluid">
            <div id="footer" class="span12">
                2016 &copy; Iblog-go sharing!
            </div>
        </div>
		
	</body>
</html>
