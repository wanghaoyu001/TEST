package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import com.pojo.BuyIn;
import com.pojo.BuyInSearch;
import com.pojo.ProductInfo;
import com.service.IBuyinBiz;
import com.util.AJAXUtil;
import com.util.Pageutil;

@Controller
public class BuyinController implements IBuyinController {
	@Resource(name = "BuyinBiz")
	private IBuyinBiz buyinbiz;

	public IBuyinBiz getBuyinbiz() {
		return buyinbiz;
	}

	public void setBuyinbiz(IBuyinBiz buyinbiz) {
		this.buyinbiz = buyinbiz;
	}

	
	@RequestMapping(value = "BuyinSave.do",method=RequestMethod.POST)
	@ResponseBody//加上这个注解，return 就不会再跳转页面，只是返回数据（json）
	public String save(HttpServletRequest request, HttpServletResponse response,@RequestBody BuyInSearch buyinsearch) {
		BuyInSearch buyinsearch1 = buyinsearch;
		System.out.println(buyinsearch1.toString());
		
		BuyIn buyin=new BuyIn();
		buyin.setBuyinProductId(buyinsearch1.getProductId());
		buyin.setBuyinNum(buyinsearch1.getBuyinNum());
		buyin.setBuyinPrice(buyinsearch1.getBuyinPrice());
		buyin.setBuyinTotal(buyinsearch1.getBuyinTotal());
		buyin.setBuyinPay(buyinsearch1.getBuyinPay());
		buyin.setBuyinDebt(buyinsearch1.getBuyinDebt());
		buyin.setBuyinWarehouse(buyinsearch1.getBuyinWarehouse());
		buyin.setBuyinSupplier(buyinsearch1.getBuyinSupplier());
		buyin.setBuyinTime(buyinsearch1.getBuyinTime());
		buyin.setBuyinUser(buyinsearch1.getBuyinUser());
		buyin.setBuyinRemarks(buyinsearch1.getBuyinRemarks());
		
		ProductInfo productInfo=new ProductInfo();
		productInfo.setProductId(buyinsearch1.getProductId());
		productInfo.setProductName(buyinsearch1.getProductName());
		productInfo.setProductSpecs(buyinsearch1.getProductSpecs());
		productInfo.setProductType(buyinsearch1.getProductType());
		
		int flag = buyinbiz.save(buyin,productInfo);
		if (flag > 0) {
			String jsonadd = JSONObject.toJSONString(1);
			AJAXUtil.printString(response, jsonadd);
		} else {
			String jsonadd = JSONObject.toJSONString(0);
			AJAXUtil.printString(response, jsonadd);
		}
		return null;
	}

	
	@RequestMapping(value = "BuyinUpdate.do",method=RequestMethod.POST)
	@ResponseBody//加上这个注解，return 就不会再跳转页面，只是返回数据（json）
	public String update(HttpServletRequest request, HttpServletResponse response, @RequestBody BuyInSearch buyinsearch) {
		BuyInSearch buyinsearch1 = buyinsearch;
		BuyIn buyin=new BuyIn();
		buyin.setBuyinId(buyinsearch1.getBuyinId());
		buyin.setBuyinProductId(buyinsearch1.getBuyinProductId());
		buyin.setBuyinNum(buyinsearch1.getBuyinNum());
		buyin.setBuyinPrice(buyinsearch1.getBuyinPrice());
		buyin.setBuyinTotal(buyinsearch1.getBuyinTotal());
		buyin.setBuyinPay(buyinsearch1.getBuyinPay());
		buyin.setBuyinDebt(buyinsearch1.getBuyinDebt());
		buyin.setBuyinWarehouse(buyinsearch1.getBuyinWarehouse());
		buyin.setBuyinSupplier(buyinsearch1.getBuyinSupplier());
		buyin.setBuyinTime(buyinsearch1.getBuyinTime());
		buyin.setBuyinUser(buyinsearch1.getBuyinUser());
		buyin.setBuyinRemarks(buyinsearch1.getBuyinRemarks());
		
		ProductInfo productInfo=new ProductInfo();
		productInfo.setProductId(buyinsearch1.getProductId());
		productInfo.setProductName(buyinsearch1.getProductName());
		productInfo.setProductSpecs(buyinsearch1.getProductSpecs());
		productInfo.setProductType(buyinsearch1.getProductType());
		int updateflag = buyinbiz.update(buyin, productInfo, buyinsearch1.getBuyinProductId());
		if (updateflag > 0) {
			String jsonupdate = JSONObject.toJSONString(1);
			AJAXUtil.printString(response, jsonupdate);
		} else {
			String jsonupdate = JSONObject.toJSONString(0);
			AJAXUtil.printString(response, jsonupdate);
		}
		return null;
	}

	
	@RequestMapping(value = "BuyinDelById.do")
	@ResponseBody//加上这个注解，return 就不会再跳转页面，只是返回数据（json）
	public String delById(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "buyinProductId")String buyinProductId) {
		int delflag=buyinbiz.delById(buyinProductId);
		if (delflag > 0) {
			String jsondel = JSONObject.toJSONString(1);
			AJAXUtil.printString(response, jsondel);
		} else {
			String jsondel = JSONObject.toJSONString(0);
			AJAXUtil.printString(response, jsondel);
		}
		return null;
	}

	
	@RequestMapping(value = "findById.do")
	@ResponseBody//加上这个注解，return 就不会再跳转页面，只是返回数据（json）
	public String findById(HttpServletRequest request, HttpServletResponse response, String BuyinId) {
		BuyInSearch bSearch=buyinbiz.findById(BuyinId);
		String jsonbSearch=JSONObject.toJSONString(bSearch);
		AJAXUtil.printString(response, jsonbSearch);	
		return null;
	}


	
	@RequestMapping(value = "BuyinPageList.do")
	@ResponseBody//加上这个注解，return 就不会再跳转页面，只是返回数据（json）
	public void getPageBuyinList(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "currentPageNo") String currentPageNo,
			@RequestParam(value = "pageSize")String pageSize) {
		
		HttpSession session=request.getSession();
		// 创建分页类对象
		Pageutil pgbuyin = (Pageutil) session.getAttribute("pgbuyin");
		pgbuyin = pgbuyin == null ? new Pageutil() : pgbuyin;
		// 设置记录总页数
		int totalCount = buyinbiz.getTotalCount();
		System.out.println("totalCount:" + totalCount);
		pgbuyin.setTotalCount(totalCount);

		// 获取当前页码
		int nowpageIndex = Integer.parseInt(currentPageNo);
		// 获取每页显示数量
		int nowpageSize = Integer.parseInt(pageSize);

		if (nowpageSize < 1) {
			nowpageSize = 1;
		} else if (nowpageSize > totalCount) {
			nowpageSize = totalCount;
		}
		pgbuyin.setPageSize(nowpageSize);
		pgbuyin.setTotalPageCount();
		System.out.println("TotalPageCount:" + pgbuyin.getTotalPageCount());
		if (nowpageIndex < 1) {
			nowpageIndex = 1;
		} else if (nowpageIndex > pgbuyin.getTotalPageCount()) {
			nowpageIndex = pgbuyin.getTotalPageCount();
		}
		pgbuyin.setCurrentPageNo(nowpageIndex);
		System.out.println("nowpageIndex:" + nowpageIndex);
		System.out.println("nowpageSize:" + nowpageSize);
		// 获取记录集合并封装
		List<BuyInSearch> listPage = buyinbiz.getPageBuyinList(nowpageIndex, nowpageSize);
		pgbuyin.setPagelist(listPage);
		// 计算出总页数
		pgbuyin.setTotalPageCount();
		String jsonsPgbuyin = JSONObject.toJSONString(pgbuyin);
		AJAXUtil.printString(response, jsonsPgbuyin);
		System.out.println("jsonsPgbuyin:" + jsonsPgbuyin);
		
	}

}
