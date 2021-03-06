<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>查看任务书信息</title>
<link href="<%=path%>/pages/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/custom/customersTable.css">
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=path%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.printarea.js"></script>
<script type="text/javascript" src="<%=path%>/js/tableExport.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.base64.js"></script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<script type="text/javascript"> 

function printWithAlert(){
  $("div#tbView").printArea();
  
}

function touploadFile(mid, mCode) {
	var url = document.URL;
	window.open("preUploadFile?up=1" + "&mid=" + mid + "&mCode=" + mCode, '添加附件',
					'width=800,height=650,toolbar=no,scrollbars=anto,menubar=no,top=50,left=200')
}
function refreshWin() {
	window.location.reload();
}
</script>

</head>

<body>
	<div class="container">
		<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
			<tbody>
				<tr>
					<td height="22" style="text-align:center" bgcolor="#e3e3e3">
						<c:choose>
					<c:when test="${viewDel=='1'}">
					<font style="FONT-SIZE: 14px; LETTER-SPACING: 2px; color:#151e14">已删除变更签证任务书详细信息</font>
					</c:when>
					<c:otherwise>
					<font style="FONT-SIZE: 14px; LETTER-SPACING: 2px; color:#171e24">变更签证任务书详细信息</font>
					</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</tbody>
		</table>

				<div align="right" class="NOPRINT" >
				<h3>
				<button title="打印" onclick="printWithAlert()" class="easyui-linkbutton">打印</button>
				<input type="button" onclick="$('#viewMission').tableExport({type:'excel',escape:'false'});" value="导出到Execl..." class="easyui-linkbutton">
				&nbsp; &nbsp;
				<a onclick="touploadFile('${mission.mId}', '${mission.mCode}')"><font color="#0000ff">附件</font></a>&nbsp; &nbsp;&nbsp; &nbsp;
				</h3>
			</div>
		<div id="tbView">
			<table id="viewMission" >
				<tr>
					<td colspan="12">
						<div align="center">变 更 签 证任 务 书 详 细 信 息</div>
						<div align="right">
							任务书编号:${mission.mCode}&nbsp;&nbsp;</div>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						工程名称: ${mission.prName}&nbsp;&nbsp;&nbsp;&nbsp; 
						栋号: ${mission.unitNumber}&nbsp;&nbsp;&nbsp;&nbsp; 

					</td>
				</tr>
				<tr>
					<td colspan="12">
						开始时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${mission.beginDate}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						结束时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${mission.endDate}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						结算单位: ${mission.cuName}
						
					</td>
				</tr>
						
				<tr>
					<td width="4%">
						序号
					</td>
					<td width="4%">
						内编号
					</td>
					<td width="8%">
						分部
					</td>
					<td width="10%">
						工程部位
					</td>

					<td width="12%">
						工作项目
					</td>
					<td width="12%">
						具体部位
					</td>
					<td width="5%">
						单位
					</td>
					<td width="8%">
						单价
					</td>
					<td width="9%">
						工程量
					</td>
					<td width="9%"> 
						工资金额
					</td>
					<td width="7%">
						资料是否返回
					</td>
					<td width="11%">
						备注
					</td>
				</tr>
								
				
				
      <c:forEach items="${missionContentList}" var="mcl">
        <tr>
            <td>${mcl.mcCode }</td>
            <td>${mcl.innerId }</td>
            <td>${mcl.pName}</td> 
            <td>${mcl.psName}</td> 
            <td>${mcl.oName}</td> 
            <td>${mcl.floor}</td> 
            <td>${mcl.unName}</td> 
            <td>${mcl.price}</td> 
            <td>${mcl.realQuantity}</td> 
            <td>${mcl.wageSum}</td>
            <td>${mcl.isreturn}</td>  
            <td>${mcl.remark}</td>                         
	   </tr>
    </c:forEach>	
							
				<tr>
					<td colspan="12">
						工长 : ${mission.supervisor}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
						<c:if test="${mission.isoverdue == 0}">
						提交时间 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${mission.submitTime}"/>
						</c:if>
						<c:if test="${mission.isoverdue == 1}">
						<span style='color: red'>提交时间 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${mission.submitTime}"/>(逾期)</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						<span style="color: red">任务书状态 : ${mission.missionStatus}</span>&nbsp;&nbsp;&nbsp;
						<c:if test="${file == '有附件'}">
							<a onclick="touploadFile('${mission.mId}', '${mission.mCode}')">
								<font color="#0000ff">有附件</font></a>
						</c:if>
						<c:if test="${file == '无附件'}">无附件</c:if>
					</td>
				</tr>
				
					<c:forEach items="${auditInfoList}" var="ail">
					<tr>
						<td colspan="3">
							${ail.roleName } : ${ail.userName }
						</td>
						
						<td colspan="9">
							<div align="left">
							意见 : ${ail.auditComment}&nbsp;<fmt:formatDate value="${ail.auditTime }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						</td>
						
					</tr>					
				</c:forEach>					
									
			</table>
		</div>
			<br>
			<div align="center">
			
	
			<input type="button" value="返回" class="easyui-linkbutton" onclick="window.history.go(-1);">
					
				</div>
		  
		    
		
	</div>
		

</body>
</html>