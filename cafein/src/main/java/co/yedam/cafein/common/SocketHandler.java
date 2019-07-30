package co.yedam.cafein.common;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.cafein.store.order.StoreOrderServiceImpl;
import co.yedam.cafein.vo.OrdersVO;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {

	private static final Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	private Map<String,WebSocketSession> sessionSet = new HashMap<String,WebSocketSession>();

	@Autowired
	StoreOrderServiceImpl service;
	
	public SocketHandler() {
		super();
		this.logger.info("create SocketHandler instance!");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);

		sessionSet.remove(session);
		this.logger.info("remove session!");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);

		sessionSet.put((String)session.getAttributes().get("id"),session);
		this.logger.info("add session!");
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		/*
		 * ObjectMapper mapper = new ObjectMapper(); MsgVO msgvo =
		 * mapper.readValue((String)message.getPayload(), MsgVO.class); String msg =
		 * mapper.writeValueAsString(msgvo);
		 */		
		
		ObjectMapper mapper = new ObjectMapper();
		OrdersVO order = mapper.readValue((String) message.getPayload(), OrdersVO.class);
		
		if(order.getType().equals("cusorder")) {
			// 건수 조회
			int n = service.getstoreordernotviewcount(order);
			sendMessage(order.getsId(),n+"건");
			System.out.println("===================== 미확인 건 "+n);
		}
		
		
		this.logger.info("httpsession info:" + session.getAttributes());
		this.logger.info("receive message:" + message.toString());
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		this.logger.error("web socket error!", exception);
	}

	@Override
	public boolean supportsPartialMessages() {
		this.logger.info("call method!");

		return super.supportsPartialMessages();
	}

	public void sendMessage(String sid,String message) {
		
		// send
	
		WebSocketSession session = sessionSet.get(sid);
		if (session.isOpen()) {
			try {
				session.sendMessage(new TextMessage(message));
			} catch (Exception ignored) {
				this.logger.error("fail to send message!", ignored);
			}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {

	}

}