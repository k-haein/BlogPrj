package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberListService;
import vo.ActionForward;
import vo.MemberBean;

/* 인터페이스를 함께 추가했다. 로그인 처리를 위한 클래스이다.*/
public class MemberListAction implements Action { //Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		
		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();
		// 로그인할 때는 setSession해서 가져오고
		// 여기 리스트에서는 get으로 뿌린다
		String id = (String) session.getAttribute("id");
		ActionForward forward = null; //어디로 갈지?

		
		//=========================== 로그인 후 분기처리 ================================
		//1. 회원 아님(id 정보 없음) => 로그인 안됨
		if (id == null) {
			// 세션에 저장된 아이디가 없다면~
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
			// 회원이 아니니까 로그인 페이지로 이동하라.

			
		//2. 관리자 아니고 회원임 => 일반로그인
		} else if (!id.equals("shopAdmin")) {
			// 상점 주인이 아니면
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다');");
			out.println("location.href='./memberLogin.me'");
			out.println("</script>");

		//3. 관리자임 => 회원목록 보여짐
		} else {
			// 관리자가 맞다면 모든 회원 목록 표시.
			forward = new ActionForward();
			MemberListService memberListService = new MemberListService();
			ArrayList<MemberBean> memberList = memberListService.getMemberList();
			req.setAttribute("memberList", memberList);
			forward.setPath("./member_list.jsp");
		}

		return forward;
		
	}

}
