package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.PostViewService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 회원 상세정보 표시를 위한 클래스이다.*/
public class PostViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();
		PostBean post = new PostBean();
		
		

		/*post.setPOST_NO(Integer.parseInt(req.getParameter("POST_NO")));
		 * post.setMEM_NO(Integer.parseInt(req.getParameter("MEM_NO")));
		 * post.setPOST_TITLE(req.getParameter("POST_TITLE"));
		 * post.setPOST_THUMBNAIL(req.getParameter("POST_THUMBNAIL"));
		 * post.setPOST_VIDEO(req.getParameter("POST_VIDEO"));
		 * post.setPOST_CONTENT(req.getParameter("POST_CONTENT"));
		 * post.setVisit_cnt(Integer.parseInt(req.getParameter("Visit_cnt")));
		 * post.setPOST_UPLOADTIME(req.getParameter("POST_UPLOADTIME"));
		 */
		
		

		//로그인하면, id는 session에 저장되어 있다.
		String id = (String) session.getAttribute("id");

		ActionForward forward = null; //어디로 갈지?


		//로그인 상태인지 확인.
		if (id == null) { 
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");

		//관리자가 맞는지
		} else if (id.equals("shopAdmin")) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('관리자입니다.')");
			out.println("location.href='./memberLogin.me'");
			out.println("</script>");

		//로그인 상태이고, 관리자가 아니라면 게시글 상세정보 보여주기.
		} else {

			forward = new ActionForward();
			System.out.println("여기333");
			

			int ClickPostNo = Integer.parseInt(req.getParameter("postno"));
			//URL 주소 뒤에 붙은 쿼리스트링은 getParameter로 가져온다.
			System.out.println("클릭한 포스트 번호: "+ClickPostNo);

		
			PostViewService postViewService = new PostViewService();
			//서비스 svc에서 만들어준다. 아래에 게시글상세정보 표시를 해주자.
			PostBean postObj = postViewService.getPostinfo(ClickPostNo);
			//getMember가 찾으려는 ID를 이용하여
			//회원정보를 찾고 member객체 리턴.
			req.setAttribute("postObj", postObj);
			//요청값(req)에 회원정보를 저장.
			forward.setPath("./blogPost.jsp");
		}

		return forward;
	}

}
