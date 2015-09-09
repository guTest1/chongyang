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
<title>${recommended.title} - 上海重阳投资管理股份有限公司</title>
<script src="<%=basePath %>js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
	    var k = $G("k");
	    if (k == 1) {
	        ClickLeftMenu('1');
	    }
	    else if (k == 2) {
	        ClickLeftMenu('2');
	    }
	    else if (k == 3) {
	        ClickLeftMenu('3');
	    }
	    else if (k == 4) {
	        ClickLeftMenu('4');
	    } else {
	        ClickLeftMenu('1');
	    }
	});
</script>
</head>
<body>
	<!-- header start -->
	<%@ include file="header.jsp"%>
	<!-- header end -->
	<!-- content start -->
	<div class="wapper clearfix">
        <img src="<%=basePath %>images/Default/banner_news.jpg" height="240" width="932"/>
    </div>
    <div class="wapper clearfix overhide">
        <div class="subleft">
            <a href="enjoycy.asp" class="on" id="menu01">重阳问答</a>
            <a href="enjoycy.asp?k=2" class="on" id="menu02">重阳视点</a>
            <a href="enjoycy.asp?k=3" class="on" id="menu03">重阳荐文</a>
        </div>
        <div class="rightcontent wordbox">
            <table id="ctl00_cpContent_DataList1" cellspacing="0" border="0" style="border-collapse:collapse;">
				<tr>
					<td>
                    	<table width="625" border="0" cellspacing="0" cellpadding="0">
                        	<tr>
                            	<td>
                                	<strong style="color: #0F3653; font-weight: bolder">${recommended.title}</strong>&nbsp;${recommended.releasedate} ${recommended.releasetime}&nbsp;&nbsp;
                                </td>
                        	</tr>
                        	<tr>
	                            <td style="color: #7b7b7b">
	                                <br/>
	                                <e:if test="${recommended.author!=null}">
	                                	<p style="text-align: right; margin: 7.8pt 0cm 0pt; line-height: 200%; text-indent: 18pt; mso-para-margin-top: .5gd; mso-char-indent-count: 2.0" align="right">
	                                		<span style="font-size: 9pt; font-family: 宋体; line-height: 200%; mso-ascii-theme-font: minor-fareast; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-fareast">
	                                			作者：${recommended.author}
	                                		</span>
	                                	</p>
	                                </e:if>
	                                ${recommended.content}
	                                <e:if test="${recommended.source!=null}">
	                                	<p style="margin: 7.8pt 0cm 0pt; line-height: 200%; text-indent: 18pt; mso-para-margin-top: .5gd; mso-char-indent-count: 2.0">
	                                		<span style="font-size: 9pt; font-family: 宋体; line-height: 200%; mso-ascii-theme-font: minor-fareast; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-fareast">
	                                			（来源：${recommended.source}）
	                                		</span>
	                                	</p>
	                                </e:if>
	                            </td>
                        	</tr>
                    	</table>
                	</td>
				</tr>
			</table>
        </div>
    </div>
	<div class="line"></div>
	<!-- content end -->
	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
</body>
</html>