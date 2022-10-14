package DAO;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.PostBean;

public class PostDAO {

	//db패키지의 JdbcUtil을 통해 자바와 오라클이 연결이 가능해졌으니 이 두 프로그램을 연결했으면 이제 정보를 넘겨줘야한다.
	//DAO의 클래스에서 회원가입을 진행하면서 입력한 정보들을 오라클로 넘겨준다.
	
	public static PostDAO instance;
	Connection con;
	// jsp와 오라클 연결 유지.
	PreparedStatement pstmt;
	// 쿼리문 전달.
	ResultSet rs;
	// 쿼리문 결과 저장 객체.
	DataSource ds;
	// 어떤 DB에 연결할 지.

	private PostDAO() {

	}

	public static PostDAO getInstance() {
		if (instance == null) {
			instance = new PostDAO();
		} // 1개의 객체를 공동으로 사용.
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	//=========================== 로그인된 후 회원정보리스트를 가져와 보여주는 SQL로직 ===============================
	// MemberListService에서 로그인한 후 DB와 JSP를 연결해서 회원정보리스트를 배열로 가져와 저장할 때 인자로 쓰임.
	public ArrayList<PostBean> selectPostList() {
		// 객체 배열 비슷, 컬렉션 프로임워크
		// 여러 명의 회원 정보를 저장한다.

		// 디비에 저장된 모든 회원정보를 확인하는 SQL문(DB 이름 확인하기***)
		String sql = "select * from post_info";
		// 모든 회원 정보 가져오기.

		ArrayList<PostBean> postList = new ArrayList<PostBean>();
		PostBean pb = null;

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); //executeQuery : resultSet 객체 반환
			//select는 executeQuery()를 사용한다.
			//쿼리문 처리결과 ResultSet의 객체인 rs에 저장.

			if (rs.next()) {
				//조회된 결과가 있다면 아래 문장 수행.
				do {//한 번 수행하고 또 수행할 게 있으면 수행.
					pb = new PostBean();
					//고객 1명의 정보를 저장할 수 있는 MemberBean 객체 생성.
					pb.setPOST_NO(rs.getInt("POST_NO")); //DB 컬럼 이름 쓰기
					pb.setMEM_NO(rs.getInt("MEM_NO")); //DB 컬럼 이름 쓰기
					pb.setPOST_TITLE(rs.getString("POST_TITLE")); //DB 컬럼 이름 쓰기
					pb.setPOST_THUMBNAIL(rs.getString("POST_THUMBNAIL")); //DB 컬럼 이름 쓰기
					pb.setPOST_VIDEO(rs.getString("POST_VIDEO")); //DB 컬럼 이름 쓰기
					
					
					//내용 가져와서 15자만 보여주기.------------------
					String preStr=rs.getString("POST_CONTENT"); 
					if(preStr.length()>30){ 
						preStr=preStr.substring(0,15)+"...";
					};
					System.out.println("다른가?"+preStr);
					pb.setPOST_CONTENT(preStr); //DB 컬럼 이름 쓰기
					//----------------------------------------
					
					
					pb.setVisit_cnt(rs.getInt("Visit_cnt")); //DB 컬럼 이름 쓰기
					pb.setPOST_UPLOADTIME(rs.getString("POST_UPLOADTIME")); //DB 컬럼 이름 쓰기
					//조회된 결과 중, 첫 번째 회원에 해당하는 아이디를 가져와서 Member객체에 저장.
					postList.add(pb);
					//저장하면서 생성된 것을 이제 List에 담아냄.(어레이리스트)
					//반복문이 실행될 때마다 1명씩 누적 시킴.
				} while (rs.next());
				//rs.next때문에 어레이 리스트 다음 값으로 넘어간다.(차례차례 읽어옴)
			}
		} catch (Exception ex) {
			System.out.println("getDetailPost 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return postList;

	}
	
}
