package svc;


import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import DAO.MemberDAO;
import vo.MemberBean;


/* 회원정보를 띄울 시 DB와 JSP를 연결해주는 역할을 담당하는 클래스(Service) */
public class MemberViewService {
	
	public MemberBean getMember(String viewId) {
		MemberDAO memberDAO = MemberDAO.getInstance();
		// 객체에 저장된 고객 정보를 DB로 전달하는 클래스.
		// DAO : Data Access Object
		Connection con = getConnection();
		// DB와 jsp간의 연결을 해주는 것을 담당함.
		memberDAO.setConnection(con);
		
		MemberBean member = memberDAO.selectMember(viewId); //selectMember는 MemberDAO에서 받아온다.

		close(con); //커넥션풀 닫음

		return member;
	}
}
