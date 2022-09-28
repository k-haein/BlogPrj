 package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberLoginService;
import vo.ActionForward;
import vo.MemberBean;

/* 인터페이스를 함께 추가했다. 로그인 처리를 위한 클래스이다.*/
public class MemberLoginAction implements Action { //Action을 implements 해줌
	

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();
		//session - 페이지 로그인 유지 방법
		//**참고: cookie - 페이지 로그인 유지 방법, 클라이언트 생성. **
		
		
		// session상의 회원 등급은 존재하지 않음. ???
		// DB관리자의 회원 등급은 서로 다름. ???
		
		MemberBean member = new MemberBean();

		member.setMEMBER_ID(req.getParameter("MEMBER_ID"));
		member.setMEMBER_PW(req.getParameter("MEMBER_PW"));
		// vo의 MemberBean에서 아이디와 패스워드를 넘겨받아와라.

		
		
		MemberLoginService memberLoginService = new MemberLoginService();
		//서비스 svc에서 만들어준다. 아래에 로그인 처리를 해주자.
		

		//=========================== 로그인 처리 ================================
		boolean loginResult = memberLoginService.login(member);
		//사용자가 등록되어 있다면 true, 아니라면 false리턴.
		
		ActionForward forward = null; //어디로 갈지?

		if (loginResult) { //로그인 성공 시
			forward = new ActionForward();
			session.setAttribute("id", member.getMEMBER_ID());
			//session에 사용자의 ID 저장.
			forward.setRedirect(true);
			//Redirect유무
			forward.setPath("./memberListAction.me");
			//패스 지정
			
			// ++ 추가로 로그인 했다고 alert를 띄워줄꺼임.
//			resp.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>");
//			out.println("alert('로그인성공');");
//			out.println("</script>");
			
		} else { //로그인 실패 시
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패');");
			out.println("location.href='./memberLogin.me';");
			//로그인 창으로 다시 이동하라.
			out.println("</script>");
			
		}//else는 로그인 실패 부분을 담당함.
		//자바 코드에서 문자열을 만들어내서 결과적으로 자바 스크립트로 생성하여 console.log에 표시함.

		return forward; //null이 아니라 forward로 가야지.
		//ActionForward를 null로 리턴하면 이미 response에 응답을 끝냈다는 의미가 된다. 다른 어떤 페이지로도 이동하지 않는다.
	}

}
