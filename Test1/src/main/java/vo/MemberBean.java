package vo;

public class MemberBean {
	
	//사용할 변수들 선언
	private int MEM_NO;
	
	
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_NAME;
	private String MEMBER_BIR_YY;
	private String MEMBER_BIR_MM;
	private String MEMBER_BIR_DD;
	private String MEMBER_GENDER;
	private String MEMBER_MAIL;
	private String MEMBER_PHONE;
	
	
	//그 후 source > getter,setter
	
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public int getMEM_NO() {
		return MEM_NO;
	}
	public void setMEM_NO(int mEM_NO) {
		MEM_NO = mEM_NO;
		
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

	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	
	public String getMEMBER_BIR_YY() {
		return MEMBER_BIR_YY;
	}
	public void setMEMBER_BIR_YY(String mEMBER_BIR_YY) {
		MEMBER_BIR_YY = mEMBER_BIR_YY;
	}
	public String getMEMBER_BIR_MM() {
		return MEMBER_BIR_MM;
	}
	public void setMEMBER_BIR_MM(String mEMBER_BIR_MM) {
		MEMBER_BIR_MM = mEMBER_BIR_MM;
	}
	public String getMEMBER_BIR_DD() {
		return MEMBER_BIR_DD;
	}
	public void setMEMBER_BIR_DD(String mEMBER_BIR_DD) {
		MEMBER_BIR_DD = mEMBER_BIR_DD;
	}
	public String getMEMBER_GENDER() {
		return MEMBER_GENDER;
	}
	public void setMEMBER_GENDER(String mEMBER_GENDER) {
		MEMBER_GENDER = mEMBER_GENDER;
	}
	public String getMEMBER_MAIL() {
		return MEMBER_MAIL;
	}
	public void setMEMBER_MAIL(String mEMBER_MAIL) {
		MEMBER_MAIL = mEMBER_MAIL;
	}
	public String getMEMBER_PHONE() {
		return MEMBER_PHONE;
	}
	public void setMEMBER_PHONE(String mEMBER_PHONE) {
		MEMBER_PHONE = mEMBER_PHONE;
	}
	
	

}
