package DAO;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
//					if(preStr.length()>30){ 
//						preStr=preStr.substring(0,15)+"..."; //자르고 ... 붙이기
//					};
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
	public PostBean selectPost(int postNo){
		//String sql ="select * from post_info where POST_NO=?";
		
		//post_info 테이블 전부와 mem_id만 가져온다. 여기서 프로필 사진 가져오면 될듯.
		String sql ="select p.*,m.mem_id,m.mem_pic from post_info p left join memberinfo m on p.mem_no = m.mem_no where POST_NO=?";
		
		
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
				
				
				pb.setMEM_ID(rs.getString("MEM_ID")); //게시글 쓴 회원 id
				pb.setMEM_PIC(rs.getString("MEM_PIC")); //게시글 쓴 회원 사진
			}
			
		}catch(Exception ex){
			System.out.println("getSelectPost 에러: " + ex);
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return pb;
	}
	//=========================== 게시글 조회수를 +1 하는 SQL로직 ===============================
	public int postVisitCnt(int postNo) { 
		//게시글 상세보기 할때마다 조회수 +1 하는 업데이트문도 같이 해주자.
		String sql = "UPDATE post_info SET VISIT_CNT = VISIT_CNT + 1 WHERE POST_NO = ?";
	      
		int visitCount = 0;
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, postNo); //가져온 게시글 번호 보내주기
	         pstmt.executeUpdate(); //executeUpdate : 데이터베이스 변경할 때
	         visitCount = 1;
	      }catch(Exception ex) {
	         System.out.println("조회수+1 안됨" + ex);
	         visitCount = 0;
	      }finally {
	         close(rs);
	         close(pstmt);
	      }
	      return visitCount;
	}
	
	//=========================== 내 블로그 게시글을 가져와 보여주는 SQL로직 ===============================
		public ArrayList<PostBean> selectMyPostList(String sessionId) {
			// ArrayList: 객체 배열 비슷, 컬렉션 프로임워크
			// 여러 개의 게시글 정보를 저장한다.
			
			//디비에 저장된 내 게시글 목록을 확인하는 SQL문(DB 이름 확인하기***)
			String sql = "select p.*,m.mem_id,m.mem_pic from post_info p join memberinfo m on p.mem_no = m.mem_no where m.mem_id = ?";
			
			
			ArrayList<PostBean> myPostList = new ArrayList<PostBean>();
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
//						System.out.println(preStr);
//						String cpreStr=preStr.replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
//						System.out.println("변경후 왜 안잘려"+cpreStr);
//				
//						if(preStr.length()>30){
//							
//							preStr=preStr.substring(0,15)+"..."; //자르고 ... 붙이기
//						};
						pb.setPOST_CONTENT(preStr); //게시글내용 미리보기
						//----------------------------------------
						
						pb.setVisit_cnt(rs.getInt("Visit_cnt")); //게시글조회수
						pb.setPOST_UPLOADTIME(rs.getString("POST_UPLOADTIME")); //게시글업로드타임
						
						
						//위젯에 띄울 내 회원정보
						pb.setMEM_ID(rs.getString("MEM_ID")); //게시글 쓴 회원 id
						pb.setMEM_PIC(rs.getString("MEM_PIC")); //게시글 쓴 회원 사진
						
						//조회된 결과를 PostBean객체에 저장.
						myPostList.add(pb);
						//저장하면서 생성된 것을 이제 List에 담아냄.(ArrayList)
						//반복문이 실행될 때마다 게시글 1개씩 누적 시킴.
					} while (rs.next());
					//rs.next때문에 어레이 리스트 다음 값으로 넘어간다.(차례차례 읽어옴)
				}
			} catch (Exception ex) {
				System.out.println("selectMyPostList 에러 : " + ex);
			} finally {
				close(rs);
				close(pstmt);
			}
			return myPostList;

		}
		
		
		
		//=========================== 게시글을 삭제하는 SQL로직 ===============================
		// PostDeleteService에서 게시글 삭제 시 DB와 JSP를 연결할 때 인자로 쓰임.
		public int deletePost(int postNo) { //우클릭 Create method
			// 해당 게시글을 삭제하는 SQL문(DB 이름 확인하기***)
			String sql = "delete from post_info where post_No=?";
		      int deleteCount = 0;
		      
		      try {
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, postNo); //가져온 게시글 번호 보내주기
		         pstmt.executeUpdate(); //executeUpdate : 데이터베이스 변경할 때
		        deleteCount = 1;
		      }catch(Exception ex) {
		         System.out.println("삭제 안됨" + ex);
		         deleteCount = 0;
		      }finally {
		         close(rs);
		         close(pstmt);
		      }
		      return deleteCount;
		}

		//=========================== 게시글 저장하는 SQL로직 ===============================
		// PostInsertService에서  게시글 저장할 때 DB와 JSP를 연결할 때 인자로 쓰임.
		public int insertPost(PostBean post) {
			//게시글 저장할 때 SQL문(DB 이름 확인하기***)
			String sql = 
				"INSERT INTO post_info("
						+ "post_no,"
						+ "mem_no,"
						+ "post_title,"
						+ "post_thumbnail,"
						+ "POST_VIDEO,"
						+ "POST_CONTENT,"
						+ "VISIT_CNT,"
						+ "POST_UPLOADTIME"
				+ ") "
				+ "VALUES( "
						+ "(SELECT NVL(MAX(post_no), 0) + 1 FROM post_info)," //post_no
						+ "(SELECT mem_no FROM memberinfo WHERE mem_id = ?)," //mem_no 찾기
						+ "?," //post_title
						+ "?," //post_thumbnail
						+ "'비디오.avi',"
						+ "?," //POST_CONTENT
						+ "0," //VISIT_CNT
						+ "TRUNC(SYSDATE)" //POST_UPLOADTIME
				+ ")";
			
			int insertCount=0;

			try {
				pstmt = con.prepareStatement(sql); 
				//prepareStatement : SQL문 실행하는 기능을 갖는 객체(변수는 ?로, setString으로 아래에 지정함.)
				pstmt.setString(1, post.getMEM_ID()); //sessionId로 mem_no 찾기
				pstmt.setString(2, post.getPOST_TITLE());
				pstmt.setString(3, post.getPOST_THUMBNAIL());
				//pstmt.setInt(4, post.getPOST_VIDIO());
				pstmt.setString(4, post.getPOST_CONTENT());

				System.out.println("여기니? "+post.getPOST_THUMBNAIL());
				insertCount=pstmt.executeUpdate(); //executeUpdate : 데이터베이스 변경할 때
				//select는 executeQuery()를 사용한다.
				// insert, update, delete는 executeUpdate()를 사용한다.
				//정상적으로 된다면 insertCount가 1이 된다.
				System.out.println("게시글 저장2");
			} catch (Exception ex) {
				System.out.println("게시글 저장 안됨" + ex);
				

			} finally {
				close(pstmt); // import static db.JdbcUtil.*;
			}
			return insertCount;
		}
		//=========================== 게시글 수정하는 SQL로직 ===============================
		// postUpdateService에서  게시글 수정할 때 DB와 JSP를 연결할 때 인자로 쓰임.
		public int updatePost(PostBean post) {

			int updateCount=0;
			System.out.println("파일첨부"+post.getPOST_THUMBNAIL());

			//파일 이름이 있는 경우 --------------------------------------
			if (post.getPOST_THUMBNAIL() != null) {
			String sql = 
				"UPDATE post_info SET "
				+ "post_title = ?,"
				+ "post_thumbnail = ?,"
				+ "post_content = ?"
				+ "WHERE POST_NO = ?";
			

			try {
				pstmt = con.prepareStatement(sql); 
				//prepareStatement : SQL문 실행하는 기능을 갖는 객체(변수는 ?로, setString으로 아래에 지정함.)
				pstmt.setString(1, post.getPOST_TITLE());
				pstmt.setString(2, post.getPOST_THUMBNAIL());
				//pstmt.setInt(4, post.getPOST_VIDIO());
				pstmt.setString(3, post.getPOST_CONTENT());
				pstmt.setInt(4, post.getPOST_NO()); //파라미터로 가져온 POST_NO 찾기
				
				updateCount=pstmt.executeUpdate(); //executeUpdate : 데이터베이스 변경할 때
				System.out.println("게시글 수정1");
			} catch (Exception ex) {
				System.out.println("게시글 수정1 안됨" + ex);
			} finally {
				close(pstmt); // import static db.JdbcUtil.*;
			}
			
			
			}else {
				//파일 이름이 없는 경우 --------------------------------------
				String sql2 = 
					"UPDATE post_info SET "
					+ "post_title = ?,"
				//	+ "post_thumbnail = ?,"
					+ "post_content = ?"
					+ "WHERE POST_NO = ?";
				

				try {
					pstmt = con.prepareStatement(sql2); 
					//prepareStatement : SQL문 실행하는 기능을 갖는 객체(변수는 ?로, setString으로 아래에 지정함.)
					pstmt.setString(1, post.getPOST_TITLE());
				//	pstmt.setString(2, post.getPOST_THUMBNAIL());
					//pstmt.setInt(4, post.getPOST_VIDIO());
					pstmt.setString(2, post.getPOST_CONTENT());
					pstmt.setInt(3, post.getPOST_NO()); //파라미터로 가져온 POST_NO 찾기

					
					updateCount=pstmt.executeUpdate(); //executeUpdate : 데이터베이스 변경할 때
					System.out.println("게시글 수정2");
				} catch (Exception ex) {
					System.out.println("게시글 수정2 안됨" + ex);
					

				} finally {
					close(pstmt); // import static db.JdbcUtil.*;
				}
			}

			// --------------------------------------
			return updateCount;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
