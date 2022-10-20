package DAO;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.MemberBean;
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

	//=========================== 로그인된 후 게시글 목록을 가져와 보여주는 SQL로직 ===============================
	// selectPostList : PostListService에서 DB와 JSP를 연결해서 게시글 목록을 배열로 가져와 저장할 때 인자로 쓰임.
	public ArrayList<PostBean> selectPostList(String sessionId) {
		// ArrayList: 객체 배열 비슷, 컬렉션 프로임워크
		// 여러 개의 게시글 정보를 저장한다.

		// 디비에 저장된 모든 게시글 목록을 확인하는 SQL문(DB 이름 확인하기***)
		//String sql = "select * from post_info";
		
		//디비에 저장된 "나를 제외한 나머지 사람들의" 게시글 목록을 확인하는 SQL문(DB 이름 확인하기***)
		String sql = "select * from post_info p join memberinfo m on p.mem_no = m.mem_no where m.mem_id != ?";
		
		
		ArrayList<PostBean> postList = new ArrayList<PostBean>();
		PostBean pb = null; //Bean(vo)은 그릇이다. 뭘 가져올지는 vo에 목록이 있다.
		

		try {
			pstmt = con.prepareStatement(sql);
			
			//세션 id값 가져와서 SQL 문에 넣어줌.
			pstmt.setString(1, sessionId);
			System.out.println("sessionId : "+sessionId);
			
			rs = pstmt.executeQuery(); //executeQuery : resultSet 객체 반환
			//select는 executeQuery()를 사용한다.
			//쿼리문 처리결과 ResultSet의 객체인 rs에 저장.
			

			if (rs.next()) {//조회된 결과가 있다면 아래 문장 수행.
				do {//한 번 수행하고 또 수행할 게 있으면 수행.
					pb = new PostBean();
					//게시글 1개의 정보를 저장할 수 있는 PostBean 객체 생성.
					pb.setPOST_NO(rs.getInt("POST_NO")); //게시글번호
					pb.setMEM_NO(rs.getInt("MEM_NO")); //회원번호
					pb.setPOST_TITLE(rs.getString("POST_TITLE")); //게시글제목
					pb.setPOST_THUMBNAIL(rs.getString("POST_THUMBNAIL")); //게시글섬네일
					pb.setPOST_VIDEO(rs.getString("POST_VIDEO")); //게시글비디오
					
					//--- 게시글 내용 가져와서 15자만 미리보기로 보여줌 ---
					String preStr=rs.getString("POST_CONTENT"); 
					if(preStr.length()>30){ 
						preStr=preStr.substring(0,15)+"..."; //자르고 ... 붙이기
					};
					pb.setPOST_CONTENT(preStr); //게시글내용 미리보기
					//----------------------------------------
					
					pb.setVisit_cnt(rs.getInt("Visit_cnt")); //게시글조회수
					pb.setPOST_UPLOADTIME(rs.getString("POST_UPLOADTIME")); //게시글업로드타임
					//조회된 결과를 PostBean객체에 저장.
					postList.add(pb);
					//저장하면서 생성된 것을 이제 List에 담아냄.(ArrayList)
					//반복문이 실행될 때마다 게시글 1개씩 누적 시킴.
				} while (rs.next());
				//rs.next때문에 어레이 리스트 다음 값으로 넘어간다.(차례차례 읽어옴)
			}
		} catch (Exception ex) {
			System.out.println("selectPostList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return postList;

	}
	
	//=========================== 게시글 상세보기를 가져와 보여주는 SQL로직 ===============================
	// PostViewService에서 게시글 상세보기정보를 볼때 DB와 JSP를 연결할 때 인자로 쓰임.
	public PostBean selectPost(int postNo) {
		String sql ="select * from post_info where POST_NO=?";
		PostBean pb=null;
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,postNo);
			rs=pstmt.executeQuery();

			System.out.println("postNo로 게시글 검색");
			if(rs.next()) {
				
				pb=new PostBean();
			
				//게시글 1개의 정보를 저장할 수 있는 PostBean 객체 생성.
				pb.setPOST_NO(rs.getInt("POST_NO")); //게시글번호
				pb.setMEM_NO(rs.getInt("MEM_NO")); //회원번호
				pb.setPOST_TITLE(rs.getString("POST_TITLE")); //게시글제목
				pb.setPOST_THUMBNAIL(rs.getString("POST_THUMBNAIL")); //게시글섬네일
				pb.setPOST_VIDEO(rs.getString("POST_VIDEO")); //게시글비디오
				pb.setPOST_CONTENT(rs.getString("POST_CONTENT")); //게시글 내용
				pb.setVisit_cnt(rs.getInt("Visit_cnt")); //게시글조회수
				pb.setPOST_UPLOADTIME(rs.getString("POST_UPLOADTIME")); //게시글업로드타임
			}
		}catch(Exception ex){
			System.out.println("getSelectPost 에러: " + ex);
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return pb;
	}
	
	
	
}
