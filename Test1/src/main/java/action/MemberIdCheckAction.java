package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import vo.ActionForward;

/* 인터페이스를 함께 추가했다. 로그인 처리를 위한 클래스이다.*/
public class MemberIdCheckAction implements Action { // Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {


	 	String id = req.getParameter("MEMBER_ID");
	 	System.out.println("id 정보 : "+id);
	 	MemberDAO dao = MemberDAO.getInstance();
	 	boolean result = dao.duplicateIdCheck(id);
	 	resp.setContentType("text/html;charset=euc-kr");
	 	PrintWriter out = resp.getWriter();
	 	
	 	if(result) out.println("0"); //아이디 중복
	 	else out.println("1");
	 	
	 	out.close();
	 	return null;
	}

}
