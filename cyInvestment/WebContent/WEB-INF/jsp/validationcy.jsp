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
<title>重阳投资</title>
<link href="<%=basePath %>css/Global.css" type="text/css" rel="stylesheet"/>
</head>
<body>
	<div class="Container">
		<img src="<%=basePath %>images/notice/notice.gif" height="240" width="932" />
		<div style="padding:20px;">
        	<div style="height:300px; overflow:auto; border:1px solid #D8D8D8; padding:10px;">
				在继续浏览本公司网站前，请您仔细阅读本重要提示，并将页面滚动至本页结尾“接受”或“放弃”键，根据您的具体情况选择继续浏览还是放弃。点击“接受” 键，视为您已经阅读并愿意遵守本提示内容。<br /><br />
				证券投资具有一定风险，根据《中华人民共和国信托法》、《信托公司集合资金信托计划管理办法》及其他相关法律法规的有关规定，参与信托计划的人士应为风险识别、评估、承受能力较强的合格投资者。浏览本公司网站的人士可能来自更广阔的区域，但登入本网页的人士均出于主动，因而有责任遵守适用于当地的法规。登入网站内页即表示登入者同意其已阅览本网页的所有部分，包括任何法规或法规注释。<br /><br />
				如果确认您或您所代表的机构是一名“合格投资者”，并将遵守适用的有关法规请点击“接受”键以继续浏览本公司网站。如您不同意任何有关条款，请按“放弃”键。<br /><br />
				本网站所载的各种信息和数据等仅供参考，并不构成广告或销售要约，或买入任何证券、基金或其它投资工具的建议。投资者应仔细审阅相关金融产品的合同文件等以了解其风险因素，或寻求专业的投资顾问的建议。<br /><br />
				信托产品净值可能会有较大的波动，并可能在短时间內大幅下跌，并造成投资者损失部分或全部投资金额。您应确保有关投资產品适合您的需要。如有怀疑，请咨询按中国内地法规注册的专业分析师的意见，並要求其确认有关投资产品适合並符合您的投资目标。<br /><br />
				投资产品的价格及其收益存在涨跌变动，而过往的产品业绩数据并不预示其未来的表现，投资者不应依赖本网站所提供的数据做出投资决策，否则由投资者自行承担所有风险。 <br /><br />
				本网站所载的资料于刊载日期属恰当充分，您在阅读时资料的准确性或完整性已发生变化。本网站刊登的所有资料可予以更改或修订而毋须事前通知，尽管重阳投资并不承诺定期更新本网站内容。公司并不对第三者所提供之有关资料的准确性、充足性或完整性作出任何保证，公司或其股东及雇员概不对于本网站内第三者所提供之资料的任何错误或遗漏负任何法律责任。<br /><br />
				<div align="right">上海重阳投资管理股份有限公司</div>
			</div>
    	</div>
   		<div align="center" style="border-top:4px solid #F7F7F7; margin-top:10px; padding-top:10px;">
           	<a href="getvalidation.asp?k=${k}"><input type="image" name="btnYes" id="btnYes" src="<%=basePath %>images/notice/yes.gif" style="border-width:0px;" /></a>&nbsp;<input type="image" name="btnNo" id="btnNo" src="<%=basePath %>images/notice/no.gif" onclick="javascript:history.back(-1)" style="border-width:0px;"/>
        </div>
	</div>
</body>
</html>