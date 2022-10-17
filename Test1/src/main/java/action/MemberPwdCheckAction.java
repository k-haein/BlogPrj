package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

/* 인터페이스를 함께 추가했다. id 중복체크 처리를 위한 클래스이다.*/
public class MemberPwdCheckAction implements Action { // Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// =========================== pwd 조건 처리 ================================

		String userPwd = req.getParameter("userPwd"); // ajax로 전달한 data 값 userPwd
		System.out.println("Action 내부) 입력한 pwd : " + userPwd);
		// System.out.println("Action 내부) 입력한 pwd : "+userPwd.getClass()); //타입확인

		PrintWriter out = resp.getWriter();

		String result = "";
		
	
		// 1004, 8282, iloveyou, abc123 포함하면 안됨
		if (userPwd.contains("1004") || userPwd.contains("8282") || userPwd.contains("iloveyou") || userPwd.contains("abc123")) { 
			System.out.println("위험- 1004, 8282, iloveyou, abc123 포함하면 안됨");
			result = "2";

		} else if (userPwd.matches("^[a-zA-Z]*$") || userPwd.matches("^[0-9]*$") ) {
			//* : 0회 이상(여러개) = 여러개의 문자가 모두 영문자 of 모두 숫자일 때
			System.out.println("보통 - 영문자만, 숫자만 있을 때");
			result = "3";

		} else {
			System.out.println("안전 = 영문자, 숫자, 특수문자 중 2개이상 섞어썼을 때");
			result = "4";

		} 

		System.out.println(result);
		out.write(result); // 얘는 마지막에만 선언해줘야지 if문이나 else 등에서 여러번 못쓴다.
		// --> ajax 결과값인 result가 됨
		// ajax의 result값 : 문자로 보내도 숫자로 감.
		return null;
		// ActionForward를 null로 리턴하면 이미 response에 응답을 끝냈다는 의미가 된다. 다른 어떤 페이지로도 이동하지 않는다.

	}

}
