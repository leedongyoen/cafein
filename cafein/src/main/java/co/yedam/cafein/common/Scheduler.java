package co.yedam.cafein.common;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import co.yedam.cafein.store.order.StoreOrderServiceImpl;
import co.yedam.cafein.vo.OrdersVO;

@Component
public class Scheduler {

	@Autowired
	StoreOrderServiceImpl service;
	
	/**
	 * 1. 1분마다
	 */
	@Scheduled(cron = "0 0/1 * * * *")
	public void deliveryupdate() {
		
		
		service.getdeliverytatuscheck();
		service.getordertimecheck();
		
	}
}
