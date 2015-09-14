<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.guql.cy.vo.UserVo"%>
    
<%
	String headerPath = request.getContextPath();
	String headerBasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + headerPath + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="<%=headerBasePath %>css/common.css" type="text/css" rel="stylesheet"/>
<link href="<%=headerBasePath %>css/css.css" type="text/css" rel="stylesheet" />
<script src="<%=headerBasePath %>js/common.js" type="text/javascript"></script>
</head>
<body>
	<div class="wapper header">
		<a href="homecy.asp" class="fl">
			<img src="<%=headerBasePath %>images/Default/logo.jpg">
		</a>
    	<table height="10px" border="0" cellspacing="0" cellpadding="0" style="margin-left: 10px;margin-right: 0px;">
        	<tr>
            	<td width="1130" height="5" align="right">
            		<% 
            			String url = request.getRequestURI();
            			url = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."));
            			
            			UserVo currentUser = (UserVo)session.getAttribute("currentUser");
            			if(currentUser != null){
            		%>
            		<a href="exitcy.asp?url=<%= url %>&query=<%= request.getQueryString() %>">退出</a>
            		<font style="text-align: right;color:red;margin-right:20px;"><b>欢迎<%= currentUser.getName() %></b></font>
					<% }%>
            	</td>
            	<td width="50" style="padding-top: 0px; text-align: right;" valign="top">
                	<a href="homecy.asp">
                		<font style="font-family: Arial; font-size: 12px; text-align: right;" color="#001c43"><b>中文</b></font>
                	</a>
            	</td>
            	<td width="20px" valign="top" style="padding-top: 0px; color: #001c43; text-align: center;">|</td>
            	<td width="50" style="padding-top: 0px; text-align: left;" valign="top">
                	<a href="http://www.chongyang.net/English">
                		<font style="font-family: Arial; font-size: 12px;text-align: left;" color="#001c43"><b>English</b></font>
                	</a>
            	</td>
        	</tr>
    	</table>
    	<ul class="menu">
        	<li><a href="homecy.asp">首页</a></li>
        	<li><a href="aboutcy.asp">走近重阳</a>
            <p class="submenu">
                <a href="aboutcy.asp">关于重阳</a>
                <a href="aboutcy.asp?k=2">投资理念</a>
                <a href="aboutcy.asp?k=5">合规风控</a>
                <a href="aboutcy.asp?k=4">投研核心</a>
                <a href="aboutcy.asp?k=3">基金经理</a>
                <a href="aboutcy.asp?k=6">联系我们</a>
                <i class="sj"></i>
                <i class="rightborder"></i>
            </p>
        	</li>
        	<li id="m_profile"><a href="dynamiccy.asp">重阳动态</a></li>
        	<li id="m_info">
        		<a href="enjoycy.asp">思享重阳</a>
            	<p class="submenu">
                	<a href="enjoycy.asp">重阳问答</a>
                	<a href="enjoycy.asp?k=2">重阳视点</a>
                	<a href="enjoycy.asp?k=3">重阳荐文</a>
                	<i class="sj"></i>
                	<i class="rightborder"></i>
                </p>
        	</li>
        	<li id="m_pro">
        		<a href="productscy.asp">产品与服务</a>
            	<p class="submenu">
                	<a href="productscy.asp">信托产品</a>
                	<a href="productscy.asp?k=2">网上预约</a>
                	<a href="productscy.asp?k=3">认购流程</a>
                	<a href="productscy.asp?k=4">常见问题</a>
                	<a href="productscy.asp?k=5">产品咨询</a>
                	<i class="sj"></i>
                	<i class="rightborder"></i>
                </p>
        	</li>
        	<li class="last"><a href="logincy.asp">客户登录</a></li>
    	</ul>
	</div>
</body>
</html>