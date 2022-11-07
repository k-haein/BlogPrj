package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import DAO.PostDAO;
import vo.PostBean;

/* 게시글을 DB에 수정후 저장하는 역할을 담당하는 클래스(Service) */
public class PostUpdateService {
	
	public boolean updatePost(PostBean post) {
		
		boolean updateSuccess = false; //수정완료 기본값 false
		PostDAO postDAO = PostDAO.getInstance();
		// 객체에 저장된 고객 정보를 DB로 전달하는 클래스.
		// DAO : Data Access Object
		Connection con = getConnection();
		// DB와 jsp간의 연결을 해주는 것을 담당함.
		postDAO.setConnection(con);
		int updateCount = postDAO.updatePost(post);
		// DB추가 쿼리를 메소드로 구현.

		if (updateCount > 0) {
			updateSuccess = true;
			// 정상 처리 되었음을 호출했던 곳으로 리턴.
			commit(con); //DB 명령 완료 확인
		} else {
			rollback(con);
			//만약 제대로 동작하지 않았다면
			//쿼리문에 대해서 취소(rollback)
		}
		close(con);
		//연결되지 않았으면 연결 해제(DB와 Connection의 연결 해제)

		return updateSuccess;
	}
	
}
