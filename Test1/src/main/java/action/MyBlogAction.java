package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyPostListService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 게시글 상세보기 표시를 위한 클래스이다.*/
public class MyBlogAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();
		// 세션에서 id값 가지고 있기.
		String sessionId = (String) session.getAttribute("id");
		ActionForward forward = null; //어디로 갈지?

			// 내 게시글 목록 및 내용 표시.
			forward = new ActionForward();
			MyPostListService myPostListService = new MyPostListService();
			//배열로 게시글 목록을 가져온다. id는 같이 던져줘야 읽음.
			ArrayList<PostBean> myPostList = myPostListService.getMyPostList(sessionId);

			req.setAttribute("myPostList", myPostList);
			
			//mainPage로 게시글 목록을 던져준다.
			forward.setPath("./myBlog.jsp");
		

		return forward;
		
	
		
	}


}
