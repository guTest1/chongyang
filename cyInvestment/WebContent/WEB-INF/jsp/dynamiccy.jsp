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
<title>重阳动态 - 上海重阳投资管理股份有限公司</title>
<script src="<%=basePath %>js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        var k = $G("k");
        if (k == 1) {
            ClickLeftMenu('1');
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
        <img src="<%=basePath %>images/Default/banner_profile.jpg" height="240" width="932"/>
    </div>
    <div class="wapper clearfix overhide">
		<div class="subleft">
            <a href="dynamiccy.asp" class="on" onclick="ClickLeftMenu('1');" id="menu01">重阳动态</a>
        </div>
        <div id="page01" class="rightcontent wordbox" style="display: none;">
            <div id="ctl00_cpContent_UpdatePanel1">
				<table id="ctl00_cpContent_DataList1" cellspacing="0" border="0" style="border-collapse:collapse;">
					<e:forEach items="${requestScope.page.results}" var="dynamic">
						<tr>
							<td>
								<table width="625" border="0" cellspacing="0" cellpadding="0">
		                        	<tr>
		                            	<td width="505">
		                                 	<a href='dynamicInfocy.asp?id=${dynamic.id}'>${dynamic.title}</a>
		                             	</td>
		                             	<td width="120" align="right" style="font-family: Tahoma;">
		                             		${dynamic.releasedate}
		                             	</td>
		                         	</tr>
		                         	<tr>
										<td colspan="2">
		                             		<hr style="height:1px;border:none;border-top:1px dashed black;"/>
		                             	</td>
		                         	</tr>
	                         	</table>
	                    	</td>
						</tr>
					</e:forEach>
				</table>
				<div id="ctl00_cpContent_AspNetPager1">
					<table width="625" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="bottom" align="left">
								<font color='#0C3855'>${page.totalRecord}</font>条/<font color='#0C3855'>${page.totalPage}</font>页
							</td>
							<td valign="bottom" align="right">
								<e:choose>
									<e:when test="${page.pageNo==1}">
										<a href="javascript:void(0)">首页</a>
										<a href="javascript:void(0)" style="font-size:18px;width:15px;">&laquo;</a>
									</e:when>
									<e:otherwise>
										<a href="dynamiccy.asp?currentPage=1">首页</a>
										<a href="dynamiccy.asp?currentPage=${page.pageNo - 1}" style="font-size:18px;width:15px;">&laquo;</a>
									</e:otherwise>
								</e:choose>
								<e:forEach items="${requestScope.pageRolling}" var="pageNumber" varStatus="status">
					                <e:choose>
										<e:when test="${pageNumber==page.pageNo}">
											<a href="dynamiccy.asp?currentPage=${pageNumber}" style="font-size:14px;width:15px;color:red;">${pageNumber}</a>
										</e:when>
										<e:otherwise>
											<a href="dynamiccy.asp?currentPage=${pageNumber}" style="font-size:14px;width:15px;">${pageNumber}</a>
										</e:otherwise>
									</e:choose>
					            </e:forEach>
					            <e:choose>
									<e:when test="${page.pageNo==page.totalPage}">
										<a href="javascript:void(0)" style="font-size:18px;width:15px;">&raquo;</a>
					            		<a href="javascript:void(0)">末页</a>
									</e:when>
									<e:otherwise>
										<a href="dynamiccy.asp?currentPage=${page.pageNo + 1}" style="font-size:18px;width:15px;">&raquo;</a>
					            		<a href="dynamiccy.asp?currentPage=${page.totalPage}">末页</a>
									</e:otherwise>
								</e:choose>
							</td>
						</tr>
					</table>
				</div>
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