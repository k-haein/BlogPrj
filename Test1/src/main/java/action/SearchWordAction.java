package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.PostListService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 메인페이지 처리를 위한 클래스이다.*/
public class SearchWordAction implements Action { //Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		
		//session을 써서 서버 생성함.
		HttpSession session = req.getSession();
		// 로그인할 때는 setSession해서 가져오고
		// 여기 리스트에서는 get으로 뿌린다
		String sessionId = (String) session.getAttribute("id");
	
		//option값과 검색어 값을 form에서 받아온다.
		//URL 주소 뒤에 붙은 쿼리스트링은 getParameter로 가져온다.
		int option = Integer.parseInt(req.getParameter("option"));
		String searchWord = req.getParameter("searchWord");
		System.out.println("검색어: "+searchWord);
		
		
		ActionForward forward = null; //어디로 갈지?

		
		//1. 로그인 상태인지 확인
		if (sessionId == null) {
			// 세션에 저장된 아이디가 없다면~
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");

		//2. 게시글 목록 보여짐	
		} else {
			// 검색된 게시글 목록 표시.
			forward = new ActionForward();
			PostListService postListService = new PostListService();
			//배열로 검색한 게시글목록을 가져온다.
			ArrayList<PostBean> postSearchList = postListService.getSearchList(option,searchWord);

			req.setAttribute("postSearchList", postSearchList);
			
			//mainPage로 게시글 목록을 던져준다.
			forward.setPath("./mainPage_search.jsp");
		}

		return forward;
		
	
		
	}

}
