package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.PostInsertService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 작성한 포스트 저장 처리를 위한 클래스이다.*/
public class PostInsertAction implements Action { // Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PostBean post = new PostBean(); //vo에 선언한 변수들 import한거.
		//작성한 게시글 내용을 저장하고 DB로 전달.
		
		
		boolean InsertResult = false;
		
		//입력 목록 적어주기(vo에서 받아옴.)
		post.setMEM_ID(req.getParameter("mem"));
		post.setPOST_TITLE(req.getParameter("title"));
		post.setPOST_THUMBNAIL(req.getParameter("thumbnail"));
		post.setPOST_CONTENT(req.getParameter("content"));
		post.setVisit_cnt(req.getParameter("cnt"));
		

		PostInsertService postInsertService = new PostInsertService();
		InsertResult = postInsertService.insertPost(post); //vo에서 받은 변수 보내줌.
		//게시글 저장이 잘 되었는지 여부

		ActionForward forward = null;
		if (InsertResult == false) { //게시글 저장 실패 시
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter(); //위에 있음
			out.println("<script>");
			out.println("alert('게시글 저장 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else { //게시글 저장 후 내 블로그로 이동
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./MyBlogAction.me");
		}
		
		return forward;
	}

}