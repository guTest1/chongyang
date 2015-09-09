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
<title>产品与服务 - 上海重阳投资管理股份有限公司</title>
<script src="<%=basePath %>js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
    	var k = $G("k");
        if (k != 2 && k != 3 && k != 4 && k != 5) {
            k = 1;
        }
        k--;
        var leftMenu = $(".subleft>dt").eq(k).find("a:eq(0)");
        leftMenu.click();
        //控制产品说明样式 开始
        var productDivs = $("div[class^='ProductInfo']");
        productDivs.each(function(i, obj) {
            $(obj).find("table tr td").height("40px");
            $(obj).find("table tr td").attr("valign", "middle");
            $(obj).find("table").width("678px");
            var tableTrs = $(obj).find("table tr");
            tableTrs.each(function(j, objTr) {
                $(objTr).find("td:first").css("padding-left", "20px");
                if ((j + 1) % 2 != 0) {//奇数行
                    $(objTr).css("background", "rgb(240, 240, 238)");
                }
            });
        });
        //控制产品说明样式 结束
    });
    //点击左边一级标题
    function ClickProductLM(th, num) {
        //将所有一级菜单的样式去掉
        var dts = $("dt");
        dts.each(function(i, obj) {
            $(obj).removeClass();
        });
        //当前点击的一级菜单增加样式
        $(th).parent().addClass("xt");
        //将所有二级菜单隐藏
        var dds = $("dd");
        dds.each(function(i, obj) {
            $(obj).hide();
        });
        //显示一级菜单下面的二级菜单
        var dd = $(th).parent().next();
        if (dd.is("dd")) {
            dd.show();
            //默认点击一级菜单下的第一个二级菜单
            var twoLevelMenu = dd.find("a:eq(0)");
            if (twoLevelMenu != typeof (undefined)) {
                twoLevelMenu.click();
            }
        }
        //隐藏所以内容
        var pages = $(".rightcontent");
        pages.each(function(i, obj) {
            $(obj).hide();
        });
        //显示对应的内容
        $("#page0" + num + "s01").show();
    }
    //点击左边二级菜单的产品
    function ClickProduct(th, id) {
        //移除所以产品的选择状态样式
        var products = $(".xt").next().find("a");
        products.each(function(i, obj) {
            $(obj).removeClass("on");
        });
        $(th).addClass("on"); //为点击的产品添加选中样式
        //将点击的产品的产品信息的html添加到tab1中
        var tabHtml = $(".ProductInfo" + id).html();
        $('.tabbox>div').eq(0).html(tabHtml);
        $(".tab>li").eq(0).click();
        //基金经理内容填充和显示
        var tab2Html = $(".InvestManager" + id).html();
        if (tab2Html != undefined && $.trim(tab2Html) != "") {//客户经理有值显示并赋值
            $('.tabbox>div').eq(1).html(tab2Html);
            $(".tab>li").eq(1).show();
        } else {//客户经理没值将tab隐藏
            $(".tab>li").eq(1).hide();
        }
        $(".AccountManagementShow").hide();
        $(".ProductInfoShow").show();
    }
    //点击专户管理
    function ClickAccountManagement() {
        $(".AccountManagementShow").show();
        $(".ProductInfoShow").hide();
    }
</script>
</head>
<body>
	<!-- header start -->
	<%@ include file="header.jsp"%>
	<!-- header end -->
	<!-- content start -->
    <div class="wapper clearfix"><img src="<%=basePath %>images/Default/banner_product.jpg" height="240" width="932"></div>
    <div class="wapper clearfix overhide">
    	<!-- left start -->
        <dl class="subleft">
            <dt class="xt"><a href="javascript:void(0);" onclick="ClickProductLM(this,'1');">信托产品</a></dt>
            <dd style="display: none;">
            	<a href="javascript:void(0);" onclick="ClickProduct(this,'3');">重阳1期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'5');">重阳2期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'6');">重阳3期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'7');">重阳5期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'9');">重阳6期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'13');">重阳7期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'14');">重阳8期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'15');">重阳9期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'16');">重阳10期</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'17');">目标回报</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'18');">投资精英</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'20');">君享重阳</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'21');">汇金重阳</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'22');">对冲1号</a>
                <a href="javascript:void(0);" onclick="ClickProduct(this,'24');">对冲2号</a>
            </dd>
            <dt><a href="javascript:void(0);" onclick="ClickProductLM(this,'2');">网上预约</a></dt>
            <dd style="display: none;">
            	<a href="javascript:void(0);" class="on">产品预约</a>
            </dd>
            <dt><a href="javascript:void(0);" onclick="ClickProductLM(this,'3');">认购流程</a></dt>
            <dt><a href="javascript:void(0);" onclick="ClickProductLM(this,'4');">常见问题</a></dt>
            <dt><a href="javascript:void(0);" onclick="ClickProductLM(this,'5');">产品咨询</a></dt>
        </dl>
        <!-- left end -->
        <!-- 信托产品 start -->
        <div id="page01s01" class="rightcontent" style="display:none;">
            <div class="ProductInfoShow">
                <ul class="tab">
                    <li class="on">产品说明</li>
                    <li>基金经理介绍</li>
                </ul>
                <div class="tabbox">
                    <div id="tab1"></div>
                    <div id="tab2" class="wordbox" style="display:none;"></div>
                </div>
            </div>
            <div class="AccountManagementShow" style="display:none; padding-top:20px;">
				重阳投资目前担任多只专户信托计划的投资顾问，为客户提供专属证券投资顾问服务。<br />
				咨询电话：86 21 2021 6640
            </div>
            <!--产品的产品说明-->
            <div class="ProductInfo3" style="display:none;">
            	<table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
					<tbody>
						<tr style="height: 7.75pt">
							<td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
								<div align="left"><span style="font-size: 9pt">产品名称：</span></div>
							</td>
							<td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
								<div><span style="font-size: 9pt">深国投&bull;重阳</span><span style="font-size: 9pt">1</span><span style="font-size: 9pt">期证券投资集合资金信托计划</span></div>
							</td>
						</tr>
						<tr style="height: 4pt">
							<td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
								<div align="left"><span style="font-size: 9pt">彭博代码：</span></div>
							</td>
							<td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            					<div align="left"><span style="font-size: 9pt">CHSZIT1 CH</span></div>
            				</td>
        				</tr>
        				<tr style="height: 4pt">
            				<td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            					<div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            				</td>
            				<td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            					<div align="left"><span style="font-size: 9pt">2008-9-5</span></div>
            				</td>
        				</tr>
        				<tr style="height: 7.3pt">
            				<td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            					<div align="left"><span style="font-size: 9pt">受托人：</span></div>
            				</td>
            				<td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            					<div align="left"><span style="font-size: 9pt">华润深国投信托有限公司</span></div>
            				</td>
        				</tr>
        				<tr style="height: 3.5pt">
            				<td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            					<div align="left"><span style="font-size: 9pt">保管人：</span></div>
            				</td>
            				<td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            					<div align="left"><span style="font-size: 9pt">中国建设银行股份有限公司深圳市分行</span></div>
            				</td>
        				</tr>
        				<tr style="height: 5.35pt">
            				<td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            					<div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            				</td>
            				<td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            					<div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            				</td>
        				</tr>
        				<tr style="height: 6.75pt">
            				<td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            					<div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            				</td>
            				<td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            					<div align="left"><span style="font-size: 9pt">4006812989</span></div>
            				</td>
        				</tr>
				        <tr style="height: 6.75pt">
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">基金经理：</span></div>
				            </td>
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">裘国根</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">国泰</span><span style="font-size: 9pt">君安证券股份有限公司</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">产品规模：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">成立时不低于人民币</span><span style="font-size: 9pt">5,000</span><span style="font-size: 9pt">万元</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15.75pt">
				            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">产品期限：</span></div>
				            </td>
				            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">不限定存续期限，如发生信托合同规定的信托计划终止情形时，本信托计划才予以终止</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">首次认购不低于人民币</span><span style="font-size: 9pt">1000</span><span style="font-size: 9pt">万元，追加资金为</span><span style="font-size: 9pt">10</span><span style="font-size: 9pt">万元的整数倍</span></div>
				            </td>
				        </tr>
				        <tr style="height: 12pt">
				            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">认购费用：</span></div>
				            </td>
				            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">信托认购资金的</span><span style="font-size: 9pt">1%</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15pt">
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">认购资金封闭期：</span></div>
				            </td>
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">信托存续期间认购的信托单位在认购到该信托单位之开放日起至其之后的第6个开放日（含第6个开放日）</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15pt">
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">开放日：</span></div>
				            </td>
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">每月最后一个工作日</span></div>
				            </td>
				        </tr>
				        <tr style="height: 10.5pt">
				            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">管理费率：</span></div>
				            </td>
				            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">信托计划资产的</span><span style="font-size: 9pt">1.5%</span><span style="font-size: 9pt">（含信托管理费、托管费等）</span></div>
				            </td>
				        </tr>
				        <tr style="height: 9.75pt">
				            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
				            </td>
				            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">6个月内不可赎回，7个月-12个月（不含第12个月）赎回费率为3%，一年后无赎回费</span></div>
				            </td>
				        </tr>
				        <tr style="height: 7.5pt">
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
				            </td>
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">信托计划收益的</span><span style="font-size: 9pt">20%</span></div>
				            </td>
				        </tr>
				        <tr style="height: 7.5pt">
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">信托分红：</span></div>
				            </td>
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">受托人与投资顾问协商一致决定</span></div>
				            </td>
				        </tr>
				        <tr style="height: 4pt">
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">说明书下载：</span></div>
				            </td>
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt"><a target="_blank" href="http://www.chongyang.net/resources/upload/c1_sms.doc">深国投&bull;重阳</a></span><span style="font-size: 9pt">1</span><span style="font-size: 9pt">期证券投资集合资金信托计划说明书</span></div>
				            </td>
				        </tr>
				    </tbody>
				</table>
			</div>
			<div class="ProductInfo5" style="display:none;">
				<table style="border-collapse: collapse" cellspacing="0" cellpadding="0" border="0">
				    <tbody>
				        <tr style="height: 7.75pt">
				            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">产品名称：</span></div>
				            </td>
				            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">深国投&bull;重阳2</span><span style="font-size: 9pt">期证券投资集合资金信托计划</span></div>
				            </td>
				        </tr>
				        <tr style="height: 4pt">
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">彭博代码：</span></div>
				            </td>
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div align="left"><span style="font-size: 9pt">CHSZIT2 CH</span></div>
				            </td>
				        </tr>
				        <tr style="height: 4pt">
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">成立日期：</span></div>
				            </td>
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">2008-12-12</span></div>
				            </td>
				        </tr>
				        <tr style="height: 7.3pt">
				            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">受托人：</span></div>
				            </td>
				            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">华润深国投信托有限公司</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">保管人：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">中国建设银行股份有限公司深圳市分行</span></div>
				            </td>
				        </tr>
				        <tr style="height: 5.35pt">
				            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
				            </td>
				            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
				            </td>
				        </tr>
				        <tr style="height: 6.75pt">
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
				            </td>
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">4006812989</span></div>
				            </td>
				        </tr>
				        <tr style="height: 6.75pt">
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">基金经理：</span></div>
				            </td>
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">裘国根</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">招商证券股份有限公司</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">产品规模：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">成立时不低于人民币3</span><span style="font-size: 9pt">,000</span><span style="font-size: 9pt">万元</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15.75pt">
				            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">产品期限：</span></div>
				            </td>
				            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">不限定存续期限，如发生信托合同规定的信托计划终止情形时，本信托计划才予以终止</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">首次认购不低于人民币500万元，追加资金为10万元的整数倍</span></div>
				            </td>
				        </tr>
				        <tr style="height: 12pt">
				            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">认购费用：</span></div>
				            </td>
				            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">信托认购资金的</span><span style="font-size: 9pt">1%</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15pt">
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">认购资金封闭期：</span></div>
				            </td>
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">信托存续期间认购的信托单位在认购到该信托单位之开放日起至其之后的第6个开放日（含第6个开放日）</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15pt">
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">开放日：</span></div>
				            </td>
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">每月</span>最后一个工作日</div>
				            </td>
				        </tr>
				        <tr style="height: 10.5pt">
				            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">管理费率：</span></div>
				            </td>
				            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt"><span style="font-size: 9pt">信托计划资产的</span><span style="font-size: 9pt">1.5%</span><span style="font-size: 9pt">（含信托管理费、托管费等）</span></span></div>
				            </td>
				        </tr>
				        <tr style="height: 9.75pt">
				            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
				            </td>
				            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">6个月内不可赎回，7个月-12个月（不含第12个月）赎回费率为3%，一年后无赎回费</span></div>
				            </td>
				        </tr>
				        <tr style="height: 7.5pt">
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
				            </td>
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">信托计划收益的</span><span style="font-size: 9pt">20%</span></div>
				            </td>
				        </tr>
				        <tr style="height: 7.5pt">
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">信托分红：</span></div>
				            </td>
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt">受托人与投资顾问协商一致决定</span></div>
				            </td>
				        </tr>
				        <tr style="height: 4pt">
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            	<div align="left"><span style="font-size: 9pt">说明书下载：</span></div>
				            </td>
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            	<div><span style="font-size: 9pt"><a target="_blank" href="http://www.chongyang.net/resources/upload/c2_sms.doc">深国投&bull;重阳2</a></span><span style="font-size: 9pt">期证券投资集合资金信托计划说明书</span></div>
				            </td>
				        </tr>
				    </tbody>
				</table>
			</div>
            <div class="ProductInfo6" style="display:none;">
            	<table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
				    <tbody>
				        <tr style="height: 7.75pt">
				            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
				            </td>
				            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">华润信托&bull;重阳3</span><span style="font-size: 9pt">期证券投资集合资金信托计划</span></div>
				            </td>
				        </tr>
				        <tr style="height: 4pt">
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">彭博代码：</span></div>
				            </td>
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">CHSZIT3 CH</span></div>
				            </td>
				        </tr>
				        <tr style="height: 4pt">
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
				            </td>
				            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">2009-9-2</span></div>
				            </td>
				        </tr>
				        <tr style="height: 7.3pt">
				            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
				            </td>
				            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">华润深国投信托有限公司</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">招商银行总行营业部</span></div>
				            </td>
				        </tr>
				        <tr style="height: 5.35pt">
				            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
				            </td>
				            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
				            </td>
				        </tr>
				        <tr style="height: 6.75pt">
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
				            </td>
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
				            </td>
				        </tr>
				        <tr style="height: 6.75pt">
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
				            </td>
				            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">裘国根、陈心</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">国信证券</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">成立时不低于人民币5</span><span style="font-size: 9pt">,000</span><span style="font-size: 9pt">万元</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15.75pt">
				            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
				            </td>
				            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">5年，已展期10年</span></div>
				            </td>
				        </tr>
				        <tr style="height: 3.5pt">
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
				            </td>
				            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币3</span><span style="font-size: 9pt">00</span><span style="font-size: 9pt">万元，追加资金为</span><span style="font-size: 9pt">10</span><span style="font-size: 9pt">万元的整数倍</span></div>
				            </td>
				        </tr>
				        <tr style="height: 12pt">
				            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
				            </td>
				            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">无</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15pt">
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">认购资金封闭期：</span></div>
				            </td>
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">认购到该信托单位之开放日起至其之后的第1个开放日（不含第1个开放日）为该部分信托单位的封闭期</span></div>
				            </td>
				        </tr>
				        <tr style="height: 15pt">
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
				            </td>
				            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">成立后每3个月的当月最后一个工作日</span></div>
				            </td>
				        </tr>
				        <tr style="height: 10.5pt">
				            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
				            </td>
				            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
				            <div align="left"><span style="font-size: 9pt">信托计划资产的2</span><span style="font-size: 9pt">%</span><span style="font-size: 9pt">（含信托管理费、托管费等）</span></div>
				            </span></td>
				        </tr>
				        <tr style="height: 9.75pt">
				            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
				            </td>
				            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">无</span></div>
				            </td>
				        </tr>
				        <tr style="height: 7.5pt">
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
				            </td>
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">信托计划收益的</span><span style="font-size: 9pt">20%</span></div>
				            </td>
				        </tr>
				        <tr style="height: 7.5pt">
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
				            <div align="left"><span style="font-size: 9pt">信托分红：</span></div>
				            </td>
				            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
				            <div align="left"><span style="font-size: 9pt">受托人与投资顾问协商一致决定</span></div>
				            </td>
				        </tr>
				    </tbody>
				</table>
                    </div>
                
                    <div class="ProductInfo7" style="display:none;">
                        <p>
<table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">得利宝&bull;至尊5号（重阳5期）</span><span style="font-size: 9pt">证券投资集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2009-12-11</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海国际信托有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">交通银行</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根、陈心</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中金公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购规模不超过15亿元，开放期后每次认购0-20%(开放日前T-5或T-6日公布具体比例)</span></div>
            </td>
        </tr>
        <tr style="height: 15.75pt">
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无限期</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币50万元，追加资金为10万元的整数倍</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购资金封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">成立后封闭6个月，不接受新客户认购，原有客户不可赎回，不可追加</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">每月的15日，非工作日顺延，T-3日开始接受预约认购</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的2%(含信托管理费、托管费等)</span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率:</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">持有不满6个月收取5%，6个月-12个月收取3%(赎回费归入理财计划)，12个月以上免赎回费</span></td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托分红：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">受托人与投资顾问协商一致决定</span></div>
            </td>
        </tr>
    </tbody>
</table>
</p>
                    </div>
                
                    <div class="ProductInfo9" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">华润信托&bull;重阳6</span><span style="font-size: 9pt">期证券投资集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2010-1-6</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">华润深国投信托有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国建设银行深圳分行</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根、陈心</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">国信证券</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">成立时不低于人民币5</span><span style="font-size: 9pt">,000</span><span style="font-size: 9pt">万元</span></div>
            </td>
        </tr>
        <tr style="height: 15.75pt">
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">5年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币300万元，追加资金为10万元起</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">申购金额的1%</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购资金封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托存续期间认购的信托单位在认购到该信托单位之开放日起至其之后的第6个开放日（含第6个开放日）</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">封闭期后每个月开放一次申赎</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">每月的最后一个工作日</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的1.5%(含信托管理费、托管费等)</span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">6个月内不可赎回，7个月-12个月（不含第12个月）赎回费率为3%，一年后无赎回费</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的</span><span style="font-size: 9pt">20%</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托分红：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">受托人与投资顾问协商一致决定</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo13" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">华润信托&bull;重阳7</span><span style="font-size: 9pt">期集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2011-5-26</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">华润深国投信托有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国建设银行上海市分行</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根、陈心</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">国泰君安</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">成立时不低于人民币1亿元</span></div>
            </td>
        </tr>
        <tr style="height: 15.75pt">
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">20年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币300万元（150万元50个名额），追加资金为10万元的整数倍</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">产品成立日起至2011年12月20日(不含)</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">封闭期后每自然季度开放一次申赎</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">3、6、9、12月的20号（如遇节假日则为该日之前最近一个交易日）</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的2.25%(含信托管理费、托管费等)</span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托分红：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">受托人与投资顾问协商一致决定</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo14" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中信信托&bull;重阳8</span><span style="font-size: 9pt">期证券投资集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2011-7-1</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中信信托有限责任公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国民生银行股份有限公司上海分行</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根、陈心</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中金公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">成立时不低于人民币10,000万元</span></div>
            </td>
        </tr>
        <tr style="height: 15.75pt">
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">20年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币300万元</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托资金的1%</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">自信托计划成立之日起至其之后的第12个开放日（含第12个开放日）</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划成立后的每月20日（如遇节假日则为该日之前最近一个工作日）</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的2%（含信托管理费、托管费等）</span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">赎回处于封闭期内的信托单位，需缴纳赎回费3%</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo15" style="display:none;">
                        <p><span class="Title">
<table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">兴业信托&bull;重阳<span lang="EN-US">9</span>期目标回报证券投资集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2011-8-18</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">兴业国际信托有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国银行股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根、王明聪</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">申银万国</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">成立时不低于人民币3亿元</span></div>
            </td>
        </tr>
        <tr style="height: 15.75pt">
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt"><font face="宋体">产品期限：</font></span></div>
            </td>
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">5年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币300万元</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">1%</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">自信托计划成立之日起至其之后的第6个开放日（含）为信托计划的封闭期（产品成立三年内，若未实现目标收益，客户只能赎回，不能追加和新认购)</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">每月20日为开放日（如遇节假日则为该日之前最近一个交易日）</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的2%(含信托管理费、托管费等)</span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">6 个开放日内（含）不可赎回，7（含）&mdash;12 个开放日（不含）内赎回费3%，12 个开放日后无赎回费</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">目标收益：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">3年持有期目标收益50%</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">现金分红：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">产品成立三年之内，若收益率达到50%，进行一次现金分红，产品净值归1，之后转为普通管理型产品进行运作，允许客户新认购和追加</span></div>
            </td>
        </tr>
    </tbody>
</table>
</span></p>
                    </div>
                
                    <div class="ProductInfo16" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">兴业信托&bull;重阳<span lang="EN-US">10</span>期证券投资集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2011-8-19</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">兴业国际信托有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国农业银行股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根、王晓华</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">广发证券</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">成立时不低于人民币<span lang="EN-US">2</span>亿元</span></div>
            </td>
        </tr>
        <tr style="height: 15.75pt">
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">5年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币<span lang="EN-US">300</span>万元（<span lang="EN-US">300</span>万元以下资金<span lang="EN-US">50</span>个名额)</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">1%</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">自信托计划成立之日起至其之后的第<span lang="EN-US">6</span>个开放日（含）为信托计划的准封闭期（信托计划存续期间以信托单位认购日起计算），准封闭期内可新认购和追加，亦可有条件赎回。</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">每月<span lang="EN-US">20 </span>号为开放日（如遇节假日则为该日之前最近一个交易日）</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的<span lang="EN-US">2%(</span>含信托管理费、托管费等<span lang="EN-US">)</span></span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">准封闭期内赎回需缴纳<span lang="EN-US">3%</span>赎回费</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo17" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">外贸信托&bull;重阳目标回报<span lang="EN-US">1</span>期证券投资集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2011-9-1</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国对外经济贸易信托有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">招商银行股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">北京高华证券有限责任公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">成立时不低于人民币5,000万元</span></div>
            </td>
        </tr>
        <tr style="height: 15.75pt">
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">5年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币300万元</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">1%（内扣法）</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">自信托计划成立之日起至其之后的第<span lang="EN-US">2</span>个开放日（不含）为信托计划的封闭期；自封闭期届满之日起至其之后的第<span lang="EN-US">3</span>个开放日（不含）为信托计划的准封闭期（产品成立三年内，若未实现目标收益，客户只能赎回，不能追加和新认购）</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划成立满一个月后的每年<span lang="EN-US">2</span>、<span lang="EN-US">5</span>、<span lang="EN-US">8</span>、<span lang="EN-US">11 </span>月最后一个工作日为开放日</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的<span lang="EN-US">2.2%(</span>含信托管理费、托管费等<span lang="EN-US">)</span></span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">封闭期内不可赎回，准封闭期内赎回收取<span lang="EN-US">3% </span>赎回费，准封闭期后无赎回费</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">目标收益：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">3年持有期目标收益50%</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">现金分红：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">产品成立三年之内，若收益率达到50%，进行一次现金分红，产品净值归1，之后转为普通管理型产品进行运作，允许客户新认购和追加</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo18" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">平安信托*投资精英之重阳集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2011-11-21</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">平安信托有限责任公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国农业银行股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">光大证券股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品规模：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">成立时不低于人民币20000万元</span></div>
            </td>
        </tr>
        <tr style="height: 15.75pt">
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 15.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">5年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币100万元</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">1%</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">自信托计划成立之日起六个月内</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">每自然月的15日（如遇节假日则为该日之前最近一个交易日）及最后一个交易日为开放日</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的2%（含信托管理费、托管费等</span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">封闭期内3% ，封闭期后无</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo20" style="display:none;">
                        <table style="border-collapse: collapse; color: #7b7b7b" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">国泰君安君享重阳阿尔法对冲一号限额特定集合资产管理计划</span></div>
            </td>
        </tr>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品类型：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">限额特定集合资产管理计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2012-12-27</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海国泰君安证券资产管理有限公司 </span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管银行：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">兴业银行股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">研究顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">研究顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">10年【到期可展期】</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">单个客户参与金额不低于100万元；客户人数在200人以下，但单笔委托金额在300万元以上的客户数量不受限制。</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">产品封闭期为成立之后6个月，期间不可申购赎回；认购资金封闭期180天，期间不可赎回。</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">产品封闭期满后的每月最后一个交易日</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的1.6%(含产品管理费、银行托管费等)</span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">持有满180天不满360天，退出费率为3%；持有满360天，退出费率为0。</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">业绩报酬：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">20%，客户退出、产品清算或产品分红时提取。</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品分红：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: #ece9d8; padding-bottom: 0cm; border-bottom-color: #ece9d8; padding-top: 0cm; padding-left: 5.4pt; border-right-color: #ece9d8; padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: #ece9d8" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">在符合有关分红条件和收益分配原则的前提下，收益每年至少分配一次。</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo21" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">招商汇金之重阳集合资产管理计划</span></div>
            </td>
        </tr>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品类型：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">限额特定集合资产管理计划</span></div>
            </td>
        </tr>
        <tr style="height: 4pt">
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2013-2-7</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">招商证券股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管银行：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">招商银行股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">研究顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">研究顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无固定期限</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">规模上限：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">本集合计划推广期和存续期，A类份额规模上限为4亿份，B类份额规模上限2亿份。集合计划的总参与人数均不超过200人，但参与金额在300万元以上的客户数量不受限制。</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次参与的最低金额为人民币100万元，追加参与的最低金额为人民币1万元。</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">自集合计划成立之日起3个月，期间不可参与退出；。</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">产品封闭期满后的每月最后一个交易日。开放期内A类份额可以办理参与、退出业务；B类份额仅办理退出业务。</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的1.7%(含产品管理费、银行托管费等)</span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">业绩报酬：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">退出时或集合计划分红时，提取该份额持有期间或分红期间年化收益率20%作为业绩报酬。</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo22" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">外贸信托&bull;重阳对冲1号集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2013-7-26</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国对外经济贸易信托有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">招商银行股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根、陈心</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">海通证券股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">期货经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">海通期货有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">5年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">首次认购不低于人民币100万元</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">0.5%（内扣法）</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划赎回封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">自本信托计划生效之日起至第3个开放日（不含）</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">每个自然月第三个周五（遇国家法定假日顺延至下一交易日）</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的<span lang="EN-US">2%(</span>含信托管理费、托管费等<span lang="EN-US">)</span></span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
                    <div class="ProductInfo24" style="display:none;">
                        <table style="border-collapse: collapse; color: rgb(123,123,123)" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品名称：</span></div>
            </td>
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">外贸信托&bull;重阳对冲2号集合资金信托计划</span></div>
            </td>
        </tr>
        <tr style="height: 7.75pt">
            <td style="height: 7.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">成立日期：</span></div>
            </td>
            <td style="height: 4pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">2014-3-21</span></div>
            </td>
        </tr>
        <tr style="height: 7.3pt">
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">受托人：</span></div>
            </td>
            <td style="height: 7.3pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">中国对外经济贸易信托有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">保管人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">兴业银行股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 5.35pt">
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问：</span></div>
            </td>
            <td style="height: 5.35pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">上海重阳投资管理股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">投资顾问联系电话：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">4006812989</span></div>
            </td>
        </tr>
        <tr style="height: 6.75pt">
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">基金经理：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">裘国根</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">证券经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">国泰君安证券股份有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">期货经纪人：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">国泰君安期货有限公司</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">产品期限：</span></div>
            </td>
            <td style="height: 6.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">5年</span></div>
            </td>
        </tr>
        <tr style="height: 3.5pt">
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">最低认购限额：</span></div>
            </td>
            <td style="height: 3.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">认购资金不低于人民币300万元，超过部分按人民币10万元的整数倍增加。</span></div>
            </td>
        </tr>
        <tr style="height: 12pt">
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">认购费用：</span></div>
            </td>
            <td style="height: 12pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">认购资金金额的1%）</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">信托计划赎回封闭期：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 15pt">
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">开放日：</span></div>
            </td>
            <td style="height: 15pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">3月、9月的最后一个交易日</span></div>
            </td>
        </tr>
        <tr style="height: 10.5pt">
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">管理费率：</span></div>
            </td>
            <td style="height: 10.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384"><span style="font-size: 9pt">
            <div align="left"><span style="font-size: 9pt">信托计划资产的<span lang="EN-US">2%(</span>含信托管理费、托管费等<span lang="EN-US">)</span></span></div>
            </span></td>
        </tr>
        <tr style="height: 9.75pt">
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">赎回费率：</span></div>
            </td>
            <td style="height: 9.75pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">无</span></div>
            </td>
        </tr>
        <tr style="height: 7.5pt">
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 122.4pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="163">
            <div align="left"><span style="font-size: 9pt">浮动管理费率：</span></div>
            </td>
            <td style="height: 7.5pt; border-top-color: rgb(236,233,216); padding-bottom: 0cm; border-bottom-color: rgb(236,233,216); padding-top: 0cm; padding-left: 5.4pt; border-right-color: rgb(236,233,216); padding-right: 5.4pt; width: 288pt; background-color: transparent; border-left-color: rgb(236,233,216)" valign="top" width="384">
            <div align="left"><span style="font-size: 9pt">信托计划收益的20%</span></div>
            </td>
        </tr>
    </tbody>
</table>
                    </div>
                
            <!--重阳1期基金经理简介 -->
            <div class="InvestManager3" style="display: none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
            </div>
            <!--重阳2期基金经理简介 -->
            <div class="InvestManager5" style="display: none;">
                <h3>
                    裘国根</h3>
              <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
            </div>
            <!--重阳3期基金经理简介 -->
            <div class="InvestManager6" style="display: none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
                <b>陈心</b><br />
                <p>
                    芝加哥大学工商管理硕士，CFA，19年金融从业经验。曾先后在中国国际金融有限公司、摩根士丹利、里昂证券等金融机构担任固定收益、汽车和银行业高级分析师。2009年加入重阳投资，2010年起任基金经理，2013年起任首席分析师，2014年起兼任战略研究部主管。</p>
            </div>
            <!--重阳5期基金经理简介 -->
            <div class="InvestManager7" style="display: none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
                <b>陈心</b><br />
                     <p>
                    芝加哥大学工商管理硕士，CFA，19年金融从业经验。曾先后在中国国际金融有限公司、摩根士丹利、里昂证券等金融机构担任固定收益、汽车和银行业高级分析师。2009年加入重阳投资，2010年起任基金经理，2013年起任首席分析师，2014年起兼任战略研究部主管。</p>
                </div>
            <!--重阳6期基金经理简介 -->
            <div class="InvestManager9" style="display: none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
                <b>陈心</b><br />
                     <p>
                    芝加哥大学工商管理硕士，CFA，19年金融从业经验。曾先后在中国国际金融有限公司、摩根士丹利、里昂证券等金融机构担任固定收益、汽车和银行业高级分析师。2009年加入重阳投资，2010年起任基金经理，2013年起任首席分析师，2014年起兼任战略研究部主管。</p>
                </div>
            <!--重阳7期基金经理简介 -->
            <div class="InvestManager13" style="display: none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
                <b>陈心</b><br />
                     <p>
                    芝加哥大学工商管理硕士，CFA，19年金融从业经验。曾先后在中国国际金融有限公司、摩根士丹利、里昂证券等金融机构担任固定收益、汽车和银行业高级分析师。2009年加入重阳投资，2010年起任基金经理，2013年起任首席分析师，2014年起兼任战略研究部主管。</p>
                </div>
            <!--重阳8期基金经理简介 -->
            <div class="InvestManager14" style="display: none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
                <b>陈心</b><br />
                        <p>
                    芝加哥大学工商管理硕士，CFA，19年金融从业经验。曾先后在中国国际金融有限公司、摩根士丹利、里昂证券等金融机构担任固定收益、汽车和银行业高级分析师。2009年加入重阳投资，2010年起任基金经理，2013年起任首席分析师，2014年起兼任战略研究部主管。</p>
                </div>
            <!--重阳9期基金经理简介 -->
            <div class="InvestManager15" style="display: none;">
                <h3>
                    裘国根</h3>
                 <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
                <b>王明聪</b><br />
                <p>
                    复旦大学管理学硕士。2006年至2010年在中山大学学习，获经济学学士学位，2010年至2012年在复旦大学学习，获管理学硕士学位。2012年8月加入重阳投资。</p>
            </div>
            <!--重阳10期基金经理简介 -->
            <div class="InvestManager16" style="display: none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
                <b>王晓华</b><br />
                <p>中国科学院研究生院工学博士。2003年至2007年在中国科学技术大学学习，获工学学士学位，2007年至2012年在中国科学院研究生院学习，获工学博士学位。2012年8月加入重阳投资。</p>
            </div>
            <!--目标回报1期基金经理简介 -->
            <div class="InvestManager17" style="display:none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
            </div>
            <!--投资精英基金经理简介 -->
            <div class="InvestManager18" style="display:none;">
                <h3>
                    裘国根</h3>
                 <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
            </div>
            <!--君享重阳基金经理简介 -->
            <div class="InvestManager20" style="display:none;">
               
            </div>
            <!--汇金重阳基金经理简介 -->
            <div class="InvestManager21" style="display:none;">
                
            </div>
            <!--重阳对冲1号基金经理简介 -->
            <div class="InvestManager22" style="display:none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
                <b>陈心</b><br />
                     <p>
                    芝加哥大学工商管理硕士，CFA，19年金融从业经验。曾先后在中国国际金融有限公司、摩根士丹利、里昂证券等金融机构担任固定收益、汽车和银行业高级分析师。2009年加入重阳投资，2010年起任基金经理，2013年起任首席分析师，2014年起兼任战略研究部主管。</p>
                </div>
            <!--重阳A股阿尔法基金经理简介 -->
            <div class="InvestManager23" style="display:none;">
                
            </div>
            <!--重阳对冲2号基金经理简介 -->
            <div class="InvestManager24" style="display:none;">
                <h3>
                    裘国根</h3>
                <p>
                    中国人民大学经济学硕士，22年证券投资经验。1993年至1995年就职于原君安证券下属机构，1996年开始职业投资，2001年创立上海重阳投资有限公司，2008年起管理阳光私募基金，2009年参与创立上海重阳投资管理有限公司。熟悉资本市场各种金融工具，长于权益估值和对冲策略。</p>
                <br/>
            </div>
        </div>
        <!-- 网上预约 start -->
        <div id="page02s01" class="rightcontent" style="display: none;">
            <strong style="color: #0D3956; font-weight: bolder">重要提示：</strong><br />
			证券投资具有一定风险，根据《中华人民共和国信托法》、《信托公司集合资金信托计划管理办法》及其他相关法律法规的有关规定，参与信托计划的人士应为风险识别、评估、承受能力较强的合格投资者。请确认您或您所代表的机构是一名“合格投资者”，并将遵守适用的有关法规。<br />
            <br />
			本网站所载的各种信息和数据等仅供参考，并不构成广告或销售要约，或买入任何证券、基金或其它投资工具的建议。投资者应仔细审阅相关金融产品的合同文件等以了解其风险因素，或寻求专业的投资顾问的建议。<br />
            <br />
			信托产品净值可能会有较大的波动，并可能在短时间內大幅下跌，并造成投资者损失部分或全部投资金额。您应确保有关投资產品适合您的需要。如有怀疑，请咨询按中国内地法规注册的专业分析师的意见，並要求其确认有关投资产品适合並符合您的投资目标。<br />
            <br />
			投资产品的价格及其收益存在涨跌变动，而过往的产品业绩数据并不预示其未来的表现，投资者不应依赖本网站所提供的数据做出投资决策，否则由投资者自行承担所有风险。<br />
            <br />
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="30" colspan="2" style="color: #0D3956; font-weight: bolder">
						客户基本信息
                    </td>
                    <td colspan="2" style="color: #0D3956; font-weight: bolder">
						预约产品信息
                    </td>
                </tr>
                <tr>
                    <td width="70" height="30">
						客户名称：
                    </td>
                    <td width="242">
                        <input name="ctl00$cpContent$txtName" type="text" id="ctl00_cpContent_txtName" style="width:200px;" />
                        <span id="ctl00_cpContent_RequiredFieldValidator1" style="color:Red;visibility:hidden;">*</span>
                    </td>
                    <td width="70">
						产品名称：
                    </td>
                    <td width="243">
                        <select name="ctl00$cpContent$txtProductsName" id="ctl00_cpContent_txtProductsName" style="width:155px;">
							<option value="3">重阳1期</option>
							<option value="5">重阳2期</option>
							<option value="6">重阳3期</option>
							<option value="7">重阳5期</option>
							<option value="9">重阳6期</option>
							<option value="13">重阳7期</option>
							<option value="14">重阳8期</option>
							<option value="15">重阳9期</option>
							<option value="16">重阳10期</option>
							<option value="17">目标回报</option>
							<option value="18">投资精英</option>
							<option value="20">君享重阳</option>
							<option value="21">汇金重阳</option>
							<option value="22">对冲1号</option>
							<option value="24">对冲2号</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td width="70" height="30">
						客户类型：
                    </td>
                    <td width="242">
                        <table id="ctl00_cpContent_txtType" border="0">
							<tr>
								<td>
									<input id="ctl00_cpContent_txtType_0" type="radio" name="ctl00$cpContent$txtType" value="个人客户" checked="checked" />
									<label for="ctl00_cpContent_txtType_0">个人客户</label>
								</td>
								<td>
									<input id="ctl00_cpContent_txtType_1" type="radio" name="ctl00$cpContent$txtType" value="机构客户" />
									<label for="ctl00_cpContent_txtType_1">机构客户</label>
								</td>
							</tr>
						</table>
                    </td>
                    <td width="70">
						预约金额：
                    </td>
                    <td width="243">
                        <input name="ctl00$cpContent$txtMoney" type="text" id="ctl00_cpContent_txtMoney" style="width:150px;" />
                        <span id="ctl00_cpContent_RequiredFieldValidator4" style="color:Red;visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td height="30">
						固定电话：
                    </td>
                    <td>
                        <input name="ctl00$cpContent$txtTel" type="text" id="ctl00_cpContent_txtTel" style="width:200px;" />
                        <span id="ctl00_cpContent_RequiredFieldValidator2" style="color:Red;visibility:hidden;">*</span>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="30">
						传&nbsp;&nbsp;&nbsp;&nbsp;真：
                    </td>
                    <td>
                        <input name="ctl00$cpContent$txtFax" type="text" id="ctl00_cpContent_txtFax" style="width:200px;" />
                        <span id="ctl00_cpContent_RequiredFieldValidator3" style="color:Red;visibility:hidden;">*</span>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="30">
						电子邮件：
                    </td>
                    <td colspan="3">
                        <input name="ctl00$cpContent$txtEmail" type="text" id="ctl00_cpContent_txtEmail" style="width:200px;" />
                        <span id="ctl00_cpContent_RequiredFieldValidator5" style="color:Red;visibility:hidden;">*</span>
                        <span id="ctl00_cpContent_RegularExpressionValidator1" style="color:Red;visibility:hidden;">ERROR!</span>
                    </td>
                </tr>
                <tr>
                    <td height="30">
						通讯地址：
                    </td>
                    <td colspan="3">
                        <input name="ctl00$cpContent$txtAddress" type="text" id="ctl00_cpContent_txtAddress" style="width:200px;" />
                        <span id="ctl00_cpContent_RequiredFieldValidator6" style="color:Red;visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td height="40" colspan="4" align="center">
                        <input type="image" name="ctl00$cpContent$btnSubmit" id="ctl00_cpContent_btnSubmit" src="<%=basePath %>images/products/btnSubmit.gif" onclick="" style="border-width:0px;" />&nbsp;<img src="<%=basePath %>images/products/btnReset.gif" onclick="reset();" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
        <!-- 网上预约 end -->
        <!-- 认购流程 start -->
        <div id="page03s01" class="rightcontent" style="display:none;">
            <div>
                <b>认购流程</b><br />
                <b>1.委托人签署信托合同：</b>委托人在产品规定的有效时间范围内，跟信托公司、投资顾问或代销机构联系，获取信托合同进行签署，并提交相关证件；<br />
                <b>2.委托人汇款：</b>委托人在产品规定的有效时间范围内，将认购资金及认购费用，通过银行汇款到该信托产品指定的托管银行帐户；<br />
                <b>3.委托人取得合同：</b>在认购产品成立后，或日常开放日认购后，在合同规定的N个（一般为10个）工作日内，委托人将取得由信托公司签署并盖章的有效合同。<br />
                <br />
                <b>备注：</b><br />
                <b>若委托人为自然人，需提供以下资料：</b><br />
				（1）委托人的身份证明文件（身份证或护照）复印件一式两份；<br />
				（2）委托人的信托利益分配账户（户名需与身份证为同一人）复印件一式两份（该账户应与合同上填写的信托利益分配账户为同一账户）；<br />
				（3）委托人的信托资金划入认购账户的银行汇款凭证复印件一式一份，并在汇款备注中注明：“XX认购重阳XX期”；<br />
				（4）以上复印件上均需客户本人签字，并注明：“仅供认购重阳XX期信托计划”。<br />
                <br />
                <b>若认购人为法人，则需要提供以下资料：</b><br />
			            （1） 委托人的法人营业执照副本复印一式两份；<br />
			            （2） 法定代表人有效身份证件复印件一式两份；<br />
			            （3） 法定代表人证明书一式两份；<br />
				（4） 委托人信托利益分配账户（银行开户证明，户名应为法人全称）复印一式两份；<br />
				（5） 委托人的信托资金划入认购账户的银行划款凭证复印一式一份，在汇款备注中注明：“XX认购重阳XX期”；<br />
				（6） 若授权他人（经办人）签字的情况，还需要提供经法定代表人签字并加盖公章的<br />
				法定代表人授权委托书一式两份，以及经办人有效身份证件复印件一式两份；<br />
				（7） 以上所有复印件上均需加盖公章，并注明：“仅供认购重阳XX期信托计划”。<br />
                <br />
            </div>
            <img src="<%=basePath %>images/products/nav03s01pic.gif" width="607" height="595" /><br /><br />
        </div>
        <!-- 认购流程 end -->
        <!-- 常见问题 start -->
        <div id="page04s01" class="rightcontent" style="display:none;">
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        1、什么是私募基金？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>私募基金是通过非公开发行方式、面向少数机构投资者或者富有的个人投资者募集资金而设立的基金。</p>
                        <p>按照组织形式，可以分为契约型、公司型、合伙型私募基金；按照投资对象，可分为私募股权投资基金和私募证券投资基金。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        2、什么是阳光私募基金？“阳光私募”的称呼因何而来？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>“阳光私募”并非特指证券类信托产品，在行业的发展过程中，以信托产品、银行理财产品或者以有限合伙基金等合法合规的方式，通过非公开方式向高端投资者募集资金，主要投资于证券市场（不限于证券市场），定期向投资者公布业绩的投资基金都被约定俗成地称为“阳光私募”。</p>
                        <p>区别于传统的私募基金运作，“阳光私募”的基金成立、相关的信托关系、资金保管关系都受到《中华人民共和国信托法》等相关法律的要求，这也使得整个行业走入“阳光下”，进入了一个规范的运作时期。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        3、阳光私募基金与公募基金有何区别？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>作为主要都是投资于二级市场且都有可查证业绩的基金，阳光私募基金与公募基金相比在很多方面都有着显著差异，尤其体现在如下几个方面：</p>
                        <p>1）两者的盈利模式完全不同。公募基金根据所管理的基金规模提取管理费；阳光私募则主要依靠超额收益的业绩提成。这也决定了，对阳光私募来说，业绩是报酬的基础，必须追求稳定的，正的绝对收益，才能获得生存和发展；</p>
                        <p>2）在投资对象和范围上，阳光私募具有更大的灵活性。公募基金必须在相关法律法规允许的框架内设立和运作，在投资品种、投资比例、投资于基金类型的匹配上有严格的限制，比如在任何市场条件下的最低持仓都不得低于60%。而阳光私募的投资限制完全由协议约定，管理人可以在协议约定的范围内根据市场状况和自己的分析判断决定是否投资、投资比例等，更加灵活地应对市场变动。</p>
                        <p>3）产品的设立方式和信息披露要求不同。公募基金对产品设立和信息披露有着严格的限定和要求。但阳光私募的设立受法律限制较少，对信息披露的要求相对较低，可以与特定投资者私下约定信息披露的要求、时间、方式等，具有较强的保密性。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        4、阳光私募产品是否跟公募基金一样进行信息披露？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>公募基金对信息披露有非常严格的要求，其投资目标、投资组合等信息都要披露，净值每天进行发布；而阳光私募产品对信息披露的要求更加灵活，具有较强的保密性，除了定期发布净值和运作报告外，也根据信托公司和投资顾问的需求更富个性化。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        5、什么是证券投资集合资金信托计划？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>证券投资集合资金信托计划属于阳光私募基金，是借助信托公司的平台发行，经过监管机构备案的信托业务品种。证券投资集合资金信托计划的资金由银行进行托管，证券由证券公司托管，并在银监会的监管下，投资于证券市场，定期发布业绩。</p>
                        <p>从法律结构来看，阳光私募证券投资基金其实是一个信托产品，通过信托合同来框定各方的权利与义务，共有四方参与：私募基金公司作为信托公司的投资顾问，提出投资建议；信托公司是产品发行的法律主体，提供产品运作的平台，并承担监管之责；银行作为资金托管人，保证资金的安全；证券公司作为证券的托管人，保障证券的安全。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        6、阳光私募产品（证券投资集合资金信托计划）如何保证资金的安全性？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>阳光私募产品的资金由保管人（保管银行）进行保管，证券由证券经纪人（交易券商）托管，投资顾问（阳光私募公司）只负责投资顾问服务，不直接接触资金，不存在资金挪用的可能性。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        7、阳光私募的产品净值为何是由信托公司来公布？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>信托公司是阳光私募产品的发起方，负责产品的运营管理。估值基准日的产品净值，是由信托公司负责定期对信托计划资产进行估值，对产品的费用进行核算后，计算得出并对外发布。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        8、阳光私募的固定信托管理费和银行托管费如何收取？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>阳光私募产品一般定期（月度或季度）开放，固定信托管理费和银行托管费通常按照合同规定的费率（年化）分摊至各开放日收取，计提基数为开放日当天的信托计划资产总值。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        9、阳光私募产品的浮动业绩报酬如何提取？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>阳光私募产品将针对净值创新高的部分提取浮动业绩报酬。例如，产品初始发行面值为1元：1）若第一个估值基准日扣除当期信托管理费和银行保管费之后，产品单位值为1.2元，则针对（1.2-1）=0.2元部分提取业绩报酬；2）若第一个估值基准日扣除当期信托管理费和银行保管费之后，产品单位值为0.98元，则不收取业绩报酬；若至第二个估值基准日扣除当期信托管理费和银行保管费之后，产品单位值为1.06元，则针对（1.06-1）=0.06元部分提取业绩报酬。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        10、信托公司公布的产品净值是已经扣除业绩提成的净值吗？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>是的，信托公司公布的净值是扣除信托管理费、银行托管费、律师费等费用，以及业绩提成之后的净值，是客户实际所得。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        11、阳光私募产品能否部分赎回？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>可以，但赎回后留存市值通常来说必须是证券投资集合资金信托计划合同内要求的最低金额（通常为300万元，具体的金额要求以信托公司合同文本为准），否则必须全部赎回。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        12、为什么证券投资集合资金信托计划只能有50个300万元以下的名额？机构投资者是否占用名额？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>根据中国银行业监督管理委员会令 2007 年 第3 号 《信托公司集合资金信托计划管理办法》第二章第5条规定，单一信托计划自然人人数不得超过50人，合格的机构投资者数量不受限制。</p>
                        <p>因此，300万元以下的名额只能有50个，而机构投资者则不受此限制，也不会占用50个自然人的名额。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        13、申购、赎回的时间和净值依据？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>阳光私募产品一般定期开放（月度或季度）。若当期有申购需求，申购资金最迟必须在开放日当天到达信托合同指定账户，申购资金的份额核算以开放日当天净值为准；若当期有赎回需求，一般在开放日之前5天必须提交赎回申请（具体时间由信托公司自行规定），赎回时的净值以开放日当天净值为准。</p><br />
                    </td>
                </tr>
            </table>
            <table width="625" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" style="color: #0D3956; font-weight: bolder">
                        14、净值高于面值的情况下，如果全额赎回是否会导致赎回款项低于初始认购资金？如果产品净值低于认购时的信托单位净值，是否还要赎回费？
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="text-indent: 2em">
                        <p>一般来说，如果信托合同规定，产品在准封闭期之内赎回需要支付相关费用，那么当客户有赎回意向时，需要缴纳相应的赎回费。但若收取赎回费用之后客户的全额赎回款项低于其初始认购资金，则信托公司会相应调整赎回费用，使客户的赎回款项等于其初始认购资金。</p>
                        <p>如果信托单位净值低于或等于客户初始认购时的单位净值，则赎回费用为零。</p>
                        <p>具体规定请参看各信托公司的信托合同。</p><br />
                    </td>
                </tr>
            </table>
        </div>
        <!-- 常见问题 end -->
        <!-- 产品咨询 start -->
        <div id="page05s01" class="rightcontent" style="display:none;">
			客服电话：4006812989<br />
			接听时间：早9:00至晚17:00<br />
        </div>
        <!-- 产品咨询 end -->
    </div>
	<!-- content end -->
	<div class="line"></div>
	<!-- content end -->
	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer end -->
</body>
</html>