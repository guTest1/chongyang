<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="e"%>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录 - 上海重阳投资管理股份有限公司</title>
<script src="<%=basePath %>js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	function reloadCode(){
		$(".loginyzm").find("img").attr("src","verificationCode.asp?t=" + Math.random());
	}
</script>
</head>
<body>
	<!-- header start -->
	<%@ include file="header.jsp"%>
	<!-- header end -->
	<!-- content start -->
    <div class="wapper clearfix">
        <img src="<%=basePath %>images/Default/login.jpg" height="140" width="932"/>
    </div>
    <div class="wapper">
		<div class="loginhome">
			<h1 style="text-align:center;font-size:20px;color:#ec0000;padding-top:10px">用户信息</h1>
	        <table cellSpacing=0 border=0 width="100%">
	        	<tr>
	        		<td align="right" width="50%" style="font-weight: bold;">姓名：</td>
	        		<td align="left" width="50%">${user.name}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">手机：</td>
	        		<td align="left">${user.phone}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">基金账号：</td>
	        		<td align="left">${user.fundcode}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">身份证：</td>
	        		<td align="left">${user.idcard}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">中国护照：</td>
	        		<td align="left">${user.passport}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">军官证：</td>
	        		<td align="left">${user.come}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">士兵证：</td>
	        		<td align="left">${user.soldiers}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">回乡证：</td>
	        		<td align="left">${user.returncard}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">户口本：</td>
	        		<td align="left">${user.register}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">文职证：</td>
	        		<td align="left">${user.civiliancard}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">警官证：</td>
	        		<td align="left">${user.policecard}</td>
	        	</tr>
	        	<tr>
	        		<td align="right" style="font-weight: bold;">其他：</td>
	        		<td align="left">${user.other}</td>
	        	</tr>
	        </table>
		</div>
	</div>
	<!-- content start -->
	<div class="line"></div>
	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
</body>
</html>