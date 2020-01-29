<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>采购进货</title>
<!-- css引入 -->
<link rel="stylesheet" href="statics/css/buyin.css" type="text/css"/>
<!-- jquery引入 -->

	<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
//删除二次确认
function deleteById(buyinProductId){
	 $("#updateTrue").attr("style","display:none;");//隐藏修改成功DIV
	 $("#updateFalse").attr("style","display:none;");//隐藏修改失败DIV
	 $("#addTrue").attr("style","display:none;");//隐藏添加成功DIV
	 $("#addFalse").attr("style","display:none;");//隐藏添加失败DIV
	if(window.confirm("确定删除吗?")){
		$.getJSON('BuyinDelById.do?buyinProductId='+buyinProductId,function(code){
			if(code=='1'){
				 $("#deleteTrue").attr("style","display:block;font-size:30px;color:green;");//显示删除成功DIV
				showAll();
			}else{
				 $("#deleteFalse").attr("style","display:block;font-size:30px;color:red;");//显示删除失败DIV
			}
		});
	};
}
//修改查询单个
function dofindById(BuyinId){
	 $("#formadd").attr('style','display:none');//隐藏添加表单
	 $("#formupdate").attr('style','display:block');//显示修改表单
	 $("#updateTrue").attr("style","display:none;");//隐藏修改成功DIV
	 $("#updateFalse").attr("style","display:none;");//隐藏修改失败DIV
	 $("#deleteTrue").attr("style","display:none;");//隐藏删除成功DIV
	 $("#deleteFalse").attr("style","display:none;");//隐藏删除失败DIV
	 $.getJSON('findById.do?BuyinId='+BuyinId,function(buyin){
         var upbuyinproductId=buyin.buyinproductId
		 //给表单赋值
		 $("#upproductType").val(buyin.productType);
		 $("#upproductName").val(buyin.productName);
		 $("#upproductSpecs").val(buyin.productSpecs);
		 $("#upproductId").val(buyin.productId);
		 
		 $("#upbuyinPrice").val(buyin.buyinPrice);
		 $("#upbuyinTotal").val(buyin.buyinTotal);
		 $("#upbuyinNum").val(buyin.buyinNum);
		 $("#upbuyinPay").val(buyin.buyinPay);
		 $("#upbuyinDebt").val(buyin.buyinDebt);
		 $("#upbuyinRemarks").val(buyin.buyinRemarks);
		 $("#upbuyinId").val(buyin.buyinId);
		 $("#upbuyinProductId").val(buyin.buyinProductId);
		 //
	 });
}
//修改表单提交
$(function(){
	 //更新表单提交
	 $("#btupdate").click(function(){
		 $("#addTrue").attr("style","display:none;");//隐藏添加成功DIV
		 $("#addFalse").attr("style","display:none;");//隐藏添加失败DIV
		 $("#updateTrue").attr("style","display:none;");//隐藏修改成功DIV
		 $("#updateFalse").attr("style","display:none;");//隐藏修改失败DIV
		 $("#deleteTrue").attr("style","display:none;");//隐藏删除成功DIV
		 $("#deleteFalse").attr("style","display:none;");//隐藏删除失败DIV
		 var productType=$("#upproductType").val();
		 var productName=$("#upproductName").val();
		 var productSpecs=$("#upproductSpecs").val();
		 var productId=$("#upproductId").val();
		 
		 var buyinPrice=$("#upbuyinPrice").val();
		 var buyinTotal=$("#upbuyinTotal").val();
		 var buyinNum=$("#upbuyinNum").val();
		 var buyinPay=$("#upbuyinPay").val();
		 var buyinDebt=$("#upbuyinDebt").val();
		 var buyinRemarks=$("#upbuyinRemarks").val();
		 var buyinId=$("#upbuyinId").val();
		 var buyinProductId=$("#upbuyinProductId").val();
		 var buyinWarehouse=$("#upbuyinWarehouse").val();
		 var buyinSupplier=$("#upbuyinSupplier").val();
		 var buyinUser=$("#upbuyinUser").val();
		 var buyinTime=$("#upbuyinTime").val();
		 
		 var jsondate={
				 'productId':productId,
				 'productSpecs':productSpecs,
				 'productName':productName,
				 'productType':productType,
				 'buyinPrice':buyinPrice,
				 'buyinTotal':buyinTotal,
				 'buyinNum':buyinNum,
				 'buyinPay':buyinPay,
				 'buyinDebt':buyinDebt,
				 'buyinRemarks':buyinRemarks,
				 'buyinId':buyinId,
				 'buyinProductId':buyinProductId,
				 'buyinWarehouse':buyinWarehouse,
				 'buyinSupplier':buyinSupplier,
				 'buyinUser':buyinUser,
				 'buyinTime':buyinTime
		 }
		 $.ajax({                                
			    url:"BuyinUpdate.do",
			    type:'POST',
			    contentType: "application/json; charset=utf-8",  
			    dataType:'json',//json 返回值类型
			    data: JSON.stringify(jsondate),//转化为json字符串
			    success:function(code){
					 if(code=='1'){
						 $("#formadd").attr('style','display:block');//显示添加表单
						 $("#formupdate").attr("style","display:none;");//隐藏修改表单
						 $("#updateTrue").attr("style","display:block;font-size:30px;color:green;");//显示修改成功DIV
						 $("#form2").attr('style','display:none');
						 showAll();
					 }else{
						 $("#updateFalse").attr("style","display:block;font-size:30px;color:red;");//显示修改失败DIV
					}
				 }
			});
		 
	 });
	 
	//添加表单提交
	 $("#btadd").click(function(){
		 
		 $("#addTrue").attr("style","display:none;");//隐藏添加成功DIV
		 $("#addFalse").attr("style","display:none;");//隐藏添加失败DIV
		 $("#updateTrue").attr("style","display:none;");//隐藏修改成功DIV
		 $("#updateFalse").attr("style","display:none;");//隐藏修改失败DIV
		 $("#deleteTrue").attr("style","display:none;");//隐藏删除成功DIV
		 $("#deleteFalse").attr("style","display:none;");//隐藏删除失败DIV
		 var productType=$("#productType").val();
		 var productName=$("#productName").val();
		 var productSpecs=$("#productSpecs").val();
		 var productId=$("#productId").val();
		 
		 var buyinPrice=$("#buyinPrice").val();
		 var buyinNum=$("#buyinNum").val();
		 var buyinTotal=buyinNum * buyinPrice;
		 var buyinPay=$("#buyinPay").val();
		 var buyinDebt=buyinPay - buyinTotal;
		 var buyinRemarks=$("#buyinRemarks").val();
		 var buyinId=$("#buyinId").val();
		 var buyinProductId=$("#buyinProductId").val();
		 var buyinWarehouse=$("#buyinWarehouse").val();
		 var buyinSupplier=$("#buyinSupplier").val();
		 var buyinUser=$("#buyinUser").val();
		 var buyinTime=$("#buyinTime").val();
		 
		 var jsondate={
				 
					 		"buyinProductId":buyinProductId,
					 		"buyinNum":buyinNum,
				 			"buyinPrice":buyinPrice,
				 			"buyinTotal":buyinTotal,
				 			"buyinPay":buyinPay,
				 			"buyinDebt":buyinDebt,
				 			"buyinWarehouse":buyinWarehouse,
				 			"buyinSupplier":buyinSupplier,
				 			"buyinTime":buyinTime,
				 			"buyinUser":buyinUser,
				 			"buyinRemarks":buyinRemarks,
				 		
				 	
				 			"productId":productId,
							"productName":productName,
					 		"productType":productType,
					 		"productSpecs":productSpecs
					 	
		 }; 
		 $.ajax({                                
			    url:"BuyinSave.do",
			    type:"POST",
			    contentType: "application/json; charset=utf-8",  
			    dataType:"json",//json 返回值类型
			    data: JSON.stringify(jsondate),//转化为json字符串
			    success:function(code){
					 if(code=='1'){
						 $("#formadd").attr('style','display:block');//显示添加表单
						 $("#formupdate").attr("style","display:none;");//隐藏修改表单
						 $("#addTrue").attr("style","display:block;font-size:30px;color:green;");//显示添加成功DIV
						 $("#form2").attr('style','display:none');
						 showAll();
					 }else{
						 $("#addFalse").attr("style","display:block;font-size:30px;color:red;");//显示添加失败DIV
					 }
				 }
			});
		
	 });
});
//注销二次确认
function Loginout(){
	return window.confirm("您确定要注销吗?");
}
//显示初始页面内容
$(function(){
	 $("#formadd").attr('style','display:block');//显示添加表单
	 $("#formupdate").attr("style","display:none;");//隐藏修改表单
	 $("#addTrue").attr("style","display:none;");//隐藏添加成功DIV
	 $("#addFalse").attr("style","display:none;");//隐藏添加失败DIV
	 $("#deleteTrue").attr("style","display:none;");//隐藏删除成功DIV
	 $("#deleteFalse").attr("style","display:none;");//隐藏删除失败DIV
	 $("#updateTrue").attr("style","display:none;");//隐藏修改成功DIV
	 $("#updateFalse").attr("style","display:none;");//隐藏修改失败DIV
	 showAll();
});

/*************显示列表************************/
var currentPageNo=1;//当前页码
var pageSize=5;//页面容量
var totalPageCount=1;//总页数
function showAll(){
	  //使用Ajax获取后台数据
	  
	  $.getJSON("BuyinPageList.do?currentPageNo="+currentPageNo+"&pageSize="+pageSize,function(JsonBuyin){
		  currentPageNo=JsonBuyin.currentPageNo;
		  pageSize=JsonBuyin.pageSize;
		  totalPageCount=JsonBuyin.totalPageCount;
		  var tablehead="<table width='1200px' align='center' border='1'>"
		                +"<tr>"
		                +"<td style='font-size:30px;height:40px;font-weight:bold;' colspan='16' align='center' bgcolor='#379BE9'>全部采购进货记录合计</td>"
		                +"</tr>"
		                +"<tr bgcolor='#FFFFCC' align='center'>"
		                +"<td>采购编号</td>"
		                +"<td>商品大类</td>"
		                +"<td>商品名称</td>"
		                +"<td>商品规格</td>"
		                +"<td>商品编码</td>"
		                +"<td>进货日期</td>"
		                +"<td>进货数量</td>"
		                +"<td>进货单价</td>"
		                +"<td>合计</td>"
		                +"<td>已付金额</td>"
		                +"<td>欠款金额</td>"
		                +"<td>供货商</td>"
		                +"<td>进货人</td>"
		                +"<td>仓库</td>"
		                +"<td>备注</td>"
		                +"<td>操作</td>"
		                +"</tr>";
		  var trs="";
		   for(var i=0;i<JsonBuyin.pagelist.length;i++){
			   var buyin=JsonBuyin.pagelist[i];
			   if(i%2==0){
				   trs+="<tr bgcolor='#F1F3F4'>"
		               +"<td>"+buyin.buyinId+"</td>"
		               +"<td>"+buyin.productType+"</td>"
		               +"<td>"+buyin.productName+"</td>"
		               +"<td>"+buyin.productSpecs+"</td>"
		               +"<td>"+buyin.buyinProductId+"</td>"
		               +"<td>"+buyin.buyinTime+"</td>"
		               +"<td>"+buyin.buyinNum+"</td>"
		               +"<td>"+buyin.buyinPrice+"</td>"
		               +"<td>"+buyin.buyinTotal+"</td>"
		               +"<td>"+buyin.buyinPay+"</td>"
		               +"<td>"+buyin.buyinDebt+"</td>"
		               +"<td>"+buyin.buyinSupplier+"</td>"
		               +"<td>"+buyin.buyinUser+"</td>"
		               +"<td>"+buyin.buyinWarehouse+"</td>"
		               +"<td>"+buyin.buyinRemarks+"</td>"
		               +"<td>"
		               +"<input type='button' id='btdelete' name='btdelete' value='删除' onclick='deleteById("+buyin.buyinProductId+")'>"
		               +"<input type='button' id='btedit' name='btedit' value='修改' onclick='dofindById("+buyin.buyinId+")'>"
		               +"</td>"
		               +"</tr>";
			   }
			   if(i%2!=0){
				   trs+="<tr>"
		               +"<td>"+buyin.buyinId+"</td>"
		               +"<td>"+buyin.productType+"</td>"
		               +"<td>"+buyin.productName+"</td>"
		               +"<td>"+buyin.productSpecs+"</td>"
		               +"<td>"+buyin.buyinProductId+"</td>"
		               +"<td>"+buyin.buyinTime+"</td>"
		               +"<td>"+buyin.buyinNum+"</td>"
		               +"<td>"+buyin.buyinPrice+"</td>"
		               +"<td>"+buyin.buyinTotal+"</td>"
		               +"<td>"+buyin.buyinPay+"</td>"
		               +"<td>"+buyin.buyinDebt+"</td>"
		               +"<td>"+buyin.buyinSupplier+"</td>"
		               +"<td>"+buyin.buyinUser+"</td>"
		               +"<td>"+buyin.buyinWarehouse+"</td>"
		               +"<td>"+buyin.buyinRemarks+"</td>"
		               +"<td>"
		               +"<input type='button' id='btdelete' name='btdelete' value='删除' onclick='deleteById("+buyin.buyinProductId+")'>"
		               +"<input type='button' id='btedit' name='btedit' value='修改' onclick='dofindById("+buyin.buyinId+")'>"
		               +"</td>"
		               +"</tr>";
			   }
			  
		   } 
		   var tableend=tablehead+trs+"</table>";
		   //将值设置到div
		   $("#mytable").html(tableend);
		   //给分页组件赋值
		   $("#pageSize").val(pageSize);
		   $("#currentPageNo").val(currentPageNo);
		   $("#pagetable").html(currentPageNo+"/"+totalPageCount);
		   //
		   if(currentPageNo==1&&totalPageCount==1){//总一页(全隐藏)
			   $("#btup").attr('disabled',true);
			   $("#btfirst").attr('disabled',true);
			   $("#btnext").attr('disabled',true);
			   $("#btlast").attr('disabled',true); 
		   }
		   if(currentPageNo==1){//第一页（隐藏前两个）
			   $("#btup").attr('disabled',true);
			   $("#btfirst").attr('disabled',true);
		   }
		   if(currentPageNo==1&&totalPageCount>1){//第一页（释放后两个）
			   $("#btnext").attr('disabled',false);
			   $("#btlast").attr('disabled',false); 
		   }
		   if(currentPageNo>1&&currentPageNo<totalPageCount){//中间页（全释放）
			   $("#btup").attr('disabled',false);
			   $("#btfirst").attr('disabled',false);
			   $("#btnext").attr('disabled',false);
			   $("#btlast").attr('disabled',false); 
		   }
		   if(currentPageNo==totalPageCount&&currentPageNo>1){//最后一页（隐藏后两个，释放前两个）
			   $("#btnext").attr('disabled',true);
			   $("#btlast").attr('disabled',true); 
			   $("#btup").attr('disabled',false);
			   $("#btfirst").attr('disabled',false);
		   }
	  });
}
/*************显示列表end*********************/
/*************分页组件*********************/
   $(function(){
	   $("#btfirst").click(function(){
		   currentPageNo=1;
		   showAll();
	   });
	   $("#btup").click(function(){
		   currentPageNo=currentPageNo-1;
		   if(currentPageNo<1){
			   currentPageNo=1;
		   }
		   showAll();
	   });
	   $("#btnext").click(function(){
		   currentPageNo=currentPageNo+1;
		   if(currentPageNo>totalPageCount){
			   currentPageNo=totalPageCount;
		   }
		   
		   showAll();
	   });
	   $("#btlast").click(function(){
		   currentPageNo=totalPageCount;
		      showAll();
	   });
	   //更改每页记录数
	   $("#btchaneRows").click(function(){
			var rowsval=$("#pageSize").val();
			if(isNaN(rowsval)){
				alert("请输入正确数字");
				$("#rows").val(pageSize);
				return;
			}
			pageSize=rowsval;
		      showAll();
	   });
	   //更改页数
	   $("#btchanePage").click(function(){
			var pageval=$("#currentPageNo").val();
			if(isNaN(pageval)){
				alert("请输入正确数字");
				$("#currentPageNo").val(currentPageNo);
				return;
			}
			currentPageNo=pageval;
		      showAll();
	   });
   });
/*************分页组件end******************/
</script>

</head>
<body style="margin-bottom:40px">
<br>
	<div style="font-size:30px;font-weight:bold;position:absolute;left:30px;">仓库管理系统MyBatis-Spring版</div>
	
	<div align="center">
	

			<div class="dropdown">
 				<button class="dropbtn">采购</button>
 				<div class="dropdown-content">
 					<a href="buyin.jsp">采购进货</a>
 					<a href="#">采购退货</a>
 				</div>
			</div>

	
		<c:if test="${nowuser.powerSale==1}">
			<div class="dropdown">
 				<button class="dropbtn">销售</button>
 				<div class="dropdown-content">
 					<a href="#">销售出货</a>
 					<a href="#">销售退货</a>
 				</div>
			</div>
		</c:if>
	
		<c:if test="${nowuser.powerInventoryview==1}">
			<div class="dropdown">
 				<button class="dropbtn">库存查看</button>
 				<div class="dropdown-content">
 					<a href="#">商品库存</a>
 					<a href="#">各仓库库存</a>
 				</div>
			</div>
		</c:if>
		
		<c:if test="${nowuser.powerProfit==1}">
			<div class="dropdown">
 				<button class="dropbtn">利润</button>
 				<div class="dropdown-content">
 					<a href="#">商品利润</a>
 					<a href="#">客户利润</a>
 				</div>
			</div>
		</c:if>
		
		<c:if test="${nowuser.powerWarehouseManage==1}">
			<div class="dropdown">
 				<button class="dropbtn">仓库管理</button>
 				<div class="dropdown-content">
 					<a href="#">仓库管理</a>
 				</div>
			</div>
		</c:if>

		<c:if test="${nowuser.powerAllocationManage==1}">
			<div class="dropdown">
 				<button class="dropbtn">仓库调拨</button>
 				<div class="dropdown-content">
 					<a href="#">仓库调拨</a>
 				</div>
			</div>
		</c:if>

		<c:if test="${nowuser.powerCustomerManage==1}">
			<div class="dropdown">
 				<button class="dropbtn">客户管理</button>
 				<div class="dropdown-content">
 					<a href="#">客户管理</a>
 					<a href="#">供货商管理</a>
 				</div>
			</div>
		</c:if>

		<c:if test="${nowuser.powerStaffManage==1}">
			<div class="dropdown">
 			<button class="dropbtn">员工管理</button>
 			<div class="dropdown-content">
 					<a href="Employeelist.jsp">员工管理</a>
 					<a href="zhuce.jsp">员工注册</a>
 			</div>
			</div>
		</c:if>
</div>

<div style="height:30px;color:red;font-size:18px;position:absolute;display:inline-block;right:30px;">
	<div style="float:left;display:inline-block;">当前用户:${nowuser.utypeName}-${nowuser.uname}&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div style="width:30px;float:left;">
		<form action="LoServlet" method="post" onsubmit="return Loginout()">
 		<input type="submit" value="注销">
		</form>
	</div>
</div>

<br>
<hr>
<br>

<!-- 添加表单 -->
<form action="" method="post" id="formadd" name="formadd">
<table height ="400px" border="1" align="center">
    <tr><td style="font-size:30px;height:50px;font-weight:bold;" colspan="6" align="center" bgcolor="#FFFFCC">采购进货-添加</td></tr>
	<tr>
		<td>商品大类(必填)</td>
		<td><input type="text" id="productType" name="productType" style="width:98%"></td>
		<td>进货数量</td>
		<td><input type="text" id="buyinNum" name="buyinNum" style="width:98%"></td>
		<td>仓库</td>
		<td>
			<select id="buyinWarehouse" name="buyinWarehouse" style="width:100%">
  				<option value ="总仓库" >总仓库</option>
 				<option value ="A仓库" >A仓库</option>
 			 	<option value ="B仓库" >B仓库</option>
 			 	<option value ="C仓库" >C仓库</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>商品名称(必填)</td>
		<td><input type="text" id="productName" name="productName" style="width:98%"></td>
		<td>进货单价</td>
		<td><input type="text" id="buyinPrice" name="buyinPrice" style="width:98%"></td>
		<td>供货商</td>
		<td>
			<select id="buyinSupplier" name="buyinSupplier" style="width:100%">
  				<option value ="供货商A" >供货商A</option>
 				<option value ="供货商B" >供货商B</option>
			</select>
        </td>
	</tr>
	<tr>
		<td>规格(颜色型号)</td>
		<td><input type="text" id="productSpecs" name="productSpecs" style="width:98%"></td>
		<td>合计</td>
		<td><input type="text" id="buyinTotal" name="buyinTotal" style="width:98%" disabled></td>
		<td>进货日期</td>
		<td><input type="date" id="buyinTime" name="buyinTime" style="width:98%"></td>
	</tr>
	<tr>
		<td>商品编码(必填)</td>
		<td><input type="text" id="productId" name="productId" style="width:98%"></td>
		<td>已付金额</td>
		<td><input type="text" id="buyinPay" name="buyinPay" style="width:98%"></td>
		<td>进货人</td>
		<td>
			<select id="buyinUser" name="buyinUser" style="width:100%">
  				<option value ="管理员" >管理员</option>
 				<option value ="普通用户" >普通用户</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">库存数</td>
		<td><input type="text" style="width:98%" disabled></td>
		<td colspan="2" align="center">欠款金额</td>
		<td><input type="text" id="buyinDebt" name="buyinDebt" style="width:98%" disabled></td>
	</tr>
	<tr>
		<td align="center">备注</td>
		<td colspan="5"><textarea name="buyinRemarks" id="buyinRemarks" cols="110" rows="8" style="width:99%"></textarea></td>
	</tr>
	<tr>
		<td style="height:50px;" colspan="6" align="center">
		<input type="hidden" id="op1" name="op1" value="1" >
		<input style="width:80px;height:40px;"  type="button" id="btadd" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input style="width:80px;height:40px;" type="reset" value="重置"></td>
	</tr>
</table>
</form>

<!-- 修改表单 -->
<form action="" method="post" id="formupdate" name="formupdate">
<table border="1" align="center">
    <tr><td style="font-size:30px;height:50px;font-weight:bold;" colspan="6" align="center" bgcolor="#FFFFCC">采购进货-修改</td></tr>
	<tr>
		<td align="center">商品大类(必填)</td>
		<td><input type="text" id="upproductType" name="upproductType" style="width:98%" value=""></td>
		<td>进货数量</td>
		<td><input type="text" id="upbuyinNum" name="upbuyinNum" style="width:98%" value=""></td>
		<td>仓库</td>
		<td>
			<select id="upbuyinWarehouse" name="upbuyinWarehouse" style="width:100%">
  				<option value ="总仓库" >总仓库</option>
 				<option value ="A仓库" >A仓库</option>
 			 	<option value ="B仓库" >B仓库</option>
 			 	<option value ="C仓库" >C仓库</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>商品名称(必填)</td>
		<td><input type="text" id="upproductName" name="upproductName" style="width:98%" value=""></td>
		<td>进货单价</td>
		<td><input type="text" id="upbuyinPrice" name="upbuyinPrice" style="width:98%" value=""></td>
		<td>供货商</td>
		<td>
			<select id="upbuyinSupplier" name="upbuyinSupplier" style="width:100%">
  				<option value ="供货商A" >供货商A</option>
 				<option value ="供货商B" >供货商B</option>
			</select>
        </td>
	</tr>
	<tr>
		<td>规格(颜色型号)</td>
		<td><input type="text" id="upproductSpecs" name="upproductSpecs" style="width:98%" value=""></td>
		<td>合计</td>
		<td><input type="text" id="upbuyinTotal" name="upbuyinTotal" style="width:98%" value="" disabled></td>
		<td>进货日期</td>
		<td><input type="date" id="upbuyinTime" name="upbuyinTime" style="width:98%" value=""></td>
	</tr>
	<tr>
		<td>商品编码(必填)</td>
		<td><input type="text" id="upproductId" name="upproductId" style="width:98%" value=""></td>
		<td>已付金额</td>
		<td><input type="text" id="upbuyinPay" name="upbuyinPay" style="width:98%" value=""></td>
		<td>进货人</td>
		<td>
			<select id="upbuyinUser" name="upbuyinUser" style="width:100%">
  				<option value ="管理员" >管理员</option>
 				<option value ="普通用户" >普通用户</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">库存数</td>
		<td><input type="text" style="width:98%" disabled></td>
		<td colspan="2" align="center">欠款金额</td>
		<td><input type="text" id="upbuyinDebt" name="upbuyinDebt" style="width:98%" value="" disabled></td>
	</tr>
	<tr>
		<td align="center">备注</td>
		<td colspan="5"><textarea name="upbuyinRemarks" id="upbuyinRemarks" cols="110" rows="8" style="width:99%" ></textarea></td>
	</tr>
	<tr>
		<td style="height:50px;" colspan="6" align="center">
		<input type="hidden" id="op" name="op" value="2" >
		<input type="hidden" id="upbuyinId" name="upbuyinId" value="" >
		<input type="hidden" id="upbuyinProductId" name="upbuyinProductId" value="" >
		<input style="width:80px;height:40px;" type="button" id="btupdate" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input style="width:80px;height:40px;" type="reset" value="重置"></td>
	</tr>
</table>
</form>

<br><!--操作提示信息-->
	<div id="addTrue" style="font-size:30px;color:green;" align="center">添加成功!</div>
	<div id="addFalse" style="font-size:30px;color:red;" align="center">添加失败!</div>
	<div id="deleteTrue" style="font-size:30px;color:green;" align="center">删除成功!</div>
	<div id="deleteFalse" style="font-size:30px;color:red;" align="center">删除失败!</div>
	<div id="updateTrue" style="font-size:30px;color:green;" align="center">修改成功!</div>
	<div id="updateFalse" style="font-size:30px;color:red;" align="center">修改失败!</div>
<br>
<hr>
<br>
<!--采购信息展示-->
<div id="mytable"></div>

<!--底部翻页条-->
<div style="position:fixed; bottom:0px;width:99%" align="center">
	<form action="" id="formpagebuyin" name="formpagebuyin">
	<table width="1200px" height="30px" align="center" border="1" bgcolor="#DCDCDC">
		<tr align="center">
  
  		<td><input type="button" name="btfirst" id="btfirst" value="首页"></td>
 
  		<td><input type="button" name="btup" id="btup" value="上一页"></td>
  
  		<td><input type="button" name="btnext" id="btnext" value="下一页"></td>
  
  		<td><input type="button" name="btlast" id="btlast" value="尾页"></td>
  
  		<td>跳转到第<input type="text" name="currentPageNo" id="currentPageNo" value="1">页
  			<input type="button" name="btchanePage" id="btchanePage" value="确定"></td>
  
  		<td>每页 <input type="text" name="pageSize" id="pageSize" value="5">条记录
  			<input type="button" name="btchaneRows" id="btchaneRows" value="确定"></td>
  
  		<td><div id="pagetable"></div></td>
		</tr>
	</table>
	</form>
</div>


</body>
</html>