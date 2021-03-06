<%@ page language="java" import="java.util.*,com.org.cygs.util.common.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chooseLWFBJS.jsp' starting page</title>
	<link href="<%=path%>/pages/css/base.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/admin-all.css" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/sunny/jquery-ui.css" />
	<link rel="stylesheet" href="<%=path%>/custom/uimaker/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/custom/uimaker/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/custom/customersTable.css" />
	
	<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.8.22.custom.min.js"></script>
	<script type="text/javascript" src="<%=path%>/custom/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/custom/easyui-lang-zh_CN.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function doTest(){
		var prId = $("#prId").val();
		var year = $("#year").val();
		var month = $("#month").val();
		if(prId == null || prId == ""){
			alert("工程名不能为空！");
			return false;
		}else if(year == null || year == ""){
			alert("年份不能为空！");
			return false;
		}else if(month == null || month == ""){
			alert("月份不能为空！");
			return false;
		}
		return true;
	}
</script>
  </head>
  
  <body>
  <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
		<tbody>
			<tr>
				<td height="35" style="text-align:center;background:#e3e3e3;border:1px solid #cacaca">
				<font style="font-size:1.0em;">项目劳务分包结算汇总表查询</font>
				</td>
			</tr>
		</tbody>
	</table>
  <%
			GetCurrentDate currentDate = new GetCurrentDate();
  %>	
   <form action="statistic/getLWFBJS" onsubmit="return doTest();">
   		<table id="lwfbList" class="table table-striped table-bordered table-condensed">
   			<tr>
   				<td style="width:10%">工程名称</td>
   				<td style="width:25%">
   					<select id="prId" name="prId" style="width:200px;height:30px;line-height:30px;">
   						<option value="">---请选择---</option>
   						<c:forEach items="${prList}" var="pr">
   							<option value="${pr.prId}">${pr.prName}</option>
   						</c:forEach>
   					</select>
   				</td>
   				<td style="width:10%">结算单位</td>
   				<td style="width:55%" colspan=2>
   					<select id="cuId" name="cuId" style="width:150px;height:30px;line-height:30px;">
    					<option value="">---请选择---</option>
    					<c:forEach items="${cuList}" var="cu">
    						<option value="${cu.cuId}">${cu.cuName}</option>
    					</c:forEach>
    				</select>
    				（可以不填，默认全部）
   				</td>
   			</tr>
   			<tr>
   				<td style="width:10%">结算时段</td>
   				<td style="width:25%">
   					<select id="year" name="year" style="width:100px;height:30px;line-height:30px;">
    					<option value="">
								---请选择---
							</option>
							<%
								int year=2009;
								int showYear = 100;								
								if(currentDate.getCurrentMonth() == 1 && currentDate.getCurrentDay() < 20)
								{					
									showYear = currentDate.getCurrentYear()-1;
								}else
								{
									showYear = currentDate.getCurrentYear();
								}
								for(;year<2040;year++)
								{								
							%>
							
									<option value="<%=year%>" <%=showYear == (year) ? "selected" : "" %>>
										<%=year%>
									</option>
							<%
								}
							%>
    				</select>
    				年
    				<select id="month" name="month" style="width:100px;height:30px;line-height:30px;">
    					<option value="">
								---请选择---
							</option>
							<%
								int month=1;	
								int showMonth;
								if(currentDate.getCurrentDay() < 20)
								{
									if(currentDate.getCurrentMonth() == 1)
									{
										showMonth = 12;
									}else
									{
										showMonth = currentDate.getCurrentMonth()-1;
									}
								}else
								{
									showMonth = currentDate.getCurrentMonth();
								}
								for(;month<13;month++)
								{									
							%>						
									<option value="<%=month%>" <%=showMonth == (month) ? "selected" : "" %>>
									<%=month%>
									</option>
							<%
								}
							%>
    				</select>
    				月
   				</td>
   				<td style="width:10%">审核状态</td>
   				<td style="width:25%">
   					<select name="status" id="status" style="width:150px;height:30px;line-height:30px;">
    					<option value="1">已审核通过</option>
    					<option value="0">审核未通过</option>
    					<option value="2">所有</option>
    				</select>
    				（默认已审核通过）
    			</td>
    			<td style="width:30%">
    				<input type="submit" class="easyui-linkbutton" style="height:30px;line-height:30px;" value="查询"/> &nbsp;&nbsp;
   					<input type="reset" class="easyui-linkbutton" style="height:30px;line-height:30px;" value="重置"/>
   				</td>
   				
   			</tr>
   		</table>
   </form>
  </body>
</html>
