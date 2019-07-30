package co.yedam.cafein.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import co.yedam.cafein.vo.OrdersVO;


public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
  
    @Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {
    	
    	// 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
        System.out.println("Before Handshake");
          
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        
        HttpServletRequest req =  ssreq.getServletRequest();
        
        // 로그인 정보를 가져옴.
	//	PlansVO planvo = (PlansVO) req.getSession().getAttribute("planvo");
		String sId = (String) req.getSession().getAttribute("sId");
		String cId = (String) req.getSession().getAttribute("cId");
		System.out.println(sId+"==========================================찾아라");
        // 주문한 메뉴의 매장ID
		attributes.put("id", sId != null ? sId : cId );
				
      
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
  
    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        System.out.println("After Handshake");
  
        super.afterHandshake(request, response, wsHandler, ex);
    }
}
