package action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinService;
import vo.ActionForward;

/* 인터페이스를 함께 추가했다. 로그인 처리를 위한 클래스이다.*/
public class MemberIdCheckAction implements Action { // Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {


//	 	String id = req.getParameter("MEMBER_ID");
//	 	System.out.println("id 정보 : "+id);
//	 	MemberDAO dao = MemberDAO.getInstance();
//	 	boolean result = dao.duplicateIdCheck(id);
//	 	resp.setContentType("text/html;charset=euc-kr");
//	 	PrintWriter out = resp.getWriter();
//	 	
//	 	if(result) out.println("0"); //아이디 중복
//	 	else out.println("1");
//	 	
//	 	out.close();
//	 	return null;
		
		MemberJoinService memberJoinService = new MemberJoinService();
		//=========================== id중복 처리 ================================

		String userId = req.getParameter("userId");
		// join.jsp에서 받아온 key값이 userId이고
		// value값은 유저가 실제로 적은 값, String userId에는 value값이 들어간다.
		PrintWriter out = resp.getWriter();
			
		boolean idChcek = memberJoinService.checkId(userId);
		//MemberDAO dao = new MemberDAO();
				
		

		// 성공여부 확인 : 개발자용
		if (idChcek == false) {
			System.out.println("이미 존재하는 아이디입니다.");
		} else if (idChcek == true) {
			System.out.println("사용 가능한 아이디입니다.");
		}
				
		out.write(idChcek + ""); // --> ajax 결과값인 result가 됨
				// --> String으로 값을 내보낼 수 있도록 + "" 를 해준다
		
		
		return null;
		
		
		
		
		
	}

}
