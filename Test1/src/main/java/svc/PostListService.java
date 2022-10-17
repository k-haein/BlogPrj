package svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;
import java.sql.Connection;
import java.util.ArrayList;
import DAO.PostDAO;
import vo.PostBean;


/* 게시글를 띄울 시 DB와 JSP를 연결해주는 역할을 담당하는 클래스(Service) */
public class PostListService {
	
	public ArrayList<PostBean> getPostList() { //리스트이므로 배열로 가져온다.
		//커넥션 풀 : DB와 미리 연결해놓은 커넥션 객체들을 풀에 저장해뒀다가 클라에서 요청오면 객체 빌려주고 볼일 끝나면 다시 반납받아 풀에 저장하는 방식
		Connection con = getConnection();
		// DB와 연결을 얻어내고.
		PostDAO postDAO = PostDAO.getInstance();
		// DB접속용 DAO 객체 참조 얻어오기.(싱글톤 패턴 : 인스턴스가 1개만 생성됨)
		// import static db.JdbcUtil.*;
		postDAO.setConnection(con);
		// 얻어온 커넥션 저장. -> 연결해서 할일 함.
		ArrayList<PostBean> postList = postDAO.selectPostList(); //selectPostList는 PostDAO에서 받아온다.
		//커넥션으로 DB에서 게시글 목록 받아서 배열에 저장

		close(con);
		// 사용을 마친 커넥션 반환
		return postList;
		// 게시글 목록 리턴.
	}
}
