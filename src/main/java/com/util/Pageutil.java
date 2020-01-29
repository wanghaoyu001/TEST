package com.util;

import java.util.List;

//分页工具类
public class Pageutil {
	//当前页码
	private int currentPageNo = 1;
	//记录总数量
	private int totalCount = 0;
	//页面容量
	private int pageSize = 5;
	//总页数
	private int totalPageCount = 1;
	//结果集
	private List<?> pagelist;
	
	//结果集
	public List<?> getPagelist() {
		return pagelist;
	}
	public void setPagelist(List<?> pagelist) {
		this.pagelist = pagelist;
	}
	
	//当前页码
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		if (currentPageNo>0) {
			this.currentPageNo = currentPageNo;
		}
		
	}
		
	//记录总数量
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		if (totalCount>=0) {
			this.totalCount = totalCount;
		}
	}
	
	//页面容量
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if (pageSize>0) {
			this.pageSize = pageSize;
		}
		
	}
	
	//总页数
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount() {
		if (this.totalCount%this.pageSize==0) {
			this.totalPageCount = this.totalCount/this.pageSize;
		}else if (this.totalCount%this.pageSize!=0) {
			this.totalPageCount = this.totalCount/this.pageSize+1;
		}else {
			this.totalPageCount = 0;
		}
	}
	
}
