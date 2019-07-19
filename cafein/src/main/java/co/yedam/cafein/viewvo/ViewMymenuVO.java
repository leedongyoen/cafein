package co.yedam.cafein.viewvo;

import org.springframework.web.multipart.MultipartFile;

public class ViewMymenuVO {
	
	private String stNum;
	private String sName;
	private String mName;
	private String sId;
	private int mPrice;
	private String opName;
	private int opPrice;
	private String cId;
	private String mNum;
	private String cuNum;
	private String caNum;
	private String uploadFileName;
	private String sort;
	
	
	
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
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
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
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
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getCuNum() {
		return cuNum;
	}
	public void setCuNum(String cuNum) {
		this.cuNum = cuNum;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	@Override
	public String toString() {
		return "ViewMymenuVO [stNum=" + stNum + ", sName=" + sName + ", mName=" + mName + ", sId=" + sId + ", mPrice="
				+ mPrice + ", opName=" + opName + ", opPrice=" + opPrice + ", cId=" + cId + ", mNum=" + mNum
				+ ", cuNum=" + cuNum + ", caNum=" + caNum + ", uploadFileName=" + uploadFileName + ", sort=" + sort
				+ "]";
	}
	
	
	

}
