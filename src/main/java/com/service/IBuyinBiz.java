package com.service;

import java.util.List;

import com.pojo.BuyIn;
import com.pojo.BuyInSearch;
import com.pojo.ProductInfo;

public interface IBuyinBiz {
	//采购进货记录保存
	public int save(BuyIn buyin, ProductInfo productInfo);
	
	//采购进货记录更新
	public int update(BuyIn buyin, ProductInfo productInfo, String BuyinProductId);
	
	//根据产品ID删除
	public int delById(String ProductId);
	
	//根据采购ID查找
	public BuyInSearch findById(String BuyinId);

	//获取采购进货信息总条数
	public int getTotalCount();

	//分页获取采购进货信息数据
	public List<BuyInSearch> getPageBuyinList(Integer pageNo, Integer pageSize);
}
