package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.BuyinMapper;
import com.pojo.BuyIn;
import com.pojo.BuyInSearch;
import com.pojo.ProductInfo;

@Service("BuyinBiz")
@Transactional
public class BuyinBiz implements IBuyinBiz{
	@Resource(name="BuyinMapper")
	private BuyinMapper buyinmapper;
	
    public BuyinMapper getBuyinmapper() {
		return buyinmapper;
	}

	public void setBuyinmapper(BuyinMapper buyinmapper) {
		this.buyinmapper = buyinmapper;
	}

	
    //采购进货信息保存
	public int save(BuyIn buyin, ProductInfo productInfo) {
		
		return buyinmapper.save(buyin, productInfo);
	}
	
	
	//采购进货信息更新
	public int update(BuyIn buyin,ProductInfo productInfo,String BuyinProductId) {
		
		return buyinmapper.update(buyin, productInfo, BuyinProductId);
	}
	
	//采购进货删除
	public int delById(String ProductId) {
		
		return buyinmapper.delById(ProductId);
	}
	
	//根据采购ID查找
	public BuyInSearch findById(String BuyinId) {
		
		Map<String,Object> param=new HashMap<String, Object>();
		param.put("pageNo", null);
		param.put("pageSize", null);
		param.put("BuyinId", BuyinId);
		return buyinmapper.find(param).get(0);
	}
	
	//获取采购进货信息总条数
	public int getTotalCount() {
		
		return buyinmapper.getTotalCount();
	}
	
	//获取分页列表
	public List<BuyInSearch> getPageBuyinList(Integer pageNo, Integer pageSize) {
		Map<String,Object> param=new HashMap<String, Object>();
		param.put("pageNo", (pageNo-1)*pageSize);
		param.put("pageSize", pageSize);
		param.put("BuyinId", null);
		return buyinmapper.find(param);
	}

}
