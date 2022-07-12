package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtil {

	//db패키지에 jdbcUtil을 생성한 이유 : 자바와 오라클을 연결하기 위해서.
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/myora"); //요 이름이 META-INF 속 context.xml의 SQL 연결DB 이름이랑 같아야함.
			con = ds.getConnection();
			// ctrl + shift + o : import정리.
			con.setAutoCommit(false);
			System.out.println("jdbcUtil : connect success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static void close(Connection con) {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // 접속이 끝났다면 접속을 해제하도록 하는 것을 담당.
	}

	public static void close(Statement stmt) {
		try {
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // 쿼리문 전달을 위한 Statement 객체 닫기.
	}

	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} // 전달된 명령문 최종 실행.
	}

	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		} // 전달된 명령문 최종 취소.
	}

	
}
