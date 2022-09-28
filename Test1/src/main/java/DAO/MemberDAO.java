package DAO;

import static db.JdbcUtil.close;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList; //배열 사용

import javax.sql.DataSource;

import vo.MemberBean;

public class MemberDAO {

	//db패키지의 JdbcUtil을 통해 자바와 오라클이 연결이 가능해졌으니 이 두 프로그램을 연결했으면 이제 정보를 넘겨줘야한다.
	//DAO의 클래스에서 회원가입을 진행하면서 입력한 정보들을 오라클로 넘겨준다.
	
	public static MemberDAO instance;
	Connection con;
	// jsp와 오라클 연결 유지.
	PreparedStatement pstmt;
	// 쿼리문 전달.
	ResultSet rs;
	// 쿼리문 결과 저장 객체.
	DataSource ds;
	// 어떤 DB에 연결할 지.

	private MemberDAO() {

	}

	public static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
		} // 1개의 객체를 공동으로 사용.
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	
	//=========================== 회원가입하는 SQL로직 ===============================
	// MemberJoinService에서 회원가입할 때 DB와 JSP를 연결할 때 인자로 쓰임.
	public int insertMember(MemberBean member) {
		//회원가입 시 DB에 member 정보를 넣는 SQL문(DB 이름 확인하기***)
		String sql = "insert into memberinfo values (?,?,?,?,?,?,?,?,?)";
		int insertCount=0;

		try {
			pstmt = con.prepareStatement(sql); 
			//prepareStatement : SQL문 실행하는 기능을 갖는 객체(변수는 ?로, setString으로 아래에 지정함.)
			pstmt.setString(1, member.getMEMBER_ID());
			pstmt.setString(2, member.getMEMBER_PW());
			pstmt.setString(3, member.getMEMBER_NAME());
			pstmt.setString(4, member.getMEMBER_BIR_YY());
			pstmt.setString(5, member.getMEMBER_BIR_MM());
			pstmt.setString(6, member.getMEMBER_BIR_DD());
			pstmt.setString(7, member.getMEMBER_GENDER());
			pstmt.setString(8, member.getMEMBER_MAIL());
			pstmt.setString(9, member.getMEMBER_PHONE());
			insertCount=pstmt.executeUpdate(); //executeUpdate : 데이터베이스 변경할 때
			//select는 executeQuery()를 사용한다.
			// insert, update, delete는 executeUpdate()를 사용한다.
			System.out.println("MemberDAO : 성공");
		
			//이 것을수행해서 정상적으로 된다면 insertCount가 1이 된다.

		} catch (Exception ex) {
			System.out.println("JoinMember 에러 : " + ex);

		} finally {
			close(pstmt); // import static db.JdbcUtil.*;
		}
		return insertCount;
	}


	//=========================== 로그인하는 SQL로직 ===============================
	// MemberLoginService에서 로그인할 때 DB와 JSP를 연결할 때 인자로 쓰임.
	public String selectLoginId(MemberBean member) { 
		String loginId = null;
		// 로그인 시 사용자가 입력한 아이디와 패스워드로 디비에 저장된 아이디 확인하는 SQL문(DB 이름 확인하기***)
		String sql = "select MEM_ID from memberinfo " + "where MEM_ID=? and MEM_PWD=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMEMBER_ID());
			pstmt.setString(2, member.getMEMBER_PW());
			rs = pstmt.executeQuery();
			//select는 executeQuery()를 사용한다.
			// insert, update, delete는 executeUpdate()를 사용한다.
			//쿼리문 처리결과 ResultSet의 객체인 rs에 저장.
			
			if (rs.next()) { 
				//rs객체에서 첫 번째 값 가져오기
				//가져올 값이 있다면~
				loginId = rs.getString("MEM_ID");  //DB 컬럼 이름 쓰기
				//member_id를 가져와서 loginId로 저장하겠다.
			}

		} catch (Exception ex) {
			System.out.println("LoginMember 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return loginId;
	}
	

	//=========================== 로그인된 후 회원정보리스트를 가져와 보여주는 SQL로직 ===============================
	// MemberListService에서 로그인한 후 DB와 JSP를 연결해서 회원정보리스트를 배열로 가져와 저장할 때 인자로 쓰임.
	public ArrayList<MemberBean> selectMemberList() {
		// 객체 배열 비슷, 컬렉션 프로임워크
		// 여러 명의 회원 정보를 저장한다.

		// 디비에 저장된 모든 회원정보를 확인하는 SQL문(DB 이름 확인하기***)
		String sql = "select * from memberinfo";
		// 모든 회원 정보 가져오기.

		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		MemberBean mb = null;

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); //executeQuery : resultSet 객체 반환
			//select는 executeQuery()를 사용한다.
			//쿼리문 처리결과 ResultSet의 객체인 rs에 저장.

			if (rs.next()) {
				//조회된 결과가 있다면 아래 문장 수행.
				do {//한 번 수행하고 또 수행할 게 있으면 수행.
					mb = new MemberBean();
					//고객 1명의 정보를 저장할 수 있는 MemberBean 객체 생성.
					mb.setMEMBER_ID(rs.getString("MEM_ID")); //DB 컬럼 이름 쓰기
					//조회된 결과 중, 첫 번째 회원에 해당하는 아이디를 가져와서
					//Member객체에 저장.
					mb.setMEMBER_PW(rs.getString("MEM_PWD")); //DB 컬럼 이름 쓰기
					memberList.add(mb);
					//저장하면서 생성된 것을 이제 List에 담아냄.(어레이리스트)
					//반복문이 실행될 때마다 1명씩 누적 시킴.
				} while (rs.next());
				//rs.next때문에 어레이 리스트 다음 값으로 넘어간다.(차례차례 읽어옴)
			}
		} catch (Exception ex) {
			System.out.println("getDetailMember 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return memberList;

	}
	

	//=========================== 회원상세정보를 가져와 보여주는 SQL로직 ===============================
	// MemberViewService에서 회원상세정보를 볼때 DB와 JSP를 연결할 때 인자로 쓰임.
	public MemberBean selectMember(String id) {
		// 디비에 저장된 모든 한 회원정보를 확인하는 SQL문(DB 이름 확인하기***)
		String sql ="select * from memberinfo where MEM_ID=?";
		MemberBean mb=null;
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();

			System.out.println("여긴 왔니?");
			if(rs.next()) {
				
				mb=new MemberBean();
			
				//고객 1명의 정보를 저장할 수 있는 MemberBean 객체 생성.
				mb.setMEMBER_ID(rs.getString("MEM_ID"));
				//조회된 결과 중, 첫 번째 회원에 해당하는 아이디를 가져와서
				//Member객체에 저장.
				mb.setMEMBER_PW(rs.getString("MEM_PWD"));
			}
		}catch(Exception ex){
			System.out.println("getSelectMember 에러: " + ex);
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return mb;
	}

	//=========================== 회원정보 삭제하는 SQL로직 ===============================
	// MemberDeleteService에서 회원정보 삭제 시 DB와 JSP를 연결할 때 인자로 쓰임.
	public int deleteMember(String deleteId) { //우클릭 Create method
		// 디비에 저장된 모든 한 회원정보를 확인하는 SQL문(DB 이름 확인하기***)
		String sql = "delete from memberinfo where MEM_ID=?";
	      int mb = 0;
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, deleteId);
	        pstmt.executeUpdate();
	         mb = 1;
	      }catch(Exception ex) {
	         System.out.println("삭제 안됨");
	         mb = 0;
	      }finally {
	         close(rs);
	         close(pstmt);
	      }
	      return mb;
	}

	
	

	//=========================== id 중복확인하는 SQL로직 ===============================
	public int checkId(String id) {  // 유저가 입력한 값을 매개변수로 한다
		/*
		회원가입 JSP에서 받아온 ID값과 기존 테이블의 ID값이 일치하는지 여부를
		확인하기 위해 Select명령어를 사용해 DAO를 만들었습니다. 
		Select값이 없는 경우 0을 출력하고,
		Select값이 있는 경우 1을 출력하도록 설정했습니다.*/
		String sql = "select * from memberinfo where MEM_ID=?"; // 입력값이 테이블에 있는지 확인
		
		int idCheck = 0;
	    try {
	    	pstmt = con.prepareStatement(sql); // pstmt에 위의 query 저장 후 DB에 연결 준비
	    	pstmt.setString(1, id); //첫번째 ?에 id 변수 셋팅
			System.out.println("DAO 내부) DB에 검색하는 id값(input에 쓴 값) : "+ id);
			
			rs = pstmt.executeQuery(); // query 실행 후 그 결과값을 rs에 저장
					
			
			if(rs.next() || id.equals("")) {
				idCheck = 0;  // 이미 존재하는 경우, 생성 불가능
				System.out.println("DAO 내부) id 중복됨");
			} else {
				idCheck = 1;  // 존재하지 않는 경우, 생성 가능
				System.out.println("DAO 내부) id 안중복");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);//마지막으로 연결 다 끊어주자. conn은 위에서 다 함.
		}

		return idCheck;
	}
	
	
	// MemberDeleteService에서 회원정보 삭제 시 DB와 JSP를 연결할 때 인자로 쓰임.
//	public int selectAllId(String id) { 
//		// 디비에 저장된 모든 한 회원정보를 확인하는 SQL문(DB 이름 확인하기***)
//		String sql = "SELECT MEM_ID from memberinfo where MEM_ID=?";
//	      int result = -1;//오류발생
//	      
//	      try {
//	         pstmt = con.prepareStatement(sql); //sql 시행
//	         pstmt.setString(1, id);
//	         rs = pstmt.executeQuery();
//				//select는 executeQuery()를 사용한다.
//				// insert, update, delete는 executeUpdate()를 사용한다.
//				//쿼리문 처리결과 ResultSet의 객체인 rs에 저장.
//				
//				if (rs.next()) { 
//					//rs객체에서 첫 번째 값 가져오기
//					result = 1;//중복된 id가 존재하는 경우
//					System.out.println("중복검사 결과 : "+result);
//				}else {
//					result = 0;//중복된 id가 존재하지않는 경우
//					System.out.println("중복검사 결과 : "+result);
//				}
//
//			} catch (Exception ex) {
//				System.out.println("LoginMember 에러: " + ex);
//			} finally {
//				close(rs);
//				close(pstmt);//마지막으로 연결 다 끊어주자. conn은 위에서 다 함.
//			}
//
//			return result; //id 중복검사한 결과를 전달해줌.
//			}
	
	
}
