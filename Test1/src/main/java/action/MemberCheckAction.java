package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberJoinService;
import vo.ActionForward;
import vo.MemberBean;

/* 인터페이스를 함께 추가했다. 로그인 처리를 위한 클래스이다.*/
public class MemberCheckAction implements Action { //Action을 implements 해줌
	

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();
		
		MemberBean member = new MemberBean();

//		member.setMEMBER_ID(req.getParameter("MEMBER_ID"));
//		member.setMEMBER_PW(req.getParameter("MEMBER_PW"));
		// vo의 MemberBean에서 아이디와 패스워드를 넘겨받아와라.

		
		
		 
	 	String id = req.getParameter("MEMBER_ID");
	 	System.out.println("id 정보 : "+id);
	 	
		
		MemberJoinService memberJoinService = new MemberJoinService();
		//서비스 svc에서 만들어준다.
		

		//=========================== 로그인 처리 ================================
//		boolean loginResult = memberJoinService.login(member);
		//사용자가 등록되어 있다면 true, 아니라면 false리턴.
		
		ActionForward forward = null; //어디로 갈지?

		
		int result = memberJoinService.idCheck(id);
	 	session.setAttribute("result", result);
	 	//nextPage="/member/dbCheckid.jsp";
		
		
		
		
//		if (loginResult) { //로그인 성공 시
//			forward = new ActionForward();
//			session.setAttribute("id", member.getMEMBER_ID());
//			//session에 사용자의 ID 저장.
//			forward.setRedirect(true);
//			//Redirect유무
//			forward.setPath("./memberListAction.me");
//			//패스 지정
//
//			
//			
//			
//		} else { //로그인 실패 시
//			resp.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>");
//			out.println("alert('로그인실패');");
//			out.println("location.href='./memberLogin.me';");
//			//로그인 창으로 다시 이동하라.
//			out.println("</script>");
//			
//		}

		return forward; //null이 아니라 forward로 가야지.
	}

}
