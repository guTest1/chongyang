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
<title>重阳投资 - 上海重阳投资管理股份有限公司</title>
<script src="<%=basePath %>js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	/*第一种形式 第二种形式 更换显示样式*/
	function setTab(name, cursel, n) {
	    if (cursel == 1) {
	        $("#tabMove").attr("href", "dynamiccy.asp");
	    } else if (cursel == 2) {
	        $("#tabMove").attr("href", "enjoycy.asp");
	    } else {
	        $("#tabMove").attr("href", "enjoycy.asp?k=2");
	    }
	    for (i = 1; i <= n; i++) {
	        var menu = document.getElementById(name + i);
	        var con = document.getElementById("con_" + name + "_" + i);
	        menu.className = i == cursel ? "hover" : "";
	        con.style.display = i == cursel ? "block" : "none";
	    }
	}
	function scroll() {
		var z = $(".banner li").size();
        var w = (z + 1) * 690;
        var i = 0;
        $(".banner li").first().clone().appendTo(".banner");
        $(".banner").width(w);
        $(".a_right").click(function() {
            if (i + z <= 0) {
                i = 0; $(".banner").css({ "left": 0 });
            }
            i--;
            scroll(i);
        });
        $(".a_left").click(function() {
            if (i >= 0) { i = -z; }
            $(".banner").css({ "left": i * 690 });
            i++;
            scroll(i);
        });

        function scroll(m) {
            $(".banner").animate({ "left": m * 690 }, 1000);
            if (i + z <= 0) { i = 1; }
            if (i >= 0) { i = -z; }
        }
	}

	$(function() {
		$(".float-pic>div").hover(
			function() {
			    $(this).children("div").show().siblings("div").hide();
			},
			function() {
			    $(this).children("div").hide();
			}
		);
	    scroll();
        //随即选中tab
        var tabNum = parseInt(Math.random() * 2 + 1);
        if (tabNum == 1)
            tabNum = 3;
        if (tabNum == 2)
            tabNum = 1;
        setTab('one', tabNum, 3)
	});

    //定时滚动
    window.setInterval(doScroll,5000);
    function doScroll() {
        $(".a_right").click();
    } 
   </script>
</head>
<body>
	<!-- header start -->
	<%@ include file="header.jsp"%>
	<!-- header end -->
	<!-- content start -->
	<div class="wapper clearfix" style="height:260px;">
    	<div class="columnl" style="height:250px;">
            <span><a href="http://club.chongyang.net" target="_blank">点击进入</a></span>
            <ul>
                <li><a href="products.aspx?k=3" class="on">认购流程</a></li>
                <li><a href="products.aspx?k=2">网上预约</a></li>
                <li><a href="aboutcy.asp?k=6">联系我们</a></li>
                <li><a href="job.aspx">招聘中心</a></li>
            </ul>
        </div>
        <!--banner  begin-->
        <div class="banner_box" style="height:250px;">
            <ul class="banner">
                <li><a href="javascript:void(0)">
                    <img src="<%=basePath %>images/Default/banner_1.jpg" width="690" height="250"></a></li>
                <li><a href="javascript:void(0)">
                    <img src="<%=basePath %>images/Default/banner_2.jpg" width="690" height="250"></a></li>
                <li><a href="javascript:void(0)">
                    <img src="<%=basePath %>images/Default/banner_3.jpg" width="690" height="250"></a></li>
                <li><a href="javascript:void(0)">
                    <img src="<%=basePath %>images/Default/banner_4.jpg" width="690" height="250"></a></li>
                <li><a href="javascript:void(0)">
                    <img src="<%=basePath %>images/Default/banner_5.jpg" width="690" height="250"></a></li>
            </ul>
            <a href="javascript:void(0)" class="a_left"></a><a href="javascript:void(0)" class="a_right"></a>
        </div>
        <!--banner  end-->
    </div>
    <div class="line"></div>
    <div class="column">
        <div id="Tab1">
            <div class="Menubox">
                <ul>
                    <li id="one3" onmouseover="setTab('one',3,3)"  class="hover">重阳视点</li>
                    <li id="one1" onmouseover="setTab('one',1,3)">重阳动态</li>
                    <li id="one2" onmouseover="setTab('one',2,3)">重阳问答 </li>
                </ul>
                <a href="CYRecommend.aspx?k=2" id="tabMove">
                    <img src="<%=basePath %>images/Default/more.png" width="64" height="19" alt="more" /></a>
            </div>
            <div class="Contentbox">
            	<!----重阳动态---->
                <div id="con_one_1" style="display:none;">
                    <dl>
                        <dt>${first_dynamic.title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${first_dynamic.releasedate}</dt>
                        <dd>${first_dynamic.content}
							［<a id="ctl00_cpContent_hlDetail3" href="dynamicInfocy.asp?id=${first_dynamic.id}">详细</a>］
                        </dd>
                    </dl>
                    <e:forEach items="${requestScope.dynamics}" var="dynamicList">
	                    <ul>
	                    	<e:forEach items="${dynamicList}" var="dynamic">
		                        <li><a target="_blank" href="dynamicInfocy.asp?id=${dynamic.id}" title="${dynamic.title}">
		                        	 ${dynamic.title}</a></li>
	                       	</e:forEach>
	                    </ul>
                    </e:forEach>
                </div>
                <!----重阳问答---->
                <div id="con_one_2" style="display: none">
                    <dl>
                        <dt>${first_question.title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${first_question.releasedate}</dt>
                        <dd>${first_question.content}
							［<a id="ctl00_cpContent_hlDetail1" href="questionInfocy.asp?id=${first_question.id}">详细</a>］
                        </dd>
                    </dl>
                    <e:forEach items="${requestScope.questions}" var="questionList">
	                    <ul>
	                    	<e:forEach items="${questionList}" var="question">
		                        <li><a target="_blank" href="questionInfocy.asp?id=${question.id}" title="${question.title}">
									${question.title}</a></li>
							</e:forEach>
	                    </ul>
                    </e:forEach>
                </div>
                <!----重阳视点---->
                <div id="con_one_3"  class="hover">
                    <dl>
                        <dt>${first_view.title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${first_view.releasedate}</dt>
                        <dd>${first_view.content}
							［<a id="ctl00_cpContent_hlDetail2" href="viewInfocy.asp?id=${first_view.id}&k=2">详细</a>］
                        </dd>
                    </dl>
                    <e:forEach items="${requestScope.views}" var="viewList">
	                    <ul>
	                    	<e:forEach items="${viewList}" var="view">
		                        <li><a target="_blank" href="viewInfocy.asp?id=${view.id}&k=2" title="${view.title}">
									<e:if test="${view.author!=null}">${view.author}：</e:if>${view.title}</a></li>
							</e:forEach>
	                    </ul>
                    </e:forEach>
                </div>
            </div>
        </div>
        <!----重阳荐文---->
        <div class="sidebar">
            <h1>重阳荐文<a href="enjoycy.asp?k=3"><img src="<%=basePath %>images/Default/more.png" width="64" height="19" /></a></h1>
            <ul>
            	<e:forEach items="${recommendedList}" var="recommended">
	            	<li><a target="_blank"	href="recommendedInfocy.asp?id=${recommended.id}&k=3" title="${recommended.title}">
						<e:if test="${recommended.author!=null}">${recommended.author}：</e:if>${recommended.title}</a></li>
				</e:forEach>
            </ul>
        </div>
    </div>
    <!--右侧微信、微博、名言  Begion-->
    <div class="piao">
        <div class="float-pic">
            <div>
                <img src="<%=basePath %>images/float-right-a.png"/>
                <div class="float-pic-f" style="height:110px; width:96px; align:center; line-height:25px;">
                    <img src="<%=basePath %>images/weibo.png" />扫描关注重阳微信
                    <img src="<%=basePath %>images/sanjiao.png" class="float-sanjiao"/>
                </div>
            </div>
            <div>
                <a href="http://weibo.com/chongyanginvestment/home?topnav=1&wvr=5&from=company" target="_blank">
                    <img src="<%=basePath %>images/float-right-b.png" />
                </a>
            </div>
            <div>
                <img src="<%=basePath %>images/float-right-c.png" />
                <div class="float-pic-f2">
                    <!--名人名言-->
                    <span>极高寓于极平，至难出于至易；有意者反远，无心者自近也。</span><br />
                    <span class="float-zi-f">——《菜根谭》</span>
                    <img src="<%=basePath %>images/sanjiao.png" class="float-sanjiao" />
                </div>
            </div>
        </div>
    </div>
    <div class="line"></div>
    <!--右侧微信、微博、名言  end-->
    <!--图片区  Begin-->
    <div class="column">
        <table width="930" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="314">
                    <img src="<%=basePath %>images/Default/index2_07.jpg" width="303" height="200" />
                </td>
                <td width="313">
                    <img src="<%=basePath %>images/Default/index2_09.jpg" width="303" height="200" />
                </td>
                <td width="303">
                    <img src="<%=basePath %>images/Default/index2_11.jpg" width="303" height="200" />
                </td>
            </tr>
        </table>
    </div>
    <!--图片区  end-->
	<div class="line"></div>
	<!-- content end -->
	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
</body>
</html>