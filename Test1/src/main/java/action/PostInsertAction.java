package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.PostInsertService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 작성한 포스트 저장 처리를 위한 클래스이다.*/
public class PostInsertAction implements Action { // Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PostBean post = new PostBean(); //vo에 선언한 변수들 import한거.
		//작성한 게시글 내용을 저장하고 DB로 전달.

		ActionForward forward = null;
		PrintWriter out = resp.getWriter();
		
		//---------------------------------------------
		
		
		//---------------------------------------------		
		
		
		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();
		// 세션에서 id값 가지고 있기. -> 이걸로 post_info의 mem_no를 넣어줄 것임.
		String sessionId = (String) session.getAttribute("id");
		
		post.setMEM_ID(sessionId);
		//입력 목록 적어주기(vo에서 받아옴.)
		post.setPOST_TITLE(req.getParameter("title"));
		post.setPOST_THUMBNAIL(req.getParameter("thumbnail"));
		post.setPOST_CONTENT(req.getParameter("content"));
		

		PostInsertService postInsertService = new PostInsertService();
		boolean InsertResult = postInsertService.insertPost(post); //vo에서 받은 변수 보내줌.
		//게시글 저장이 잘 되었는지 여부
		
		//ajax 통신이라 서버에서 안먹히나? 왜 이게 안되지...
		
//		System.out.println(InsertResult);
//		if (InsertResult) { //게시글 저장 후 내 블로그로 이동
//
//			resp.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>");
//			out.println("alert('저장되었습니다.')");
//			out.println("location.href='./myBlogAction.me");
//			out.println("</script>");
//		} else { //게시글 저장 실패 시
//			resp.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = resp.getWriter(); //위에 있음
//			out.println("<script>");
//			out.println("alert('게시글 저장 실패')");
//			out.println("history.back()");
//			out.println("</script>");
//		}
		
		return forward;
	}

}
