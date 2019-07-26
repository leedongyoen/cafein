package co.yedam.cafein.viewvo;

public class ViewPosCusSearchVO {
	
	private String cId;
	private String cNick;
	private String cTel;
	private String cName;
	private int mileage;
	private String sId;
	private String stMileService;
	
	

	public String getStMileService() {
		return stMileService;
	}
	public void setStMileService(String stMileService) {
		this.stMileService = stMileService;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcNick() {
		return cNick;
	}
	public void setcNick(String cNick) {
		this.cNick = cNick;
	}
	public String getcTel() {
		return cTel;
	}
	public void setcTel(String cTel) {
		this.cTel = cTel;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	@Override
	public String toString() {
		return "ViewPosCusSearchVO [cId=" + cId + ", cNick=" + cNick + ", cTel=" + cTel + ", cName=" + cName
				+ ", mileage=" + mileage + ", sId=" + sId + ", stMileService=" + stMileService + "]";
	}
	

}
