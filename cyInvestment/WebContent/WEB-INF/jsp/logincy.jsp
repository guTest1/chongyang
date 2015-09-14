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
			<h1>用户登录</h1>
	        <div class="loginwapper">
				<form action="toLogincy.asp" method="post">
					<div class="loginsub">
						<label for="edit-customeridtype">登录方式 <span title="此项必填。">*</span></label>
						<select name="longinWay">
							<option value="2" selected="selected">开户证件号</option>
							<option value="1">基金账号</option>
						</select>
					</div>
					<div class="loginsub">
						<label for="edit-certificatetype">证件类型 <span title="此项必填。">*</span></label>
						<select name="certificateType">
							<option value="idcard">身份证</option>
							<option value="passport">中国护照</option>
							<option value="come">军官证</option>
							<option value="soldiers">士兵证</option>
							<option value="returncard">回乡证</option>
							<option value="register">户口本</option>
							<option value="civiliancard">文职证</option>
							<option value="policecard">警官证</option>
							<option value="other">其它</option>
						</select>
					</div>
					<div class="loginsub">
						<label for="edit-custid">账号/证件号 <span title="此项必填。">*</span></label>
						<input type="text" id="edit-custid" name="custID"/>
					</div>
					<div class="loginsub">
						<label for="edit-pwd">密码 <span title="此项必填。">*</span></label>
						<input type="password" id="edit-pwd" name="pwd"/>
					</div>
					<div class="loginyzm">
						<a href="javascript:void(0)" onclick="reloadCode()"><img src="verificationCode.asp" style="" width="80" height="25"/></a>
						<div class="loginchenge">
							<a href="javascript:void(0)" onclick="reloadCode()">更换</a>
						</div>
						<div class="loginsub">
							<label for="edit-captcha-response">验证码 <span title="此项必填。">*</span></label>
							<input type="text" id="edit-captcha-response" name="captcha_response" style="width: 208px;" />
						</div>
					</div>
					<e:if test="${loginError!=null}">
						<div class="loginsubmit">
							<span>**${loginError}</span>
						</div>
					</e:if>
					<div class="loginsubmit">
						<input type="submit" id="edit-submit" name="op" value="登录"/>
						<a href="forgetpwdcy.asp" target="_blank">忘记密码</a>
					</div>
				</form>
			</div>
		</div>
		<div class="loginprompt">
			<h2>温馨提示</h2>
			<p>此服务界面仅供计划持有人登录进行账户查询、信息定制以及账户资料修改等服务，无法进行网上交易。</p>
			<div style="height:10px"></div>
			<p>初始账户查询密码为您开户证件号码的后6位，字符以0代替，不足6位后面补0。</p>
			<div style="height:10px"></div>
			<p>请您登录后及时修改初始查询密码。如您忘记，请致电千石资本客户服务中心4000-2000-18。</p>
		</div>
	</div>
	<!-- content start -->
	<div class="line"></div>
	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
</body>
</html>