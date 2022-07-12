package vo;

public class MemberBean {
	
	//사용할 변수들 선언
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_PW_cfm;
	
	
	//그 후 source > getter,setter
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	public String getMEMBER_PW_cfm() {
		return MEMBER_PW_cfm;
	}
	public void setMEMBER_PW_cfm(String mEMBER_PW_cfm) {
		MEMBER_PW_cfm = mEMBER_PW_cfm;
	}
	
	

}
