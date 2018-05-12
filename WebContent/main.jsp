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
					$("#searchForm").submit();
				}
			});
			
			$("button[nm='BlogDetail']").click(function(){
				var p = $(this).attr("blogID");
				$("input[name='blogID']").val(p);
				$("#blogForm").submit();
			});
			
			$("button[nm='GotoOtherspace']").click(function(){
				var p = $(this).attr("otherID");
				var q = $(this).attr("myID");
				if(p==q){
					location.href = "GotoMyspace.action";
				}else{
					$("input[name='otherID']").val(p);
					$("#otherspaceForm").submit();
				}
				
			});
			
		});
		
		function resetForm(){
			$('#searchName').val("");
			$("#beginTime").val("");
			$("#endTime").val("");
			$("#searchForm").submit();
		}
		
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
                    <a href="publish.jsp">
                        <i class="icon icon-pub"></i> 
                        <span>发布微博</span>
                    </a>
                </li>
            </ul>
        </div>
        
        
		<div id="content">
			<div id="content-header">
				<h1>首页</h1>
			</div>
			<form action="BlogDetail.action" method="post" name="blogForm" id="blogForm">
				<input type="hidden" name="blogID" id="blogID" value=""/>
			</form>
			<form action="GotoOtherspace.action" method="post" name="otherspaceForm" id="otherspaceForm">
				<input type="hidden" name="otherID" id="otherID" value=""/>
			</form>
			<form action="RefreshMainPage.action" method="post" name="searchForm" id="searchForm">
			<input type="hidden" name="pagenumber" id="pagenumber" value="${pagenum }"/>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="control-group">
						<span class="span3">
							发布人：<input value="${searchname}" id="searchName" name="searchName" type="text" style="width:65%"/>
						</span>
						<span class="span6">
							发布时间：
                            <input value="${searchBeginTime }" id="beginTime" name="beginTime" type="date" style="width:35%"/>
                            -
                            <input value="${searchEndTime }" id="endTime" name="endTime" type="date" style="width:35%"/>
						</span>
                        <span class="span3">
							<button class="btn btn-info" type="submit">
								<i class="icon-white icon-search"></i>
								查询
							</button>
							<button id="reset" name="reset" type="button" class="btn btn-info" onclick="resetForm();">
								<i class="icon-white icon-repeat"></i>
								重置
							</button>
							<button id="reset" name="reset" type="submit" class="btn btn-info">
								<i class="icon-white icon-repeat"></i>
								刷新
							</button>
						</span>
					</div>
				</div>
			</div>
			</form>
			<hr/>
			<div class="row-fluid">  
				<div class="span12">
					<div class="widget-box">
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>用户</th>
										<th>发布微博内容</th>
										<th>时间</th>
										<th>点击量</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
                                    <c:forEach var="blog" items="${blogs}">
										<tr>
											<td>${blog.nickname}</td>
                                        	<td>${blog.content}</td>
                                        	<td>${blog.newstime}</td>
                                        	<td>${blog.hits}</td>
											<td>
												<button class="btn btn-info" nm="BlogDetail" blogID="${blog.blogID}">
													<i class="icon-white icon-eye-open"></i>
                                        			详细
                                        		</button>
                                        		<button class="btn btn-info" nm="GotoOtherspace" otherID="${blog.userID}" myID="${user.userID}">
                                        			<i class="icon-white icon-user"></i>
                                        			查看博主信息
                                        		</button>
                                        	</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>							
						</div>
					</div>
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
		
		
        <div class="row-fluid">&nbsp;</div>
        <div class="row-fluid">
            <div id="footer" class="span12">
                2016 &copy; Iblog-go sharing!
            </div>
        </div>
		
	</body>
</html>
