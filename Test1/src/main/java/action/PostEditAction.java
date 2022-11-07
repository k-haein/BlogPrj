package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.PostViewService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 수정할 내용을 DB에서 가져와 표시를 위한 클래스이다.*/
public class PostEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		ActionForward forward = null; //어디로 갈지?


			forward = new ActionForward();
			

			int ClickPostNo = Integer.parseInt(req.getParameter("postno"));
			//URL 주소 뒤에 붙은 쿼리스트링은 getParameter로 가져온다.
			System.out.println("수정한 포스트 번호: "+ClickPostNo);

		
			PostViewService postViewService = new PostViewService();
			//게시글 정보 띄워주는건 그냥 원래 게시글 상세페이지 보여줬던 정보 똑같이 가져오면 됨.
			PostBean postinfo = postViewService.getPostinfo(ClickPostNo);

			req.setAttribute("postinfo", postinfo);
			//수정페이지로 게시글 정보를 던져준다.
			forward.setPath("./updateEdit.jsp");
		

		return forward;
	}

}
