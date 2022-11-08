package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.PostViewService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 수정할 내용을 DB에서 가져와 표시를 위한 클래스이다.*/
public class PostEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		ActionForward forward = null; //어디로 갈지?


			forward = new ActionForward();
			
			
			//session을 써서 서버 생성함.
    		HttpSession session = req.getSession();
    		// 세션에서 id값 가지고 있기. -> 이걸로 post_info의 mem_no를 넣어줄 것임.

			//URL 주소 뒤에 붙은 쿼리스트링은 getParameter로 가져온다.
    		String sessionId = (String) session.getAttribute("id");
            System.out.println("수정 sessionId "+sessionId);
    		String post_writer = req.getParameter("writer");
    		int postNo = Integer.parseInt(req.getParameter("postno"));
            System.out.println("수정 postNo "+postNo);
    		

    		// 로그인 상태인지 확인 -> 아니면 로그인화면 고고
    		if (sessionId == null) {
    			forward = new ActionForward();
    			forward.setRedirect(true);
    			forward.setPath("./memberLogin.me");
    			
    		// 사용자가 작성자가 맞는지 확인 -> 아니면 alert를 띄우고 해당 포스트로 다시 이동
    		} else if (!sessionId.equals(post_writer)) {
    			resp.setContentType("text/html;charset=UTF-8");
    			PrintWriter out = resp.getWriter();
    			out.println("<script>");
    			out.println("alert('작성자가 아닌 사람은 게시글을 수정할 수 없습니다.')");
    			out.println("location.href='./postViewAction.me?postno="+postNo+"'");
    			out.println("</script>");
    			
    		}else {
					
			PostViewService postViewService = new PostViewService();
			//게시글 정보 띄워주는건 그냥 원래 게시글 상세페이지 보여줬던 정보 똑같이 가져오면 됨.
			PostBean postinfo = postViewService.getPostinfo(postNo);

			req.setAttribute("postinfo", postinfo);
			//수정페이지로 게시글 정보를 던져준다.
			forward.setPath("./updateEdit.jsp");
		
    		}
		return forward;
	}

}
