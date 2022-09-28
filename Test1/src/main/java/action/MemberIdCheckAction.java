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


		//참고했던 내용들...이건 서비스 안가도 될듯?
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

		String userId = req.getParameter("userId"); //ajax로 전달한 data 값 userId
		//1이면 사용가능, 0이면 중복됨
		System.out.println("Action 내부) 입력한 id : "+userId);
		PrintWriter out = resp.getWriter();
			
		int idChk = memberJoinService.checkIdService(userId); 
		//DB 조회해서 중복체크 결과값 전송받음(checkId). 1이면 사용가능, 0이면 중복됨
				
		
		// 성공여부 확인 : 개발자용(서버콘솔)
		if (idChk == 0) { //id 중복
			System.out.println("Action 내부) 이미 존재하는 아이디입니다.");
		} else if (idChk == 1) {
			System.out.println("Action 내부) 사용 가능한 아이디입니다.");
		}
				
		out.write(idChk + ""); // --> ajax 결과값인 result가 됨
				// --> String으로 값을 내보낼 수 있도록 + "" 를 해준다
				//ajax의 result값 : 1이면 사용가능, 0이면 중복됨
		
		return null;
		//ActionForward를 null로 리턴하면 이미 response에 응답을 끝냈다는 의미가 된다. 다른 어떤 페이지로도 이동하지 않는다.
		
		
		
		
	}

}
