package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberViewService;
import vo.ActionForward;
import vo.MemberBean;

/* 인터페이스를 함께 추가했다. 회원 상세정보 표시를 위한 클래스이다.*/
public class MemberViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();

		//로그인하면, id는 session에 저장되어 있다.
		String id = (String) session.getAttribute("id");

		ActionForward forward = null; //어디로 갈지?


		//로그인 상태인지 확인.
		if (id == null) { 
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");

		//관리자가 맞는지
		} else if (!id.equals("shopAdmin")) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.')");
			out.println("location.href='./memberLogin.me'");
			out.println("</script>");

		//로그인 상태이고, 관리자라면 회원정보 보여주기.
		} else {
			forward = new ActionForward();
			String viewId = req.getParameter("id");
			MemberViewService memberViewService = new MemberViewService();
			//서비스 svc에서 만들어준다. 아래에 회원정보 표시를 해주자.
			MemberBean member = memberViewService.getMember(viewId);
			//getMember가 찾으려는 ID를 이용하여
			//회원정보를 찾고 member객체 리턴.
			req.setAttribute("member", member);
			//요청값(req)에 회원정보를 저장.
			forward.setPath("./member_info.jsp");
		}

		return forward;
	}

}
