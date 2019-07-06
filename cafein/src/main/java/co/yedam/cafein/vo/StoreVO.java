package co.yedam.cafein.vo;

public class StoreVO {

	private String sId;
	private String sPw;
	private String sName;
	private String sAdd;
	private String sTel;
	private String stDeliService;
	private int stOpenTime;
	private int stCloseTime;
	private String stAppStat;
	private String stMileService;
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getsPw() {
		return sPw;
	}
	public void setsPw(String sPw) {
		this.sPw = sPw;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsAdd() {
		return sAdd;
	}
	public void setsAdd(String sAdd) {
		this.sAdd = sAdd;
	}
	public String getsTel() {
		return sTel;
	}
	public void setsTel(String sTel) {
		this.sTel = sTel;
	}
	public String getStDeliService() {
		return stDeliService;
	}
	public void setStDeliService(String stDeliService) {
		this.stDeliService = stDeliService;
	}
	public int getStOpenTime() {
		return stOpenTime;
	}
	public void setStOpenTime(int stOpenTime) {
		this.stOpenTime = stOpenTime;
	}
	public int getStCloseTime() {
		return stCloseTime;
	}
	public void setStCloseTime(int stCloseTime) {
		this.stCloseTime = stCloseTime;
	}
	public String getStAppStat() {
		return stAppStat;
	}
	public void setStAppStat(String stAppStat) {
		this.stAppStat = stAppStat;
	}
	public String getStMileService() {
		return stMileService;
	}
	public void setStMileService(String stMileService) {
		this.stMileService = stMileService;
	}
	@Override
	public String toString() {
		return "StoreVO [sId=" + sId + ", sPw=" + sPw + ", sName=" + sName + ", sAdd=" + sAdd + ", sTel=" + sTel
				+ ", stDeliService=" + stDeliService + ", stOpenTime=" + stOpenTime + ", stCloseTime=" + stCloseTime
				+ ", stAppStat=" + stAppStat + ", stMileService=" + stMileService + "]";
	}
	
   
	
}
