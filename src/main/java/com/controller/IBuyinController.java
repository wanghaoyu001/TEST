package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pojo.BuyInSearch;

public interface IBuyinController {
	//??????????????
		public String save(HttpServletRequest request, HttpServletResponse response, BuyInSearch buyinsearch);
		
		//??????????????
		public String update(HttpServletRequest request, HttpServletResponse response, BuyInSearch buyinsearch);
		
		//??????ID???
		public String delById(HttpServletRequest request, HttpServletResponse response, String ProductId);
		
		//??????ID????
		public String findById(HttpServletRequest request, HttpServletResponse response, String BuyinId);

		//????????????????????
		public void getPageBuyinList(HttpServletRequest request, HttpServletResponse response, String currentPageNo, String pageSize);
}
