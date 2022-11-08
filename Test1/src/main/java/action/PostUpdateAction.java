package action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        String uploadPath = req.getServletContext().getRealPath("/resources/img/thumbnail");
        		
        //git 링크는 이렇지만 실제 소스 경로는 위와 같다.
        //"C:\\Users\\User\\git\\BlogPrj\\Test1\\WebContent\\resources\\img\\thumbnail";
        
        System.out.println("업데이트 할 uploadpath는?  "+uploadPath);
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
            
    		//postEditAction에서 유저가 작성자인지 한번 거르고 이리로 넘어옴.
    		
        		int postNo = Integer.parseInt(multi.getParameter("postno"));
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
    		
	     } catch (Exception e) {
	        e.printStackTrace();
	     }
	        return forward;
    }

}
