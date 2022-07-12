package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberDeleteService;
import vo.ActionForward;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		// 로그인하면, id는 session에 저장되어 있다.

		ActionForward forward = null;
		// 로그인 상태인지 확인.
		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
		// 관리자가 맞는지
		} else if (!id.equals("shopAdmin")) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.')");
			out.println("location.href='./memberLogin.me'");
			out.println("</script>");
		//로그인 되어있고 관리자면,
		} else {
			String deleteId = req.getParameter("id");
			MemberDeleteService memberDeleteService = new MemberDeleteService();
			boolean deleteResult = memberDeleteService.deleteMember(deleteId);
			// delete 하면 회원정보목록 페이지로 이동
			if (deleteResult) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./memberListAction.me");

			// delete 실패하면 alert 발생 후 재로그인
			} else {
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패');");
				out.println("location.href='./memberLogin.me';");
				out.println("</script>");
			}
		}

		return forward;
		
		
	}

}
