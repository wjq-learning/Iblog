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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="js/jquery.min.js"></script>  
        <script src="js/unicorn.login.js"></script>
        <script type="text/javascript" language="javascript">
        $(document).ready(function(){
        	$("#pagecut a").click(function (){
				var p = $(this).attr("page");
				$("input[name='pagenumber']").val(p);
				if(p < 1 || p > ${maxPage}) {
					
				}
				else {
					$("#otherspaceForm").submit();
				}
			});
        	
        	$("button[nm='BlogDetail']").click(function(){
				var p = $(this).attr("blogID");
				$("input[name='blogID']").val(p);
				$("#blogForm").submit();
			});
        	
        	$("button[nm='follow']").click(function(){
				$("#followForm").submit();
			});
			
		});
		</script>
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
                    <a href="#">
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
                    <a href="publish.jsp">
                        <i class="icon icon-pub"></i> 
                        <span>发布微博</span>
                    </a>
                </li>
            </ul>
        </div>
        
        
        <div id="content">
			<div id="content-header">
				<h1>查看个人信息</h1>
			</div>
			<form action="BlogDetail.action" method="post" name="blogForm" id="blogForm">
				<input type="hidden" name="blogID" id="blogID" value=""/>
			</form>
			<form action="Follow.action" method="post" name="followForm" id="followForm">
				<input type="hidden" name="followed" id="followed" value="${followed}"/>
				<input type="hidden" name="followUserID" id="followUserID" value="${other.userID}"/>
			</form>
			<form action="RefreshOtherspace.action" method="post" name="otherspaceForm" id="otherspaceForm">
				<input type="hidden" name="pagenumber" id="pagenumber" value="${pagenum }"/>
				<input type="hidden" name="otherID" id="otherID" value="${other.userID}"/>
			</form>
			<div id="breadcrumb">
				<a href="main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                    首页
                </a>
				<a href="#" class="current">查看个人信息</a>
			</div>
        	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>基础信息</h5>
							</div>
                            <table width="100%">
                            	<tr>
                                	<td width="15%" align="right">昵称:</td>
                                    <td width="60%" align="left">
                                    	&nbsp;&nbsp;
                                    	${other.nickname}
                                    </td>
                                    <td width="200px" rowspan="5">
                                    	<img src="img/head.jpg" width="200" height="160"></img>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                	<td align="right">注册时间:</td>
                                    <td align="left">
                                    	&nbsp;&nbsp;
                                    	<fmt:formatDate value="${other.registertime}" pattern="yyyy年MM月dd日"/>
                                    </td>
                                    <td></td>
                                </tr>
                                <c:choose>
                                <c:when test="${followed==1}">
                                <tr>
                                	<td align="right">
                                		<button class="btn btn-danger" nm="follow">
                                        			<i class="icon-white icon-minus"></i>
                                        			取消关注
                                        </button>
                                	</td>
                                </tr>
                                </c:when>
                                <c:otherwise>
                                <tr>
                                	<td align="right">
                                		<button class="btn btn-success" nm="follow">
                                        			<i class="icon-white icon-heart"></i>
                                        			关注
                                        </button>
                                	</td>
                                </tr>
                                </c:otherwise>
                                </c:choose>
                            </table>
						</div>			
					</div>
				</div>	
			</div>
        	<hr/>
        	
        	
        	<div class="row-fluid">  
				<div class="span12">
					<div class="widget-box">
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>微博</th>
										<th>发布时间</th>
										<th>点击量</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="blog" items="${blogs}">
	                                    <tr>
	                                        <td>${blog.content}</td>
	                                        <td>
	                           <fmt:formatDate value="${blog.newstime}" type="both" pattern="yyyy年MM月dd日  HH时mm分ss秒" />
	                                        </td>
	                                        <td>${blog.hits}</td>
	                                        <td>
	                                            <button class="btn btn-info" nm="BlogDetail" blogID="${blog.blogID}">
													<i class="icon-white icon-eye-open"></i>
                                        			详细
                                        		</button>
	                                        </td>
	                                    </tr>
	                                </c:forEach>
								</tbody>
							</table>							
						</div>
					</div>
				</div>

			<div class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
				<div id="pagecut" class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers">
				<a tabindex="0" href="#" page="1" class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default">首页</a>
				<a tabindex="0" href="#" page="${pagenum-1}" class="previous fg-button ui-button ui-state-default">上一页</a>
         	   <c:choose>
					<c:when test="${pagenum > 1}">
						<a tabindex="0" href="#" page="${pagenum-1}" class="fg-button ui-button ui-state-default">${pagenum-1}</a>
					</c:when>
				</c:choose>
				<a tabindex="0" page="${pagenum}" class="fg-button ui-button ui-state-default ui-state-disabled">${pagenum}</a>
				<c:choose>
					<c:when test="${pagenum < maxPage}">
 						<a tabindex="0" href="#" page="${pagenum+1}" class="fg-button ui-button ui-state-default">${pagenum+1}</a>
					</c:when>
				</c:choose>
            
           		 <a tabindex="0" href="#" page="${pagenum+1}" class="previous fg-button ui-button ui-state-default">下一页</a>
				<a tabindex="0" href="#" page="${maxPage}" class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default">尾页</a>
				</div>
			</div>
		</div>
        	
        	
        	
        <div class="row-fluid">&nbsp;</div>
        <div class="row-fluid">
            <div id="footer" class="span12">
                2016 &copy; Iblog-go sharing!
            </div>
        </div>
		
	</body>
</html>
        