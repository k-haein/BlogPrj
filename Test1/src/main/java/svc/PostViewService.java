package svc;


import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import DAO.PostDAO;
import vo.PostBean;


/* 게시글 상세페이지를 띄울 시 DB와 JSP를 연결해주는 역할을 담당하는 클래스(Service) */
public class PostViewService {
	
	public PostBean getPostinfo(int postNo) {
		PostDAO postDAO = PostDAO.getInstance();
		// 객체에 저장된 고객 정보를 DB로 전달하는 클래스.
		// DAO : Data Access Object
		Connection con = getConnection();
		// DB와 jsp간의 연결을 해주는 것을 담당함.
		postDAO.setConnection(con);
		
		PostBean post = postDAO.selectPost(postNo); //selectPost는 postDAO에서 받아온다.

		close(con); //커넥션풀 닫음

		return post;
	}
}
