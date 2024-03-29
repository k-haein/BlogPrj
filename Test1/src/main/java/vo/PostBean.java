package vo;

public class PostBean {
	
	//사용할 변수들 선언
	private int POST_NO;
	private int MEM_NO;
	
	
	//블로그 게시글 네비에 표시하기 위해 추가
	private String MEM_ID;
	private String MEM_PIC;

	
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	public String getMEM_PIC() {
		return MEM_PIC;
	}
	public void setMEM_PIC(String mEM_PIC) {
		MEM_PIC = mEM_PIC;
	}
	
	
	
	private String POST_TITLE;
	private String POST_THUMBNAIL;
	private String POST_VIDEO;
	private String POST_CONTENT;
	private int visit_cnt;
	private String POST_UPLOADTIME;
	
	
	public int getPOST_NO() {
		return POST_NO;
	}
	public void setPOST_NO(int pOST_NO) {
		POST_NO = pOST_NO;
	}
	public int getMEM_NO() {
		return MEM_NO;
	}
	public void setMEM_NO(int mEM_NO) {
		MEM_NO = mEM_NO;
	}
	public String getPOST_TITLE() {
		return POST_TITLE;
	}
	public void setPOST_TITLE(String pOST_TITLE) {
		POST_TITLE = pOST_TITLE;
	}
	public String getPOST_THUMBNAIL() {
		return POST_THUMBNAIL;
	}
	public void setPOST_THUMBNAIL(String pOST_THUMBNAIL) {
		POST_THUMBNAIL = pOST_THUMBNAIL;
	}
	public String getPOST_VIDEO() {
		return POST_VIDEO;
	}
	public void setPOST_VIDEO(String pOST_VIDEO) {
		POST_VIDEO = pOST_VIDEO;
	}
	public String getPOST_CONTENT() {
		return POST_CONTENT;
	}
	public void setPOST_CONTENT(String pOST_CONTENT) {
		POST_CONTENT = pOST_CONTENT;
	}
	public int getVisit_cnt() {
		return visit_cnt;
	}
	public void setVisit_cnt(int visit_cnt) {
		this.visit_cnt = visit_cnt;
	}
	public String getPOST_UPLOADTIME() {
		return POST_UPLOADTIME;
	}
	public void setPOST_UPLOADTIME(String pOST_UPLOADTIME) {
		POST_UPLOADTIME = pOST_UPLOADTIME;
	}
	
	//그 후 source > getter,setter
	

}
