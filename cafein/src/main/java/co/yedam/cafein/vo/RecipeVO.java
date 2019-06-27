package co.yedam.cafein.vo;

public class RecipeVO {

	private String recipeno;
	private String sId;
	private int consum;
	private String stNum;
	private String mNum;
	
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
	public int getConsum() {
		return consum;
	}
	public void setConsum(int consum) {
		this.consum = consum;
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
				+ mNum + "]";
	}
	
}
