package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinService;
import vo.ActionForward;
import vo.MemberBean;


/* 인터페이스를 함께 추가했다. 회원가입 처리를 위한 클래스이다.*/
public class MemberJoinAction implements Action { //Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		MemberBean member = new MemberBean(); //vo에 선언한 변수들 import한거.
		//회원 정보를 저장하고 DB로 전달.
		//회원 정보를 가지고 있을 공간이 된다.
		
		
		boolean joinResult = false;
		
		//입력 목록 적어주기(vo에서 받아옴.)
		member.setMEMBER_ID(req.getParameter("MEMBER_ID"));
		member.setMEMBER_PW(req.getParameter("MEMBER_PW"));
		member.setMEMBER_NAME(req.getParameter("MEMBER_NAME"));
		member.setMEMBER_BIR_YY(req.getParameter("MEMBER_BIR_YY"));
		member.setMEMBER_BIR_MM(req.getParameter("MEMBER_BIR_MM"));
		member.setMEMBER_BIR_DD(req.getParameter("MEMBER_BIR_DD"));
		member.setMEMBER_GENDER(req.getParameter("MEMBER_GENDER"));
		member.setMEMBER_MAIL(req.getParameter("MEMBER_MAIL"));
		member.setMEMBER_PHONE(req.getParameter("MEMBER_PHONE"));
		

		MemberJoinService memberJoinService = new MemberJoinService();
		//서비스 svc에서 만들어준다. 아래에 회원가입 처리를 해주자.
		
		//=========================== 회원가입 처리 ================================
		joinResult = memberJoinService.joinMember(member);

		ActionForward forward = null;
		if (joinResult == false) { //회원가입 실패 시
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('회원등록실패')");
			out.println("history.back()");
			out.println("</script>");
		} else { //회원가입 성공 시
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
		}
		
		return forward;
	}

}
