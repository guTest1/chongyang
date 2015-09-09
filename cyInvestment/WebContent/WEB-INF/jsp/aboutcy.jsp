<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>走近重阳 - 上海重阳投资管理股份有限公司</title>
<script src="<%=basePath %>js/jquery.js" type="text/javascript"></script>
<style type="text/css">
	td p{text-indent: 0em;}
</style>
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
        }
        else if (k == 5) {
            ClickLeftMenu('5');
        }
        else if (k == 6) {
            ClickLeftMenu('6');
            setTimeout(function(){
            	showMap();
            },500);
        } else {
            ClickLeftMenu('1');
        }
    });
    
    function showMap(){
    	window.adderMap.initMap();
    }
</script>
</head>
<body>
	<!-- header start -->
	<%@ include file="header.jsp"%>
	<!-- header end -->
	<!-- content start -->
	<div class="wapper clearfix">
        <img src="<%=basePath %>images/Default/banner_about.jpg" height="240" width="932" />
    </div>
    <div class="wapper clearfix overhide">
    	<!-- left menu start -->
		<div class="subleft">
            <a href="javascript:void(0);" class="on" onclick="ClickLeftMenu('1');" id="menu01" style="letter-spacing:0px;">关于重阳</a>
            <a href="javascript:void(0);" onclick="ClickLeftMenu('2');" id="menu02">投资理念</a>
            <a href="javascript:void(0);" onclick="ClickLeftMenu('5');" id="menu05" style="letter-spacing:0px;">合规风控</a>
            <a href="javascript:void(0);" onclick="ClickLeftMenu('4');" id="menu04" style="letter-spacing:0px;">投研核心</a>
            <a href="javascript:void(0);" onclick="ClickLeftMenu('3');" id="menu03" style="letter-spacing:0px;">基金经理</a>
            <a href="javascript:void(0);" onclick="ClickLeftMenu('6');showMap();" id="menu06">联系我们</a>
        </div>
        <!-- left menu end -->
        <!-- aboutCY start -->
        <div id="page01" class="rightcontent wordbox" style="display: none;">
        	<strong style="font-weight: bolder; color: #0B3953; font-size: 15px;">公司简介</strong>
            <p>2001年12月，上海重阳投资有限公司成立。2009年6月，专注于资产管理业务的上海重阳投资管理有限公司（重阳投资）成立。2014年7月，重阳投资改制为股份公司，注册资本为人民币两亿元。</p>
			<p>基于资产管理行业的特殊属性，重阳投资自成立起即采用合伙模式经营，合伙人会议是公司日常事务的最高决策机构。</p>
			<p>经过多年积累，重阳投资已拥有一支既富理论造诣又经市场锤炼的投研团队，投研员工超过30人。</p>
			<p>“客户利益第一”是重阳投资的核心经营理念。重阳投资旗下基金业绩优良，存续期最长的“重阳1期”自成立以来5年的年复合收益率为26%。2009年-2014年，重阳投资连续六年被评为“金牛私募基金管理公司”。 截止2014年底，重阳投资管理客户资产规模超过200亿元人民币。</p>
			<p>我国资产管理行业方兴未艾，重阳投资与时代同行。</p>
            <br/>
			<strong style="font-weight: bolder; color: #0B3953; font-size: 15px;">司名释义</strong>
			<p>重阳两义：重为复，阳为升，重阳寓意复合增长；重阳节有登高习俗，极目眺远，映射投资需远见。</p>
            <br/>
            <strong style="font-weight: bolder; color: #0B3953; font-size: 15px;">标识释义</strong>
			<P>水是生命之源，并蓄柔和与坚韧。投石于水，水纹层扩。标识创意源于水纹东南部，方形代表专业冷静，深蓝代表踏实稳重。</P>
            <br/>
			<strong style="font-weight: bolder; color: #0B3953; font-size: 15px;">企业文化</strong>
            <p>协作、分享、坦诚、谦逊、心胸开阔</p>
            <br/>
        </div>
        <!-- aboutCY end -->
        <!-- Investment philosophy start -->
        <div id="page02" class="rightcontent wordbox" style="display: none;">
            <strong style="font-weight: bolder; color: #0B3953; font-size: 15px;">投资理念</strong>
            <br/>
            <br/>
            <p>重阳投资坚守价值投资、理性投资，认为价值投资是中长期风险收益比最佳的投资方法，长期坚持基本面研究和投资可持续提升团队投研实力。</p>
            <br/>
            <p>在投资策略的制定上，重阳投资遵循以下路径：通过前瞻的宏观研究，自上而下进行大类资产配置；通过深入细致的行业和公司研究，自下而上发掘投资标的；最终通过自上而下和自下而上的对接来验证投资策略的有效性。</p>
            <br/>
            <p>重阳投资将风险防范置于首位，在此基础上兼顾组合的盈利空间和流动性。</p>
            <br/>
        </div>
        <!-- Investment philosophy end -->
        <!-- Compliance risk control start -->
        <div id="page03" class="rightcontent wordbox" style="display: none;">
            <table style="width: 100%; text-align: left; vertical-align: top;" cellpadding="0" cellspacing="0">
            	<tr>
                	<td style="width: 100%; font-size: 14px; vertical-align: top; font-weight: bold;font-family: 微软雅黑; color: rgb(0,51,102);">裘国根</td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</td>
                </tr>
                <tr>
                	<td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 100%; font-size: 14px; vertical-align: top; font-weight: bold;font-family: 微软雅黑; color: rgb(0,51,102);">陈心</td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">芝加哥大学工商管理硕士，CFA，19年金融从业经验。曾先后在中国国际金融有限公司、摩根士丹利、里昂证券等金融机构担任固定收益、汽车和银行业高级分析师。2009年加入重阳投资，2010年起任基金经理，2013年起任首席分析师，2014年起兼任战略研究部主管。</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <!-- Compliance risk control end -->
        <!-- Investment research core start -->
        <div id="page04" class="rightcontent wordbox" style="display: none;">
            <table style="width: 100%; text-align: left; vertical-align: top;" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 100%; font-size: 14px; vertical-align: top; font-weight: bold;font-family: 微软雅黑; color: rgb(0,51,102);">裘国根<br />执行事务合伙人、董事长兼首席投资官</td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 100%; font-size: 14px; vertical-align: top; font-weight: bold;font-family: 微软雅黑; color: rgb(0,51,102);">王庆<br />合伙人、总裁兼首席策略师</td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">美国马里兰大学经济学博士，17年金融从业经验。曾先后担任国际货币基金组织经济学家、摩根士丹利大中华区首席经济学家、中国国际金融有限公司投资银行部执行负责人。2010-2011年，王庆博士带领的摩根士丹利经济研究团队连续两年被《机构投资者》杂志评选为亚洲区第一名。2013年加入重阳投资。</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 100%; font-size: 14px; vertical-align: top; font-weight: bold;font-family: 微软雅黑; color: rgb(0,51,102);">陈心<br />合伙人、首席分析师兼基金经理</td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">芝加哥大学工商管理硕士，CFA，19年金融从业经验。曾先后在中国国际金融有限公司、摩根士丹利、里昂证券等金融机构担任固定收益、汽车和银行业高级分析师。2009年加入重阳投资，2010年起任基金经理，2013年起任首席分析师，2014年起兼任战略研究部主管。</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 100%; font-size: 14px; vertical-align: top; font-weight: bold;font-family: 微软雅黑; color: rgb(0,51,102);">谢卓<br />合伙人、交易部主管</td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">复旦大学经济学硕士，17年证券交易经验。1996年起就职于海南港澳信托投资公司，2001年加入重阳投资，负责交易业务。熟悉中国资本市场各种金融工具，交易技巧娴熟。</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 100%; font-size: 14px; vertical-align: top; font-weight: bold;font-family: 微软雅黑; color: rgb(0,51,102);">贺建青<br />合伙人、行业研究部主管</td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">中国人民大学经济学硕士，9年证券分析经验。2006年加入重阳投资，对保险、家电、零售、食品饮料等行业有着丰富的研究经验，2014年起任行业研究部主管。</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <!-- Investment research core end -->
        <!-- A fund manager start -->
        <div id="page05" class="rightcontent wordbox" style="display: none;">
            <p>重阳投资认为合规风控体系和投研体系密不可分，合规风控贯穿于投研的事前、事中和事后，而重心在事前。</p>
            <br/>
			<img src="<%=basePath %>images/about/pic12.png" vspace="20"/>
        </div>
        <!-- A fund manager end -->
        <!-- Contact us start -->
        <div id="page06" class="rightcontent wordbox" style="display: none;">
        	<div style="width: 625px;">
	            <p>
		            <strong>上海重阳投资管理股份有限公司</strong>
		            <br/>
					地址：上海市浦东新区世纪大道8号国金中心北塔51楼<br />
					邮编：200120 <br />
					电话：86 21 20216666 <br />
					客服：4006812989 <br />
					传真：86 21 20216688 <br />
					电邮：<a class="email" target="_blank" href="mailto:chongyang@chongyang.net">chongyang@chongyang.net</a>
				</p>
	       	</div>
            <!--img src="<%=basePath %>images/index_map.jpg"/-->
            <iframe id="adderMap" name="adderMap" src="map.asp" frameborder="0" scrolling="no" width="625" height="400"></iframe>
            <br/>
        </div>
        <!-- Contact us end -->
    </div>
	<div class="line"></div>
	<!-- content end -->
	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
</body>
</html>