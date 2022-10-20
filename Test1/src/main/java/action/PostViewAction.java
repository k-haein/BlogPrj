package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.PostViewService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 게시글 상세보기 표시를 위한 클래스이다.*/
public class PostViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		/*PostBean post = new PostBean();
		 * post.setPOST_NO(Integer.parseInt(req.getParameter("POST_NO")));
		 * post.setMEM_NO(Integer.parseInt(req.getParameter("MEM_NO")));
		 * post.setPOST_TITLE(req.getParameter("POST_TITLE"));
		 * post.setPOST_THUMBNAIL(req.getParameter("POST_THUMBNAIL"));
		 * post.setPOST_VIDEO(req.getParameter("POST_VIDEO"));
		 * post.setPOST_CONTENT(req.getParameter("POST_CONTENT"));
		 * post.setVisit_cnt(Integer.parseInt(req.getParameter("Visit_cnt")));
		 * post.setPOST_UPLOADTIME(req.getParameter("POST_UPLOADTIME"));
		 */
		

		ActionForward forward = null; //어디로 갈지?


			forward = new ActionForward();
			

			int ClickPostNo = Integer.parseInt(req.getParameter("postno"));
			//URL 주소 뒤에 붙은 쿼리스트링은 getParameter로 가져온다.
			System.out.println("클릭한 포스트 번호: "+ClickPostNo);

		
			PostViewService postViewService = new PostViewService();
			//서비스 svc에서 만들어준다. 아래에 게시글상세정보 표시를 해주자.
			PostBean postObj = postViewService.getPostinfo(ClickPostNo);

			req.setAttribute("postObj", postObj);

			forward.setPath("./blogPost.jsp");
		

		return forward;
	}

}
