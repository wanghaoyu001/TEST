package com.pojo;
//商品信息类
public class ProductInfo {
	private String productId;//商品编号
	private String productName;//商品名称
	private String productType;//商品类型
	private String productSpecs;//商品规格
	
	
	public ProductInfo() {
		super();
		// TODO 自动生成的构造函数存根
	}
	public ProductInfo(String productId, String productName, String productType, String productSpecs) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productType = productType;
		this.productSpecs = productSpecs;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProductSpecs() {
		return productSpecs;
	}
	public void setProductSpecs(String productSpecs) {
		this.productSpecs = productSpecs;
	}
	@Override
	public String toString() {
		return "ProductInfo [productId=" + productId + ", productName=" + productName + ", productType=" + productType
				+ ", productSpecs=" + productSpecs + "]";
	}
	
}
