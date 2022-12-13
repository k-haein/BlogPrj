package action;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.PostInsertService;
import vo.ActionForward;
import vo.PostBean;

/* 인터페이스를 함께 추가했다. 작성한 포스트 저장 처리를 위한 클래스이다.*/
public class PostInsertAction implements Action { // Action을 implements 해줌

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PostBean post = new PostBean(); //vo에 선언한 변수들 import한거.
		//작성한 게시글 내용을 저장하고 DB로 전달.

		ActionForward forward = null;

        
  
		//------- 파일 업로드 구현 --------------------------------------
	    //업로드 파일 사이즈
        int fileSize = 5*1024*1024;
        
        //업로드될 폴더 경로
        String uploadPath = req.getServletContext().getRealPath("/resources/img/thumbnail");
        //C:\Users\User\Desktop\김해인\eclipse\eclipse workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Test1\
        //경로 여기가 어디야... 일단 내가 아는 project Explorer 경로로 다시 설정해줌.
       
       // String uploadPath = "C:\\Users\\User\\git\\BlogPrj\\Test1\\WebContent\\resources\\img\\thumbnail";
        //한번 정적으로 때려넣어보자. -> refresh 하니까 잘 들어간다.

        System.out.println("uploadpath는?  "+uploadPath);
        try {
            //파일업로드
            MultipartRequest multi = new MultipartRequest(req, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
            /*HttpServletRequest request = request 객체			
			String saveDirectory =저장될 서버 경로			
			int maxPostSize = 파일 최대 크기			
			String encoding = 인코딩 방식			
			FileRenamePolicy policy = 같은 이름의 파일명 방지 처리*/

            //파일 이름 초기화
            String fileName  = "";
            
            //파일 이름 가져오기
            Enumeration<String> names = multi.getFileNames();
           
            if(names.hasMoreElements()) {
                String name = names.nextElement();
                fileName = multi.getFilesystemName(name); //리네임 된 이름(숫자가 붙음) 실제 서버상 저장된 이름
              //  fileName = multi.getOriginalFileName(name); //오리지날 이름
            }
            
            
            
    		//session을 써서 서버 생성함.
    		HttpSession session = req.getSession();
    		// 세션에서 id값 가지고 있기. -> 이걸로 post_info의 mem_no를 넣어줄 것임.
    		String sessionId = (String) session.getAttribute("id");
            System.out.println("sessionId "+sessionId);
    		
    		post.setMEM_ID(sessionId);
    		//입력 목록 적어주기(vo에서 받아옴.)
    		post.setPOST_TITLE(multi.getParameter("title"));
//    		post.setPOST_THUMBNAIL(multi.getParameter("thumbnail"));
    		post.setPOST_THUMBNAIL(fileName);
    		post.setPOST_CONTENT(multi.getParameter("content"));
    		
    		
    		/*
    		POST 방식에서 request.getParameter()메서드를
			WAS에서 알아서 처리할 수 있도록 되어있는 이유는
			form에서 method가 POST방식일 때는 디폴트값으로
			enctype="application/x-www-form-urlencoded" 옵션이 설정 되어있기 때문에
			이를 WAS에서 인식하고 알아서 in/output방식으로 데이터를 처리하기 때문입니다.
			따라서. 이미지를 위해서 전송하는 경우 enctype가 Multipart로 설정해야하기 때문에
			request.getParameter()로 데이터를 불러올 수 없게 됩니다.
    		*/
    		
    		
    
    		PostInsertService postInsertService = new PostInsertService();
    		boolean result = postInsertService.insertPost(post); //vo에서 받은 변수 보내줌.
    		//게시글 저장이 잘 되었는지 여부
            
//         
            if(result) {
             //   forward.setRedirect(true);
             //   forward.setPath("myBlogAction.me");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return forward;
    }

		//---------------------------------------------		
		
		
//		//session을 써서 서버 생성함.
//		HttpSession session = req.getSession();
//		// 세션에서 id값 가지고 있기. -> 이걸로 post_info의 mem_no를 넣어줄 것임.
//		String sessionId = (String) session.getAttribute("id");
//		
//		post.setMEM_ID(sessionId);
//		//입력 목록 적어주기(vo에서 받아옴.)
//		post.setPOST_TITLE(req.getParameter("title"));
//		post.setPOST_THUMBNAIL(req.getParameter("thumbnail"));
//		post.setPOST_CONTENT(req.getParameter("content"));
//		
//
//		PostInsertService postInsertService = new PostInsertService();
//		postInsertService.insertPost(post); //vo에서 받은 변수 보내줌.
//		//게시글 저장이 잘 되었는지 여부
		
		//ajax 통신이라 서버에서 안먹히나? 왜 이게 안되지...
		
//		System.out.println(InsertResult);
//		if (InsertResult) { //게시글 저장 후 내 블로그로 이동
//
//			resp.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>");
//			out.println("alert('저장되었습니다.')");
//			out.println("location.href='./myBlogAction.me");
//			out.println("</script>");
//		} else { //게시글 저장 실패 시
//			resp.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = resp.getWriter(); //위에 있음
//			out.println("<script>");
//			out.println("alert('게시글 저장 실패')");
//			out.println("history.back()");
//			out.println("</script>");
//		}
		
//		return forward;
//	}

}
