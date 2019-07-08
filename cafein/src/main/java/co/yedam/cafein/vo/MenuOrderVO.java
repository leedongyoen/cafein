package co.yedam.cafein.vo;

public class MenuOrderVO {
	   private String sId;
	   private String sName;
	   private String mName;
	   private String price;
	   private String hotice;
	   private String syrup;
	   private String shot;
	   private String whipping;
	   private String totalPrice;
	   private String cAdd;
	   private String stDeliService;
	   private String qty;
	   
	   
	   
	   public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getcAdd() {
	      return cAdd;
	   }
	   public void setcAdd(String cAdd) {
	      this.cAdd = cAdd;
	   }
	   public String getStDeliService() {
	      return stDeliService;
	   }
	   public void setStDeliService(String stDeliService) {
	      this.stDeliService = stDeliService;
	   }
	   public String getsId() {
	      return sId;
	   }
	   public void setsId(String sId) {
	      this.sId = sId;
	   }
	   public String getsName() {
	      return sName;
	   }
	   public void setsName(String sName) {
	      this.sName = sName;
	   }
	   public String getmName() {
	      return mName;
	   }
	   public void setmName(String mName) {
	      this.mName = mName;
	   }
	   public String getPrice() {
	      return price;
	   }
	   public void setPrice(String price) {
	      this.price = price;
	   }
	   public String getHotice() {
	      return hotice;
	   }
	   public void setHotice(String hotice) {
	      this.hotice = hotice;
	   }
	   public String getSyrup() {
	      return syrup;
	   }
	   public void setSyrup(String syrup) {
	      this.syrup = syrup;
	   }
	   public String getShot() {
	      return shot;
	   }
	   public void setShot(String shot) {
	      this.shot = shot;
	   }
	   public String getWhipping() {
	      return whipping;
	   }
	   public void setWhipping(String whipping) {
	      this.whipping = whipping;
	   }
	   public String getTotalPrice() {
	      return totalPrice;
	   }
	   public void setTotalPrice(String totalPrice) {
	      this.totalPrice = totalPrice;
	   }
	@Override
	public String toString() {
		return "MenuOrderVO [sId=" + sId + ", sName=" + sName + ", mName=" + mName + ", price=" + price + ", hotice="
				+ hotice + ", syrup=" + syrup + ", shot=" + shot + ", whipping=" + whipping + ", totalPrice="
				+ totalPrice + ", cAdd=" + cAdd + ", stDeliService=" + stDeliService + ", qty=" + qty + "]";
	}


	   
}
