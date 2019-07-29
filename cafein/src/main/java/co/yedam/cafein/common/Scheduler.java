package co.yedam.cafein.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import co.yedam.cafein.store.order.StoreOrderServiceImpl;

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

	/*	*//**
			 * 1. 1시간마다
			 *//*
				 * @Scheduled(cron = "0 0 0/1 * * *") public void stockupdate() {
				 * 
				 * service.stockupdate();
				 * 
				 * 
				 * }
				 */
}
