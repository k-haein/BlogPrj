package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import DAO.PostDAO;

public class PostDeleteService {

	
	public boolean deletePost(int postNo) {
		boolean deleteResult = false;
		Connection con = getConnection();
		PostDAO postDAO = PostDAO.getInstance();
		postDAO.setConnection(con);
		int deleteCount = postDAO.deletePost(postNo);

		//지우면 지웠다고 결과 1 리턴 아니면 롤백
		if (deleteCount > 0) { 
			commit(con);
			deleteResult = true;
		} else {
			rollback(con);
		}
		close(con);
		return deleteResult;
	}

}
