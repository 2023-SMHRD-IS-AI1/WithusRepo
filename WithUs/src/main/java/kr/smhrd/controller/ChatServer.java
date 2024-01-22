package kr.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.bind.annotation.PathVariable;

@ServerEndpoint("/chatserver/{room_idx}")
public class ChatServer {

  // 현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록
  // static 붙여야함!!
  // 10 : ~~~~~~~~
  // 115 : ~~~~~~~~~~~~
  // { 15 : }
  private static HashMap<Integer, List<Session> > userMap = new HashMap<Integer, List<Session>>() ;
  private static List<Session> list = new ArrayList();

  //  시간표시 함수
  private void timePrint(String msg) {
    System.out.printf("[%tT] %s\n", Calendar.getInstance(), msg);
  }

  // @PathParam 을 이용해서 경로에 넣어둔 room_idx를 수집
  @OnOpen
  public void handleOpen(Session session, @PathParam("room_idx") int room_idx ) {
	  
	System.out.println(room_idx);
	  
    timePrint("클라이언트 연결");
    
    // 접속자 관리(****)
    if( userMap.get(room_idx) == null ) {
    	userMap.put(room_idx, new ArrayList<Session>());
    	userMap.get(room_idx).add(session);
    }else {
    	userMap.get(room_idx).add(session);
    }
    
    
  }

  @OnMessage
  public void handleMessage(String msg, Session session, @PathParam("room_idx") int room_idx ) {

    System.out.println(msg);

    // 로그인할 때: 1#유저명
    // 대화  할 때: 2#유저명#메세지
//    #1가현#
    int index = msg.indexOf("#", 2);
    String no = msg.substring(0, 1);
    String user = msg.substring(2, index);
    String txt = msg.substring(index + 1);
    System.out.println(msg);

    System.out.println(no);

    if (no.equals("1")) {
      // 누군가 접속 > 1#아무개
      for (Session s : userMap.get(room_idx)) {
        if (s != session) { // 현재 접속자가 아닌 나머지 사람들
          try {
            s.getBasicRemote().sendText("1#" + user);
          } catch (IOException e) {
            e.printStackTrace();
          }
        }
      }

    } else if (no.equals("2")) {
      // 누군가 메세지를 전송
    	
    	List<Session> roomSessions = userMap.get(room_idx);
        List<String> roomChatHistory = getRoomChatHistory(room_idx);
    	
      for (Session s : roomSessions) {

        if (s != session) { // 현재 접속자가 아닌 나머지 사람들
          try {
            s.getBasicRemote().sendText("2#" + user + "#" + txt);
          } catch (IOException e) {
            e.printStackTrace();
          }

        }

      }
      
   // 채팅 내용 저장
      roomChatHistory.add(user + ": " + txt);
      
    } else if (no.equals("3")) {
      // 누군가 접속종료 > 3#아무개
      for (Session s :  userMap.get(room_idx)) {

        if (s != session) { // 현재 접속자가 아닌 나머지 사람들
          try {
            s.getBasicRemote().sendText("3#" + user + "#");
          } catch (IOException e) {
            e.printStackTrace();
          }
        }

      }
     userMap.get(room_idx).remove(session);
    }

  }

  private List<String> getRoomChatHistory(int room_idx) {
	// TODO Auto-generated method stub
	return null;
}

@OnClose
  public void handleClose(Session session, @PathParam("room_idx") int room_idx ) {

    System.out.println("클라이언트 연결 해제");

    // 연결이 종료된 세션을 목록에서 제거
    userMap.get(room_idx).remove(session);

    // 연결 종료 시 다른 클라이언트에게 알림 전송
    for (Session s : userMap.get(room_idx)) {
      try {
        s.getBasicRemote().sendText("연결종료"); // 예: 3#해제된_유저명#
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @OnError
  public void handleError(Throwable t) {
    t.printStackTrace();
  }

}