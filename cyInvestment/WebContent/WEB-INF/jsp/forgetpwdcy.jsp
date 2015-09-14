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
    		<h1 style="text-align:center">忘记密码常见问题</h1>
			<div class="forgetpwd">
				<p style="text-indent:2em;"><strong><br />1. 我从来没有设置过登录密码，首次登录时应该输入什么密码？</strong></p>
				<p></p>
				<p style="text-indent:2em;"><span style="text-indent:0em;">您通过</span><span style="text-indent:0em;">国金通用网上交易系统或电话语音系统自助查询账户信息时，需要输入查询密码。初始查询密码为您开户证件号码的后6位，号码不足6位的，请在后面补“0”；如果开户证件号码中出现非数字字符，请用“0”代替。为了保护您的账户信息安全，初次登录后，建议您点击页面左侧的“账户查询密码修改”，以重新设置您的查询密码。</span></p>
				<p style="text-indent:0em;"><strong>2. 查询密码连续6次输入错误，系统提示密码被锁，我该怎么办？</strong></p>
				<p></p>
				<p style="text-indent:2em;">密码被锁定仅表示您无法使用查询密码通过国金通用网站或电话语音系统自助查询账户，并不会影响您的正常交易，您不必过于担心。如果查询密码连续输错6次，密码当日会被锁定，第二日系统会自动解锁密码。若您需要当日解锁密码，可以拨打国金通用客户服务电话4000-2000-18，接通后按0转人工服务，我们的工作人员会在核实您的身份信息后为您办理解锁。</p>
				<p><strong>3. 我忘记了查询密码，如何找回？</strong></p>
				<p></p>
				<p style="text-indent:2em;">若您忘记了查询密码，可以拨打国金通用客户服务电话4000-2000-18，接通后按0转人工服务，我们的工作人员会在核实您的身份信息后为您重置密码。</p>
			</div>
		</div>
	</div>
	<!-- content start -->
	<div class="line"></div>
	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
</body>
</html>