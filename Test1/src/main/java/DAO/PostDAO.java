package DAO;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

	//=========================== 회원상세정보를 가져와 보여주는 SQL로직 ===============================
	// MemberViewService에서 회원상세정보를 볼때 DB와 JSP를 연결할 때 인자로 쓰임.
	public PostBean selectPost(String id) {
		// 디비에 저장된 모든 한 회원정보를 확인하는 SQL문(DB 이름 확인하기***)
		String sql ="select * from post_info where MEM_ID=?";
		PostBean pb=null;
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();

			System.out.println("여긴 왔니?");
			if(rs.next()) {
				
				pb = new PostBean();
			
				//고객 1명의 정보를 저장할 수 있는 MemberBean 객체 생성.
				pb.setPOST_TITLE(rs.getString("POST_TITLE")); //DB 컬럼 이름 쓰기
				//조회된 결과 중, 첫 번째 회원에 해당하는 아이디를 가져와서
				//Member객체에 저장.
				pb.setPOST_TITLE(rs.getString("POST_TITLE")); //DB 컬럼 이름 쓰기
			}
		}catch(Exception ex){
			System.out.println("getSelectMember 에러: " + ex);
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return pb;
	}
	
}
