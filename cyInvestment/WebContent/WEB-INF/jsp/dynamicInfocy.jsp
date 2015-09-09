<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${dynamic.title} - 上海重阳投资管理股份有限公司</title>
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
    	<img src="<%=basePath %>images/Default/banner_profile.jpg" height="240" width="932"/>
    </div>
    <div class="wapper clearfix overhide">
    	<div class="subleft">
            <a href="dynamiccy.asp" class="on" id="menu01">重阳资讯</a>
        </div>
        <div class="rightcontent wordbox">
            <table id="ctl00_cpContent_DataList1" cellspacing="0" border="0" style="border-collapse:collapse;">
				<tr>
					<td>
                    	<table width="625" border="0" cellspacing="0" cellpadding="0">
                        	<tr>
                            	<td>
                                	<strong style="color: #0F3653; font-weight: bolder">${dynamic.title}</strong>&nbsp;${dynamic.releasedate} ${dynamic.releasetime}&nbsp;&nbsp;
                                </td>
                        	</tr>
                        	<tr>
                            	<td style="color: #7b7b7b">
                                	<br />
									${dynamic.content}
									<p class="MsoNormal">
										${dynamic.department}
									</p>
									<p class="MsoNormal">
										${dateVo.year}年${dateVo.month}月${dateVo.date}日
									</p>
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