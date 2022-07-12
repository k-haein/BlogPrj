package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward; //그 후 vo에서 ActionForward를 가져옴.

public interface Action { //Action을 담당할 인터페이스
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception;

}