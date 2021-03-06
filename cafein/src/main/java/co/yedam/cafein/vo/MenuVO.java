package co.yedam.cafein.vo;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {
	
	private String 	mNum;
	private String 	mName;
	private int		mPrice;
	private String	sId;
	private String	caNum;
	private String	mStat;
	private String menuSale;
	
	//file upload 위한 변수 두개
	private String uploadFileName;
	private MultipartFile uploadFile;
	private String ca_num_nm;
	private String m_stat_nm;
	
	
	public String getCa_num_nm() {
		return ca_num_nm;
	}
	public void setCa_num_nm(String ca_num_nm) {
		this.ca_num_nm = ca_num_nm;
	}
	public String getM_stat_nm() {
		return m_stat_nm;
	}
	public void setM_stat_nm(String m_stat_nm) {
		this.m_stat_nm = m_stat_nm;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
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
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getmStat() {
		return mStat;
	}
	public void setmStat(String mStat) {
		this.mStat = mStat;
	}
	
	
	public String getMenuSale() {
		return menuSale;
	}
	public void setMenuSale(String menuSale) {
		this.menuSale = menuSale;
	}
	@Override
	public String toString() {
		return "MenuVO [mNum=" + mNum + ", mName=" + mName + ", mPrice=" + mPrice + ", sId=" + sId + ", caNum=" + caNum
				+ ", mStat=" + mStat + ", menuSale=" + menuSale + ", uploadFileName=" + uploadFileName + ", uploadFile="
				+ uploadFile + ", ca_num_nm=" + ca_num_nm + ", m_stat_nm=" + m_stat_nm + "]";
	}


	
	
	
}
