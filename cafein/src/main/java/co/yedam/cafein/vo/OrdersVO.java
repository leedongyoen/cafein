package co.yedam.cafein.vo;

import java.sql.Timestamp;
import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(ignoreUnknown = true)
public class OrdersVO {

	private String oNum;
	private String cId;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone ="Asia/Seoul") // 환불검색할때 날짜랑 시간 포맷
	private Timestamp oDate;
	private int total;
	private String receipt;
	private String sId;
	private String payMethod;
	private Integer mileage; // 사용할 마일리지
	private String cAdd;
	private String cAdd3;
	private String totals;
	private String deliveryStatus;
	private String refuseReason;
	private String takeTime;
	private Timestamp deApplyTime;
	
	// store name을 가져오기 위해서
	private String oDnum; // 주문상세 테이블 pk
	private String sName; // 매장이름
	private String mNum; // 메뉴번호
	private String oQty; // 주문 수량
	private String opDnum; // 어떤 메뉴의 옵션인지 지정하기 위해서
	private String receipno; // 해당 메뉴에 있는 레시피 번호
	private String caNum;	// 해당 메뉴의 레시피에 속한 카테고리 번호
	private String[] optionlist; // 해당 메뉴의 옵션 리스트
	private String hotice_option; // 해당 메뉴의 hot ice 
	private int addmileage; // 적립된 마일리지
	private String mName;
	private String detailNm;
	
	private int addcanclemileage;
	private int cnt;					// 주문 건수를 알기위함
	private int addMileageCnt;			// 사용한 적립금 건수
	private int minusMileageCnt;		// 마일리지를 적립해준 주문 건수
	private String openTime;			// 마일리지 검색 할 때 where 절에 필요
	
	private int rank;					// 판매순위
	
	// 환불내역 조회
	private int refundSum;
	private int refundMileage; 
	private String refundMethod; 
	private int cashRefundCnt; 
	private int cardRefundCnt; 
	
	// 페이징 처리
	private int start;
	private int end;
	private int checkpagenum;
	private int startPage;
	private int endPage;
	private int lastPage;
	
	// 고객 - 주문 조회 페이지
	private int orderlistcontroller;
	
	// 매장 - 주문 조회 페이지 -> 날짜 검색
	private String startDate;
	private String endDate;
	
	// 매장 - 주문 조회 페이지 취소주문 제외하기 위한 변수
	private String nocancelview;
	
	// 해당 매장에서 마일리지 서비스를 이용하는지 여부를 저장하기 위해서
	private String mileageservice;
	
	// 웹 소켓 알림
	private String type;
	
	
	

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCheckpagenum() {
		return checkpagenum;
	}
	public void setCheckpagenum(int checkpagenum) {
		this.checkpagenum = checkpagenum;
	}
	public String getNocancelview() {
		return nocancelview;
	}
	public void setNocancelview(String nocancelview) {
		this.nocancelview = nocancelview;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getOrderlistcontroller() {
		return orderlistcontroller;
	}
	public void setOrderlistcontroller(int orderlistcontroller) {
		this.orderlistcontroller = orderlistcontroller;

	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getMileageservice() {
		return mileageservice;
	}
	public void setMileageservice(String mileageservice) {
		this.mileageservice = mileageservice;
	}
	public String getDetailNm() {
		return detailNm;
	}
	public void setDetailNm(String detailNm) {
		this.detailNm = detailNm;
	}
	public int getAddcanclemileage() {
		return addcanclemileage;
	}
	public void setAddcanclemileage(int addcanclemileage) {
		this.addcanclemileage = addcanclemileage;
	}
	public Timestamp getDeApplyTime() {
		return deApplyTime;
	}
	public void setDeApplyTime(Timestamp deApplyTime) {
		this.deApplyTime = deApplyTime;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getRefuseReason() {
		return refuseReason;
	}
	public void setRefuseReason(String refuseReason) {
		this.refuseReason = refuseReason;
	}
	public String getTakeTime() {
		return takeTime;
	}
	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}
	public int getAddmileage() {
		return addmileage;
	}
	public void setAddmileage(int addmileage) {
		this.addmileage = addmileage;
	}
	public String getHotice_option() {
		return hotice_option;
	}
	public void setHotice_option(String hotice_option) {
		this.hotice_option = hotice_option;
	}
	public String getcAdd() {
		return cAdd;
	}
	public void setcAdd(String cAdd) {
		this.cAdd = cAdd;
	}
	public String getcAdd3() {
		return cAdd3;
	}
	public void setcAdd3(String cAdd3) {
		this.cAdd3 = cAdd3;
	}
	public String[] getOptionlist() {
		return optionlist;
	}
	public void setOptionlist(String[] optionlist) {
		this.optionlist = optionlist;
	}
	public String getoDnum() {
		return oDnum;
	}
	public void setoDnum(String oDnum) {
		this.oDnum = oDnum;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getoQty() {
		return oQty;
	}
	public void setoQty(String oQty) {
		this.oQty = oQty;
	}
	public String getOpDnum() {
		return opDnum;
	}
	public void setOpDnum(String opDnum) {
		this.opDnum = opDnum;
	}
	public String getReceipno() {
		return receipno;
	}
	public void setReceipno(String receipno) {
		this.receipno = receipno;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public Timestamp getoDate() {
		return oDate;
	}
	public void setoDate(Timestamp oDate) {
		this.oDate = oDate;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public Integer getMileage() {
		return mileage;
	}
	public void setMileage(Integer mileage) {
		this.mileage = mileage;
	}
	
	public String getTotals() {
		return totals;
	}
	public void setTotals(String totals) {
		this.totals = totals;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getAddMileageCnt() {
		return addMileageCnt;
	}
	public void setAddMileageCnt(int addMileageCnt) {
		this.addMileageCnt = addMileageCnt;
	}
	public int getMinusMileageCnt() {
		return minusMileageCnt;
	}
	public void setMinusMileageCnt(int minusMileageCnt) {
		this.minusMileageCnt = minusMileageCnt;
	}

	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public int getRefundSum() {
		return refundSum;
	}
	public void setRefundSum(int refundSum) {
		this.refundSum = refundSum;
	}
	public int getRefundMileage() {
		return refundMileage;
	}
	public void setRefundMileage(int refundMileage) {
		this.refundMileage = refundMileage;
	}
	public String getRefundMethod() {
		return refundMethod;
	}
	public void setRefundMethod(String refundMethod) {
		this.refundMethod = refundMethod;
	}
	public int getCashRefundCnt() {
		return cashRefundCnt;
	}
	public void setCashRefundCnt(int cashRefundCnt) {
		this.cashRefundCnt = cashRefundCnt;
	}
	public int getCardRefundCnt() {
		return cardRefundCnt;
	}
	public void setCardRefundCnt(int cardRefundCnt) {
		this.cardRefundCnt = cardRefundCnt;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "OrdersVO [oNum=" + oNum + ", cId=" + cId + ", oDate=" + oDate + ", total=" + total + ", receipt="
				+ receipt + ", sId=" + sId + ", payMethod=" + payMethod + ", mileage=" + mileage + ", cAdd=" + cAdd
				+ ", cAdd3=" + cAdd3 + ", totals=" + totals + ", deliveryStatus=" + deliveryStatus + ", refuseReason="
				+ refuseReason + ", takeTime=" + takeTime + ", deApplyTime=" + deApplyTime + ", oDnum=" + oDnum
				+ ", sName=" + sName + ", mNum=" + mNum + ", oQty=" + oQty + ", opDnum=" + opDnum + ", receipno="
				+ receipno + ", caNum=" + caNum + ", optionlist=" + Arrays.toString(optionlist) + ", hotice_option="
				+ hotice_option + ", addmileage=" + addmileage + ", mName=" + mName + ", detailNm=" + detailNm
				+ ", addcanclemileage=" + addcanclemileage + ", cnt=" + cnt + ", addMileageCnt=" + addMileageCnt
				+ ", minusMileageCnt=" + minusMileageCnt + ", openTime=" + openTime + ", rank=" + rank + ", refundSum="
				+ refundSum + ", refundMileage=" + refundMileage + ", refundMethod=" + refundMethod + ", cashRefundCnt="
				+ cashRefundCnt + ", cardRefundCnt=" + cardRefundCnt + ", start=" + start + ", end=" + end
				+ ", orderlistcontroller=" + orderlistcontroller + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", nocancelview=" + nocancelview + ", mileageservice=" + mileageservice + "]";
	}
	
	
}
