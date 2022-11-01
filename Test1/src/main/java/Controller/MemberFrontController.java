package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberDeleteAction;
import action.MemberIdCheckAction;
import action.MemberJoinAction;
import action.MemberListAction;
import action.MemberLoginAction;
import action.MemberPwdCheckAction;
import action.MemberViewAction;
import action.MyBlogAction;
import action.PostDeleteAction;
import action.PostInsertAction;
import action.PostListAction;
import action.PostViewAction;
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


	/* Get 방식일 때 사용할껀데 doProcess에 그냥 때려박아줌. */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//super.doGet(req, resp); //이건 주석처리 해주고
		doProcess(req,resp);
		//doProcess 라는 메서드를 만들어서 request와 response를 매개변수로 path를 구할 수 있는 메서드를 만든다.
//		/doGet과 doPost에 모두 doProcess라는 메서드를 실행해준다.
		//Request : 요청
		//Response : 응답
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//super.doPost(req, resp); //주석처리 해주고
		req.setCharacterEncoding("UTF-8"); 
		//doPost에는 .setCharacterEncodint("UTF-8")을 넣어서 한글출력에 문제없도록 설정한다.
		/*글등록, 글수정 작업시 한글이 깨지지 않을 수 있다.
		이렇게 처리해주면 앞으로 인코딩은 Servlet에서 담당하므로 따로 처리하지 않아도된다.
		추후 다른 인코딩으로 변경을 원하면 Servlet에서 변경하면 된다.*/
		doProcess(req,resp); //얘도 이동해야함.
	}
	//post로 요청하면 여기서 처리.
	
	

	//=============== 여기부터 로그인이랑 회원가입을 하게 해주는 기능들 때려박은 컨트롤러  ===============
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
	
/*
* protected : java 접근자, 같은 폴더(패키지)및 그 클래스를 상속(extends)해서 구현하는 경우 접근이 가능 
* void : return 되는 타입이 없음을 의미 
* HttpServletRequest,HttpServletResponse : 웹브라우저 URL로 servlet이 요청할 시 요청,응답을 받기 위해 만드는 객체. 매개변수로 가지고 있는거임. WAS가 웹브라우저로부터 Servlet 요청을 받으면 req객체 생성해서 저장하고 resp 객체를 생성해 응답을 담아 servlet에게 반환한다. 
* throws ServletException,IOException : java.io.IOException 과 javax.servlet.ServletException 예외를 던져야 합니다. 그냥 서블릿 규칙임.
*/
		String RequestURI = req.getRequestURI();
		//전체 주소를 가져오고. (http:icia.co.kr/list.me)
		String contextPath = req.getContextPath();
		//전체 주소에서 도메인만큼만 읽어오고 (http://www.icia.co.kr/)
		String command = RequestURI.substring(contextPath.length());
		//(list.me)
		
		
		//=============== 여기서부터 화원가입/로그인 페이지 연결해줌.  ===============
		
		ActionForward forward = null; 
		// Action이 모든 작업을 끝내고서 이동하는 위치을 가상적으로 지정한 것이 ActionForward이다.
		//ActionForward를 null로 리턴하면 이미 response에 응답을 끝냈다는 의미가 된다. 다른 어떤 페이지로도 이동하지 않는다.
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
				try {
					forward = action.execute(req, resp);
					System.out.println("로그인 후 회원정보리스트 표시");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		//-------------------- 회원상세정보 memberViewAction 페이지 생성 ---------------------------				
		 else if (command.equals("/member/memberViewAction.me")) {
				action = new MemberViewAction();
				// MemberViewAction, 로그인 후의 페이지 표시.
				try {
					forward = action.execute(req, resp);
					System.out.println("회원상세정보 표시");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		//-------------------- 회원정보삭제하는 memberDeleteAction 페이지 생성 ---------------------------				
		 else if (command.equals("/member/memberDeleteAction.me")) {
				action = new MemberDeleteAction();
				// MemberListAction, 로그인 후의 페이지 표시.
				try {
					forward = action.execute(req, resp);
					System.out.println("회원정보삭제");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		//-------------------- id중복검사하는 membercheckAction 페이지 생성 ---------------------------				
		 else if (command.equals("/member/memberIdCheckAction.me")) {
				
			 action = new MemberIdCheckAction();
				// memberCheckAction 페이지 만듬
				try {
					forward = action.execute(req, resp);
					System.out.println("id 중복검사");
				} catch (Exception e) {
					e.printStackTrace();
				}
		 }		
		
		//-------------------- id중복검사하는 membercheckAction 페이지 생성 ---------------------------				
		 else if (command.equals("/member/IdCheckService/idcheckAjax")) {
				action = new MemberIdCheckAction();
				try {
					forward = action.execute(req, resp); //받은 action을 뜯어서 SQL로 보내준다.(서버요청)
					System.out.printf("MemberFrontController : idCheck - SQL DB로 보내는 로직 실행 \n",req, resp);
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("MemberFrontController : idCheck - SQL DB로 보내는 로직 실패(위에 에러)");
				}
		} //회원가입을 하면 회원 가입이 되어야하는데 이를 DB에 저장도 할 수 있어야함. -> jdbcUtil에서 연결하고 DB로 보냄.
		 
		//-------------------- 비밀번호를 검증하는 MemberPwdCheckAction 페이지 생성 ---------------------------				
		 else if (command.equals("/member/PwdCheckService/pwdcheckAjax")) {
			 action = new MemberPwdCheckAction();
			 //규칙은 보기 쉽게 자물쇠 아이콘에 tip을 달자!
				try {
					
					
					forward = action.execute(req, resp); //???
					System.out.printf("MemberFrontController : pwdCheck 성공",req, resp);
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("MemberFrontController : pwdCheck 실패");
				}
		} 
		
		
		//-------------------- 로그인이 된 후 메인페이지(게시글 목록) 보여주는 PostListAction 페이지 생성 ---------------------------
				//메인 포스트 페이지에 정보만 띄워준다.
				
				 else if (command.equals("/member/postListAction.me")) {
						action = new PostListAction();
						// PostListAction, 로그인 후의 메인 포스트 페이지 표시.
						try {
							forward = action.execute(req, resp);
							System.out.println("로그인 후 메인페이지 포스트 리스트 표시");
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
		
		//-------------------- 게시글 상세보기 postViewAction 페이지 생성 ---------------------------				
				 else if (command.equals("/member/postViewAction.me")) {
						action = new PostViewAction();
						// PostViewAction, 게시글 상세보기 페이지 표시.
						try {
							forward = action.execute(req, resp);
							System.out.println("게시글 상세보기 표시");
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				
		
		//-------------------- 내 블로그 페이지를 보여주는 myBlogAction 페이지 생성 ---------------------------
				 else if (command.equals("/member/myBlogAction.me")) {
						action = new MyBlogAction();
						// MyBlogAction, 내 블로그 페이지 표시.
						try {
							forward = action.execute(req, resp);
							System.out.println("내 블로그 페이지 표시");
						} catch (Exception e) {
							e.printStackTrace();
						}
					}		
		
		//-------------------- 내 게시글을 삭제하는 postDeleteAction 페이지 생성 ---------------------------				
				 else if (command.equals("/member/postDeleteAction.me")) {
						action = new PostDeleteAction();
						// PostDeleteAction, 삭제 후 페이지 표시.
						try {
							forward = action.execute(req, resp);
							System.out.println("게시글 삭제");
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
		
		//-------------------- 새글작성 버튼 누르면 게시글 작성 페이지로 이동 ---------------------------
				else if(command.equals("/member/postInsert.me")) {
					//게시글 작성 페이지로 이동함
					forward = new ActionForward();
					//객체 생성
					forward.setRedirect(false);
					//이동 허락 안함
					forward.setPath("./postEdit.jsp");
					//거기 주소는 joinForm.jsp으로 해라.(이동할 주소 저장)
				}
		//-------------------- 작성한 블로그 포스팅을 저장하는 postInsertAction 페이지 생성 ---------------------------				
				 else if (command.equals("/member/postInsertAjax")) {
						action = new PostInsertAction();
						try {
							forward = action.execute(req, resp); //받은 action을 뜯어서 SQL로 보내준다.(서버요청)
						} catch (Exception e) {
							e.printStackTrace();
							System.out.println("포스팅 저장 실패");
						}
				}
		
		
		
		
		
		
		
		
		
		
		
		//-------------------- 페이지 이동시키는 부분 ---------------------------
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