package co.yedam.cafein.vo;

public class RecipeVO {

	private String recipeno;
	private String sId;
	private double consum;
	private String stNum;
	private String mNum;
	private String caNum;
	private String opName;
	private String opPrice;
	
	
	public double getConsum() {
		return consum;
	}
	public void setConsum(double consum) {
		this.consum = consum;
	}
	public String getOpPrice() {
		return opPrice;
	}
	public void setOpPrice(String opPrice) {
		this.opPrice = opPrice;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}
	public String getRecipeno() {
		return recipeno;
	}
	public void setRecipeno(String recipeno) {
		this.recipeno = recipeno;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	@Override
	public String toString() {
		return "RecipeVO [recipeno=" + recipeno + ", sId=" + sId + ", consum=" + consum + ", stNum=" + stNum + ", mNum="
				+ mNum + ", caNum=" + caNum + ", opName=" + opName + ", opPrice=" + opPrice + "]";
	}
	
	
	
}
