package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.PostDeleteService;
import vo.ActionForward;

public class PostDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		// 로그인하면, id는 session에 저장되어 있다.
		String post_writer = req.getParameter("writer");
		int postNo = Integer.parseInt(req.getParameter("postno"));
		System.out.println("writer"+post_writer);

		ActionForward forward = null;
		// 로그인 상태인지 확인 -> 아니면 로그인화면 고고
		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
			
		// 사용자가 작성자가 맞는지 확인 -> 아니면 alert를 띄우고 해당 포스트로 다시 이동
		} else if (!id.equals(post_writer)) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('작성자가 아닌 사람은 게시글을 삭제할 수 없습니다.')");
			out.println("location.href='./postViewAction.me?postno="+postNo+"'");
			out.println("</script>");
			

		//사용자가 작성자면 삭제가 가능하다.
		} else {
			//Service에 삭제한 게시물 번호를 함께 넘겨준다.
			PostDeleteService postDeleteService = new PostDeleteService();
			boolean deleteResult = postDeleteService.deletePost(postNo);
			
			// delete 하면 내 블로그로 이동
			if (deleteResult) {
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out = resp.getWriter(); 
				out.println("<script>");
				out.println("alert('삭제되었습니다.');");
				out.println("location.href='./myBlogAction.me'");
				out.println("</script>");


			// delete 실패하면 alert 발생 후 해당 포스트로 다시 이동
			} else {
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out = resp.getWriter(); 
				out.println("<script>");
				out.println("alert('삭제 실패');");
				out.println("location.href='./postViewAction.me?postno="+postNo+"'");
				out.println("</script>");
			}
		}

		return forward;
		
		
	}

}
