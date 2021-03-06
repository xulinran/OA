<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="debugFile.inc"%>
<!-- PAGE TITLE & BREADCRUMB-->
<div class="row-fluid">
	<h3 class="page-title">供应商管理</h3>
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a class="ajaxify" href="index.jsp">主页</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">供应商管理</a> <i class="icon-angle-right"></i></li>
		<li><a class="ajaxify" href="#">供应商联系人</a></li>
	</ul>
</div>

<div class='portlet-body form'>
	<form name="formSelect" id="form_Select" method="post" action="FindAction!findByCondition">
		<div class="row-fluid">
			<div class="span6">
				<div class="control-group">
					<div class="controls">
						<select id="findCondition" name="findCondition">
						<option value="contactName">按联系人姓名</option>
						<option value="telephone">按联系人手机号</option>
				</select>
						<input id="className" name="className" type="hidden" value="SupplierContact" />
				 <input id="textfield" name="textfield" type="text" />
					</div>
				</div>
			</div>
			<div class="span6">
				<div class="control-group">
					<div class="controls">
						<button id="select" type="button" class="btn btn-primary">查 询</button>
						<button id="Submit" class="btn btn-primary" type="button">高级搜索</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="row-fluid">
	<form name="fom" id="fom" method="post" action="">
		<table class="table table-striped">
			<div class="row-fluid">
				<span class="newfont07">选择： <a href="#" id="selectAll">全选</a>-<a href="#" id="unselect">反选</a>
				</span>
				 <input class="btn" name="Submit" type="button" value="删除所选信息" id="deleteChose" data-action="SupplierContractAction!deleteSupplierContact|${url }" />
				  <a class="btn ajaxify" href="JSP/addSupplierContract.jsp">添加供应商</a>
			</div>
			<div class="row-fluid">
				<div class="row-fluid" style="text-align: center; font-size: 20px; background-color: #EEEEEE">机构详细列表</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>选择</th>
							<th>编号</th>
							<th>联系人名称</th>
							<th>供应商名称</th>
							<th>职位</th>
							<th>性别</th>
							<th>工作电话</th>
							<th>手机电话</th>
							<th>QQ</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator var="supplierContract" value="#request.listObject">
							<tr>
								<td><input type="checkbox" name="delid" value="${supplierContract.id }" /></td>
								<td><a class="ajaxify" href="SupplierContractAction!edit?supplierContract.id=${supplierContract.id }">${supplierContract.id}</a></td>
								<td><a class="ajaxify" href="SupplierContractAction!edit?supplierContract.id=${supplierContract.id}">${supplierContract.contactName}</a></td>
								<td>${supplierContract.supplier.supplierName }</td>
								<td>${supplierContract.position }</td>
								<td>${supplierContract.gender }</td>
								<td>${supplierContract.phone }</td>
								<td>${supplierContract.telephone }</td>
								<td>${supplierContract.QQ }</td>
								<td><a class="ajaxify" href="SupplierContractAction!edit?supplierContract.id=${supplierContract.id}&method=4">编辑(修改)</a> <a class="deleteOne" href="javascript:void(0)"
									data-action="SupplierContractAction!deleteSupplierContact?delid=${supplierContract.id }&method=8|${url}">删除</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<div class="row-fluid">
				<s:set var="pageCount" value="(#request.totalSize-1)/10+1" />
				<s:set var="url" value="#request.url" />
				<div class="span4" style="margin: 20px 0px 20px 0px;">
					共 <span>${requestScope.pageCount}</span> 页 | 第 <span>${requestScope.currentIndex}</span> 页
				</div>
				<div class="pagination pull-right">
					<ul>
						<li class="active"><a class="ajaxify" href="${url }&index=1">首页</a></li>
						<s:if test='(#request.currentIndex) > 1'>
							<li class="active"><a class="ajaxify" href="${url}&index=${requestScope.currentIndex-1}">上页</a></li>
						</s:if>
						<s:else>
							<li class="disabled"><a href="javascript:;">上页</a></li>
						</s:else>
						<s:if test='(#request.currentIndex) < #pageCount'>
							<li class="active"><a class="ajaxify" href="${url}&index=${requestScope.currentIndex+1}">下页</a></li>
						</s:if>
						<s:else>
							<li class="disabled"><a href="javascript:;">下页</a></li>
						</s:else>
						<li class="active"><a class="ajaxify" href="${url}&index=${pageCount }">末页</a></li>
					</ul>
				</div>
			</div>
		</table>
	</form>
</div>
<script src="js/myAjaxify.js" type="text/javascript"></script>
<script>
	$("#select").click(function(e) {
		e.preventDefault();

		var pageContent = $('.page-content .page-content-body');

		$.ajax({
			url : $('#form_Select').attr('action'),
			data : $('#form_Select').serialize(),
			success : function(res) {
				pageContent.html(res);
			},
			error : function() {
				alert("你输入的有问题");
			}
		});
	});

	
</script>