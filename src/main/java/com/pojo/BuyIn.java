package com.pojo;
//采购进货类
public class BuyIn {
	private int buyinId = 0;//采购编号
	private String buyinProductId;//商品编号
	private int buyinNum;//进货数量
	private double buyinPrice;//进货单价
	private double buyinTotal;//合计
	private double buyinPay;//已付金额
	private double buyinDebt;//欠款金额
	private String buyinWarehouse;//仓库
	private String buyinSupplier;//供货商
	private String buyinTime;//进货日期
	private String buyinUser;//进货人
	private String buyinRemarks;//备注
	
	public BuyIn() {
		super();
		// TODO 自动生成的构造函数存根
	}


	public BuyIn(int buyinId, String buyinProductId, int buyinNum, double buyinPrice, double buyinTotal,
			double buyinPay, double buyinDebt, String buyinWarehouse, String buyinSupplier, String buyinTime,
			String buyinUser, String buyinRemarks) {
		super();
		this.buyinId = buyinId;
		this.buyinProductId = buyinProductId;
		this.buyinNum = buyinNum;
		this.buyinPrice = buyinPrice;
		this.buyinTotal = buyinTotal;
		this.buyinPay = buyinPay;
		this.buyinDebt = buyinDebt;
		this.buyinWarehouse = buyinWarehouse;
		this.buyinSupplier = buyinSupplier;
		this.buyinTime = buyinTime;
		this.buyinUser = buyinUser;
		this.buyinRemarks = buyinRemarks;
	}


	public int getBuyinId() {
		return buyinId;
	}


	public void setBuyinId(int buyinId) {
		this.buyinId = buyinId;
	}


	public String getBuyinProductId() {
		return buyinProductId;
	}

	public void setBuyinProductId(String buyinProductId) {
		this.buyinProductId = buyinProductId;
	}

	public int getBuyinNum() {
		return buyinNum;
	}

	public void setBuyinNum(int buyinNum) {
		this.buyinNum = buyinNum;
	}

	public double getBuyinPrice() {
		return buyinPrice;
	}

	public void setBuyinPrice(double buyinPrice) {
		this.buyinPrice = buyinPrice;
	}

	public double getBuyinTotal() {
		return buyinTotal;
	}

	public void setBuyinTotal(double buyinTotal) {
		this.buyinTotal = buyinTotal;
	}

	public double getBuyinPay() {
		return buyinPay;
	}

	public void setBuyinPay(double buyinPay) {
		this.buyinPay = buyinPay;
	}

	public double getBuyinDebt() {
		return buyinDebt;
	}

	public void setBuyinDebt(double buyinDebt) {
		this.buyinDebt = buyinDebt;
	}

	public String getBuyinWarehouse() {
		return buyinWarehouse;
	}

	public void setBuyinWarehouse(String buyinWarehouse) {
		this.buyinWarehouse = buyinWarehouse;
	}

	public String getBuyinSupplier() {
		return buyinSupplier;
	}

	public void setBuyinSupplier(String buyinSupplier) {
		this.buyinSupplier = buyinSupplier;
	}

	public String getBuyinTime() {
		return buyinTime;
	}

	public void setBuyinTime(String buyinTime) {
		this.buyinTime = buyinTime;
	}

	public String getBuyinUser() {
		return buyinUser;
	}

	public void setBuyinUser(String buyinUser) {
		this.buyinUser = buyinUser;
	}

	public String getBuyinRemarks() {
		return buyinRemarks;
	}

	public void setBuyinRemarks(String buyinRemarks) {
		this.buyinRemarks = buyinRemarks;
	}


	@Override
	public String toString() {
		return "BuyIn [buyinId=" + buyinId + ", buyinProductId=" + buyinProductId + ", buyinNum=" + buyinNum
				+ ", buyinPrice=" + buyinPrice + ", buyinTotal=" + buyinTotal + ", buyinPay=" + buyinPay
				+ ", buyinDebt=" + buyinDebt + ", buyinWarehouse=" + buyinWarehouse + ", buyinSupplier=" + buyinSupplier
				+ ", buyinTime=" + buyinTime + ", buyinUser=" + buyinUser + ", buyinRemarks=" + buyinRemarks + "]";
	}
	
	
}
