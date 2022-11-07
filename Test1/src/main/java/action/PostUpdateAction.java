package action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.PostUpdateService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 작성한 포스트 저장 처리를 위한 클래스이다.*/
public class PostUpdateAction implements Action { // Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PostBean post = new PostBean(); //vo에 선언한 변수들 import한거.
		//작성한 게시글 내용을 저장하고 DB로 전달.

		ActionForward forward = null;

       
  
		//------- 파일 업로드 구현 --------------------------------------
	    //업로드 파일 사이즈
        int fileSize = 5*1024*1024;

        String uploadPath = "C:\\Users\\User\\git\\BlogPrj\\Test1\\WebContent\\resources\\img\\thumbnail";
        //한번 정적으로 때려넣어보자. -> refresh 하니까 잘 들어간다.

        System.out.println("uploadpath는?  "+uploadPath);
        try {
            //파일업로드
            MultipartRequest multi = new MultipartRequest(req, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
        
            //파일 이름 초기화
            String fileName  = "";
            
            //파일 이름 가져오기
            Enumeration<String> names = multi.getFileNames();
            if(names.hasMoreElements()) {
                String name = names.nextElement();
                fileName = multi.getFilesystemName(name);
            }

    		//---------------------------------------------	
            
    		//session을 써서 서버 생성함.
    		HttpSession session = req.getSession();
    		// 세션에서 id값 가지고 있기. -> 이걸로 post_info의 mem_no를 넣어줄 것임.
    		String sessionId = (String) session.getAttribute("id");
            System.out.println("sessionId "+sessionId);
    		String post_writer = multi.getParameter("writer");
    		int postNo = Integer.parseInt(multi.getParameter("postno"));
            System.out.println("postNo "+postNo);
    		

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
    			

    		//사용자가 작성자면 삭제가 가능하다.
    		} else {

	    		post.setPOST_NO(postNo);
	    		//입력 목록 적어주기(vo에서 받아옴.)
	    		post.setPOST_TITLE(multi.getParameter("title"));
	    		
	    		//파일 첨부를 한 경우에만 post 객체에 넣어준다. 없으면 sysout만 찍음.
	    		if(fileName != null) {
		    		post.setPOST_THUMBNAIL(fileName);
	    		}else {
	    			System.out.println("파일 첨부 안함");
	    		}
	    		
	    		post.setPOST_CONTENT(multi.getParameter("content"));
	    		
	    		PostUpdateService postUpdateService = new PostUpdateService();
	    		boolean result = postUpdateService.updatePost(post); //vo에서 받은 변수 보내줌.
	    		//게시글 저장이 잘 되었는지 여부
	    		if(result) {
	                forward.setRedirect(true);
	                forward.setPath("myBlogAction.me");
	            }
    		}
	     } catch (Exception e) {
	        e.printStackTrace();
	     }
	        return forward;
    }

}
