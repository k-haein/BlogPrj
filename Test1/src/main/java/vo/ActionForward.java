package vo;

public class ActionForward {
	//어딘가로 가라.
	private boolean isRedirect = false;
	//이동을 할지말지
	private String path = null;
	//어디로 갈지. 주소 저장
	
	/**여기다가 getter/setter 설정해주기 Source - Generate Getters and Setters...) **/
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

	
}