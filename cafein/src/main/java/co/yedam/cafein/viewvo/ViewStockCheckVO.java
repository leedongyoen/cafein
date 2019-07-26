package co.yedam.cafein.viewvo;

public class ViewStockCheckVO {

	private String recipeNo;
	private String sId;
	private double consum;
	private String mNum;
	private String stNum;
	private String stName;
	private double stAqty;
	private double stanUnit;
	private String caNum;
	private String opName;
	private int opPrice;
	private String stUnit;
	private int stPrice;
	private int turnNo;
	private String recipeDetail;
	
	
	public int getStPrice() {
		return stPrice;
	}
	public void setStPrice(int stPrice) {
		this.stPrice = stPrice;
	}
	public String getStUnit() {
		return stUnit;
	}
	public void setStUnit(String stUnit) {
		this.stUnit = stUnit;
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
	public int getOpPrice() {
		return opPrice;
	}
	public void setOpPrice(int opPrice) {
		this.opPrice = opPrice;
	}
	public String getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(String recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public double getConsum() {
		return consum;
	}
	public void setConsum(double consum) {
		this.consum = consum;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public double getStAqty() {
		return stAqty;
	}
	public void setStAqty(double stAqty) {
		this.stAqty = stAqty;
	}
	public double getStanUnit() {
		return stanUnit;
	}
	public void setStanUnit(double stanUnit) {
		this.stanUnit = stanUnit;
	}
	public int getTurnNo() {
		return turnNo;
	}
	public void setTurnNo(int turnNo) {
		this.turnNo = turnNo;
	}
	public String getRecipeDetail() {
		return recipeDetail;
	}
	public void setRecipeDetail(String recipeDetail) {
		this.recipeDetail = recipeDetail;
	}
	@Override
	public String toString() {
		return "ViewStockCheckVO [recipeNo=" + recipeNo + ", sId=" + sId + ", consum=" + consum + ", mNum=" + mNum
				+ ", stNum=" + stNum + ", stName=" + stName + ", stAqty=" + stAqty + ", stanUnit=" + stanUnit
				+ ", caNum=" + caNum + ", opName=" + opName + ", opPrice=" + opPrice + ", stUnit=" + stUnit
				+ ", stPrice=" + stPrice + ", turnNo=" + turnNo + ", recipeDetail=" + recipeDetail + "]";
	}

	
	
	
	
}
