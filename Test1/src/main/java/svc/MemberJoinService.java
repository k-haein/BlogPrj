package svc;

//이렇게 하면 MemberJoinService 클래스에서는 db.JdbcUtil의 기능을 모두 사용 가능.
import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import DAO.MemberDAO;
import vo.MemberBean;

/* 회원가입 진행 시 DB와 JSP를 연결해주며 가입완료와 가입불가를 확인하는 역할을 담당하는 클래스(Service) */
public class MemberJoinService {
	
	public boolean joinMember(MemberBean member) {
		boolean joinSuccess = false; //가입완료 기본값 false
		MemberDAO memberDAO = MemberDAO.getInstance();
		// 객체에 저장된 고객 정보를 DB로 전달하는 클래스.
		// DAO : Data Access Object
		Connection con = getConnection();
		// DB와 jsp간의 연결을 해주는 것을 담당함.
		memberDAO.setConnection(con);
		int insertCount = memberDAO.insertMember(member);  //insertMember는 MemberDAO에서 받아온다.
		// DB추가 쿼리를 메소드로 구현.

		if (insertCount > 0) {
			joinSuccess = true;
			// 정상 처리 되었음을 호출했던 곳으로 리턴.
			commit(con); //DB 명령 완료 확인
		} else {
			rollback(con);
			//만약 제대로 동작하지 않았다면
			//쿼리문에 대해서 취소(rollback)
		}
		close(con);
		//연결되지 않았으면 연결 해제(DB와 Connection의 연결 해제)

		return joinSuccess;
	}
	
	//=================== 추가) id 중복체크 하는 service ==============================
	public boolean checkId(String id) {
		boolean joinSuccess = false; //가입완료 기본값 false
		MemberDAO memberDAO = MemberDAO.getInstance();
		// 객체에 저장된 고객 정보를 DB로 전달하는 클래스.
		// DAO : Data Access Object
		Connection con = getConnection();
		// DB와 jsp간의 연결을 해주는 것을 담당함.
		memberDAO.setConnection(con);
		int chkId = memberDAO.checkId(id);  //checkId는 MemberDAO에서 받아온다.
		// DB추가 쿼리를 메소드로 구현.

		if (chkId > 0) {
			joinSuccess = true;
			// 정상 처리 되었음을 호출했던 곳으로 리턴.
			commit(con); //DB 명령 완료 확인
		} else {
			rollback(con);
			//만약 제대로 동작하지 않았다면
			//쿼리문에 대해서 취소(rollback)
		}
		close(con);
		//연결되지 않았으면 연결 해제(DB와 Connection의 연결 해제)

		return joinSuccess;
	}
	
	
	
	
}
