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
<title>思享重阳 - 上海重阳投资管理股份有限公司</title>
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
    	<!-- left start -->
        <div class="subleft">
            <a href="enjoycy.asp" class="on" onclick="ClickLeftMenu('1');" id="menu01">重阳问答</a>
            <a href="enjoycy.asp?k=2" class="on" onclick="ClickLeftMenu('2');" id="menu02">重阳视点</a>
            <a href="enjoycy.asp?k=3" class="on" onclick="ClickLeftMenu('3');" id="menu03">重阳荐文</a>
        </div>
        <!-- left end -->
        <!-- page1 start -->
        <div id="page01" class="rightcontent wordbox" style="display: none;">
            <div id="ctl00_cpContent_UpdatePanel1">
				<table id="ctl00_cpContent_DataList1" cellspacing="0" border="0" style="border-collapse:collapse;">
					<e:forEach items="${requestScope.question_page.results}" var="question">
						<tr>
							<td>
								<table width="625" border="0" cellspacing="0" cellpadding="0">
	                            	<tr>
	                                	<td width="505">
	                                        <a href='questionInfocy.asp?id=${question.id}'>${question.title}</a>
	                                    </td>
	                                    <td width="120" align="right" style="font-family: Tahoma;">
	                                        ${question.releasedate}
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
				<!-- page1 paging start -->
				<div id="ctl00_cpContent_AspNetPager1">
					<table width="625" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="bottom" align="left">
								<font color='#0C3855'>${question_page.totalRecord}</font>条/<font color='#0C3855'>${question_page.totalPage}</font>页
							</td>
							<td valign="bottom" align="right">
								<e:choose>
									<e:when test="${question_page.pageNo==1}">
										<a href="javascript:void(0)">首页</a>
										<a href="javascript:void(0)" style="font-size:18px;width:15px;">&laquo;</a>
									</e:when>
									<e:otherwise>
										<a href="enjoycy.asp?currentPage=1">首页</a>
										<a href="enjoycy.asp?currentPage=${question_page.pageNo - 1}" style="font-size:18px;width:15px;">&laquo;</a>
									</e:otherwise>
								</e:choose>
								<e:forEach items="${requestScope.question_pageRolling}" var="question_pageNumber" varStatus="status">
					                <e:choose>
										<e:when test="${question_pageNumber==question_page.pageNo}">
											<a href="enjoycy.asp?currentPage=${question_pageNumber}" style="font-size:14px;width:15px;color:red;">${question_pageNumber}</a>
										</e:when>
										<e:otherwise>
											<a href="enjoycy.asp?currentPage=${question_pageNumber}" style="font-size:14px;width:15px;">${question_pageNumber}</a>
										</e:otherwise>
									</e:choose>
					            </e:forEach>
					            <e:choose>
									<e:when test="${question_page.pageNo==question_page.totalPage}">
										<a href="javascript:void(0)" style="font-size:18px;width:15px;">&raquo;</a>
					            		<a href="javascript:void(0)">末页</a>
									</e:when>
									<e:otherwise>
										<a href="enjoycy.asp?currentPage=${question_page.pageNo + 1}" style="font-size:18px;width:15px;">&raquo;</a>
					            		<a href="enjoycy.asp?currentPage=${question_page.totalPage}">末页</a>
									</e:otherwise>
								</e:choose>
							</td>
						</tr>
					</table>
				</div>
				<!-- page1 paging end -->
			</div>
		</div>
        <!-- page1 end -->
        <!-- page2 start -->
        <div id="page02" class="rightcontent wordbox" style="display: none;">
            <div id="ctl00_cpContent_UpdatePanel2">
                <table id="ctl00_cpContent_DataList2" cellspacing="0" border="0" style="border-collapse:collapse;">
					<e:forEach items="${requestScope.view_page.results}" var="view">
						<tr>
							<td>
								<table width="625" border="0" cellspacing="0" cellpadding="0">
	                                <tr>
	                                    <td width="505">
	                                        <a href='viewInfocy.asp?id=${view.id}&k=2'><e:if test="${view.author!=null}">${view.author}：</e:if>${view.title}</a>
	                                    </td>
	                                    <td width="120" align="right" style="font-family: Tahoma;">
	                                        ${view.releasedate}
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
				<!-- page2 paging start -->
				<div id="ctl00_cpContent_AspNetPager2">
					<table width="625" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="bottom" align="left">
								<font color='#0C3855'>${view_page.totalRecord}</font>条/<font color='#0C3855'>${view_page.totalPage}</font>页
							</td>
							<td valign="bottom" align="right">
								<e:choose>
									<e:when test="${view_page.pageNo==1}">
										<a href="javascript:void(0)">首页</a>
										<a href="javascript:void(0)" style="font-size:18px;width:15px;">&laquo;</a>
									</e:when>
									<e:otherwise>
										<a href="enjoycy.asp?k=2&currentPage=1">首页</a>
										<a href="enjoycy.asp?k=2&currentPage=${view_page.pageNo - 1}" style="font-size:18px;width:15px;">&laquo;</a>
									</e:otherwise>
								</e:choose>
								<e:forEach items="${requestScope.view_pageRolling}" var="view_pageNumber" varStatus="status">
					                <e:choose>
										<e:when test="${view_pageNumber==view_page.pageNo}">
											<a href="enjoycy.asp?k=2&currentPage=${view_pageNumber}" style="font-size:14px;width:15px;color:red;">${view_pageNumber}</a>
										</e:when>
										<e:otherwise>
											<a href="enjoycy.asp?k=2&currentPage=${view_pageNumber}" style="font-size:14px;width:15px;">${view_pageNumber}</a>
										</e:otherwise>
									</e:choose>
					            </e:forEach>
					            <e:choose>
									<e:when test="${view_page.pageNo==view_page.totalPage}">
										<a href="javascript:void(0)" style="font-size:18px;width:15px;">&raquo;</a>
					            		<a href="javascript:void(0)">末页</a>
									</e:when>
									<e:otherwise>
										<a href="enjoycy.asp?k=2&currentPage=${view_page.pageNo + 1}" style="font-size:18px;width:15px;">&raquo;</a>
					            		<a href="enjoycy.asp?k=2&currentPage=${view_page.totalPage}">末页</a>
									</e:otherwise>
								</e:choose>
							</td>
						</tr>
					</table>
				</div>
				<!-- page2 paging end -->
			</div>
        </div>
        <!-- page2 end -->
        <!-- page3 start -->
        <div id="page03" class="rightcontent wordbox" style="display: none;">
            <div id="ctl00_cpContent_UpdatePanel3">
				<table id="ctl00_cpContent_DataList3" cellspacing="0" border="0" style="border-collapse:collapse;">
					<e:forEach items="${requestScope.recommended_page.results}" var="recommended">
						<tr>
							<td>
								<table width="625" border="0" cellspacing="0" cellpadding="0">
	                                <tr>
	                                    <td width="505">
	                                        <a href='recommendedInfocy.asp?id=${recommended.id}&k=3'>${recommended.title}</a>
	                                    </td>
	                                    <td width="120" align="right" style="font-family: Tahoma;">
	                                        ${recommended.releasedate}
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
				<!-- page3 paging start -->
				<div id="ctl00_cpContent_AspNetPager3">
					<table width="625" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="bottom" align="left">
								<font color='#0C3855'>${recommended_page.totalRecord}</font>条/<font color='#0C3855'>${recommended_page.totalPage}</font>页
							</td>
							<td valign="bottom" align="right">
								<e:choose>
									<e:when test="${recommended_page.pageNo==1}">
										<a href="javascript:void(0)">首页</a>
										<a href="javascript:void(0)" style="font-size:18px;width:15px;">&laquo;</a>
									</e:when>
									<e:otherwise>
										<a href="enjoycy.asp?k=3&currentPage=1">首页</a>
										<a href="enjoycy.asp?k=3&currentPage=${recommended_page.pageNo - 1}" style="font-size:18px;width:15px;">&laquo;</a>
									</e:otherwise>
								</e:choose>
								<e:forEach items="${requestScope.recommended_pageRolling}" var="recommended_pageNumber" varStatus="status">
					                <e:choose>
										<e:when test="${recommended_pageNumber==recommended_page.pageNo}">
											<a href="enjoycy.asp?k=3&currentPage=${recommended_pageNumber}" style="font-size:14px;width:15px;color:red;">${recommended_pageNumber}</a>
										</e:when>
										<e:otherwise>
											<a href="enjoycy.asp?k=3&currentPage=${recommended_pageNumber}" style="font-size:14px;width:15px;">${recommended_pageNumber}</a>
										</e:otherwise>
									</e:choose>
					            </e:forEach>
					            <e:choose>
									<e:when test="${recommended_page.pageNo==recommended_page.totalPage}">
										<a href="javascript:void(0)" style="font-size:18px;width:15px;">&raquo;</a>
					            		<a href="javascript:void(0)">末页</a>
									</e:when>
									<e:otherwise>
										<a href="enjoycy.asp?k=3&currentPage=${recommended_page.pageNo + 1}" style="font-size:18px;width:15px;">&raquo;</a>
					            		<a href="enjoycy.asp?k=3&currentPage=${recommended_page.totalPage}">末页</a>
									</e:otherwise>
								</e:choose>
							</td>
						</tr>
					</table>
				</div>
				<!-- page3 paging end -->
			</div>
        </div>
    </div>
	<div class="line"></div>
	<!-- content end -->
	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
</body>
</html>