package svc;

import java.sql.Connection;

import DAO.MemberDAO;
import vo.MemberBean;

import static db.JdbcUtil.*; //따로 추가해줘서 JdbcUtil의 기능 전체를 쓰도록 하자.

/* 로그인 처리 시 DB와 JSP를 연결해주는 역할을 담당하는 클래스(Service) */
public class MemberLoginService {
	
	public boolean login(MemberBean member) {
		MemberDAO memberDAO = MemberDAO.getInstance();
		// 객체에 저장된 고객 정보를 DB로 전달하는 클래스.
		// DAO : Data Access Object
		Connection con = getConnection();
		// DB와 jsp간의 연결을 해주는 것을 담당함.
		memberDAO.setConnection(con);
		boolean loginResult = false;
		String loginId = memberDAO.selectLoginId(member); //selectLoginId는 MemberDAO에서 받아온다.
		if(loginId != null) {
			loginResult = true;
		}
		close(con);
		// import static db.JdbcUtil.*; 로 해결.
		
		return loginResult;
		
	}

}
