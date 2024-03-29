package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.PostListService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 메인페이지 처리를 위한 클래스이다.*/
public class PostListAction implements Action { //Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		
		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();
		// 로그인할 때는 setSession해서 가져오고
		// 여기 리스트에서는 get으로 뿌린다
		String sessionId = (String) session.getAttribute("id");
		ActionForward forward = null; //어디로 갈지?

		
		//1. 로그인 상태인지 확인
		if (sessionId == null) {
			// 세션에 저장된 아이디가 없다면~
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");

		//2. 게시글 목록 보여짐	
		} else {
			// 모든 게시글 목록 표시.
			forward = new ActionForward();
			PostListService postListService = new PostListService();
			//배열로 게시글목록을 가져온다.
			ArrayList<PostBean> postList = postListService.getPostList(sessionId);

			req.setAttribute("postList", postList);
			
			//mainPage로 게시글 목록을 던져준다.
			forward.setPath("./mainPage.jsp");
		}

		return forward;
		
	
		
	}

}
