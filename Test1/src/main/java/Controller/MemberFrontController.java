package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberJoinAction;
import action.MemberListAction;
import action.MemberLoginAction;
import vo.ActionForward;


@WebServlet("/")
//어노테이션은 컴파일러와 개발자 간의 약속,
//단순 반복적 프로그래밍을 어노테이션 1개로 해결.
//일종의 매크로 명령

public class MemberFrontController 
extends javax.servlet.http.HttpServlet{ // HttpServelet 클래스를 상속받아야 서블릿으로 동작


	//********이 곳에 커서를 두고 ********* 진행
	//source - Override / Implement Methods... > doGet,doPost 체크 후 OK
	//그럼 위 아래가 자동으로 설정된다.
	
	
	
	/**
	 * 노란글씨 빼기 위해 설정
	 */
	private static final long serialVersionUID = 1L;



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//super.doGet(req, resp); //이건 주석처리 해주고
		doProcess(req,resp);
		//Request : 요청
		//Response : 응답
	}

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//super.doPost(req, resp); //주석처리 해주고
		req.setCharacterEncoding("UTF-8"); //post에서 언어set 지정

		doProcess(req,resp); //얘도 이동해야함.
	}
	//post로 요청하면 여기서 처리.
	
	

	//=============== 여기가 로그인이랑 회원가입을 하게 해주는 컨트롤러  ===============
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException,
	IOException {
		
		String RequestURI = req.getRequestURI();
		//전체 주소를 가져오고. (http:icia.co.kr/list.me)
		String contextPath = req.getContextPath();
		//전체 주소에서 도메인만큼만 읽어오고 (http://www.icia.co.kr/)
		String command = RequestURI.substring(contextPath.length());
		//(list.me)
		
		
		//=============== 여기서부터 화원가입/로그인 페이지 연결해줌.  ===============
		
		ActionForward forward = null; // 가도 되는 지, 주소
		Action action = null; // execute라는 실행 메소드 return.

		//-------------------- 로그인 버튼 누르면 로그인 페이지로 이동 ---------------------------
		if(command.equals("/member/memberLogin.me")) {
			//전달된 명령이 memberLogin.me라면
			forward = new ActionForward();
			//객체 생성
			forward.setRedirect(true);
			//이동 허락
			forward.setPath("./login.jsp");
			//거기의 주소는 loginForm.jsp로 해라.(이동할 주소 저장)
		}
		
		//-------------------- 회원가입 버튼 누르면 회원가입 페이지로 이동 ---------------------------
		else if(command.equals("/member/memberJoin.me")) { //이거네...
			//member 폴더 안 login.jsp에서 전달된 명령이 member 폴더 안 memberJoin.me라면(컨트롤러 기준은 ROOT)
			forward = new ActionForward();
			//객체 생성
			forward.setRedirect(false);
			//이동 허락 안함
			forward.setPath("./joinUs.jsp");
			//거기 주소는 joinForm.jsp으로 해라.(이동할 주소 저장)
		}
		
		//-------------------- 회원가입을 처리할 memberJoinAction 페이지 생성 ---------------------------
		else if (command.equals("/member/memberJoinAction.me")) {
			
			action = new MemberJoinAction();
			try {
				forward = action.execute(req, resp); //받은 action을 뜯어서 SQL로 보내준다.
				System.out.printf("MemberFrontController : 회원가입 - SQL DB로 보내는 로직 실행 \n",req, resp);
				
				
				//메인페이지로 이동하자.
				//forward.setRedirect(true);
				//forward.setPath("../index.jsp");

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("MemberFrontController : 회원가입 - SQL DB로 보내는 로직 실패(위에 에러)");
			}
		} //회원가입을 하면 회원 가입이 되어야하는데 이를 DB에 저장도 할 수 있어야함. -> jdbcUtil에서 연결하고 DB로 보냄.
		

		//-------------------- 로그인을 처리할 memberLoginAction 페이지 생성 ---------------------------
		
		 else if(command.equals("/member/memberLoginAction.me")) {
	    	  action = new MemberLoginAction();
	    	  //MemberLoginAction : 로그인 처리 준비. DB접속 전 준비.
	    	  
	    	  try {
	    		  forward = action.execute(req, resp); //받은 action을 뜯어서 SQL로 보내준다.
					System.out.printf("MemberFrontController : 로그인 - SQL DB로 보내는 로직 실행 \n",req, resp);
	    	  }catch (Exception e) {
	    		  e.printStackTrace();
					System.out.println("MemberFrontController : 로그인 - SQL DB로 보내는 로직 실패(위에 에러)");
	    	  }
	      }

		//-------------------- 로그인이 된 후의 memberListAction 페이지 생성 ---------------------------
		//1. 관리자면 회원리스트 보여주고 아니면 회원리스트 안보여줌
		//2. 회원이 아니면 아무것도 안보여주고 다시 로그인 시킴
		
		 else if (command.equals("/member/memberListAction.me")) {
				action = new MemberListAction();
				// MemberListAction, 로그인 후의 페이지 표시.
				System.out.println("여기인가?");
				try {
					forward = action.execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		
		
		
		if(forward != null ) {
			//forward 객체가 null이 아니라면(= forward객체가 있다면)
			if(forward.isRedirect()) { 
				//이동이 허락되었다면
				resp.sendRedirect(forward.getPath());
				//해당 주소로 응답하라(해당 주소로 이동)
			}else { 
				RequestDispatcher dispatcher =
						req.getRequestDispatcher(forward.getPath());
						dispatcher.forward(req, resp);
						//이동할 주소가 없으므로 현재 페이지에 머물기.
			}
		}
		
		
		
	}
	
}