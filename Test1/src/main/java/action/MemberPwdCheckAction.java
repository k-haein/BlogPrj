package action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinService;
import vo.ActionForward;

/* 인터페이스를 함께 추가했다. id 중복체크 처리를 위한 클래스이다.*/
public class MemberPwdCheckAction implements Action { // Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {


		
		//=========================== pwd 조건 처리 ================================

		String userPwd = req.getParameter("userPwd"); //ajax로 전달한 data 값 userId
		//1이면 사용가능, 0이면 중복됨
		System.out.println("Action 내부) 입력한 pwd : "+userPwd);
		//System.out.println("Action 내부) 입력한 pwd : "+userPwd.getClass());

		PrintWriter out = resp.getWriter();
			
		String result = "";
		
		// 성공여부 확인 : 개발자용(서버콘솔)
		if (userPwd.equals("11111111!")) { //와... ==은 안되고 equals는된다. 
			//String은 객체여서 equals()로 비교해야 한다
			System.out.println("사용불가");//https://go-coding.tistory.com/35
			result = "1";
			
			//8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.
			
		} 
			 else if (userPwd.equals("22222222!")) { 
				 System.out.println("위험");
				 //8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.
				 //1004나 연속된 숫자, ABCD같은 연속된 알파벳같은거.
			 
			 result = "2";
			 
			 }else if (userPwd.equals("33333333!")) { 
				 System.out.println("보통");
				 //특수문자 없이 소문자+숫자만일때
			 
			 result = "3";
			 
			 }else if (userPwd.equals("44444444!")) { 
				 System.out.println("안전");
				 //소문자 숫자 특수문자 대문자 합3
			 
			 result = "4";
			 
			 }else{
				 result="5";
				 System.out.println("아무것도 안뜸");
			 }
			 

		//result = "3";
		System.out.println(result);
		out.write(result);  //얘는 마지막에만 선언해줘야지 if문이나 else 등에서 여러번 못쓴다.
		//out.write("3");// --> ajax 결과값인 result가 됨
		// --> String으로 값을 내보낼 수 있도록 + "" 를 해준다.(숫자로는 안감)
		//ajax의 result값 : 문자로 보내도 숫자로 감.
		return null;
		//ActionForward를 null로 리턴하면 이미 response에 응답을 끝냈다는 의미가 된다. 다른 어떤 페이지로도 이동하지 않는다.
		
		
		
		
	}

}
