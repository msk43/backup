package member;

import java.time.LocalDate;

public class MemberBean {

    private String id;
    private String pwd;
    private String name;
    private String rrn1;
    private String rrn2;
    private String tel1;   // 전화번호1
    private String tel2;   // 전화번호2
    private String tel3;   // 전화번호3
    private String email;
    private String zipcode;
    private String address;		
    private String code;    // 사원번호
    private LocalDate timedate;

    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRrn1() {
        return rrn1;
    }

    public void setRrn1(String rrn1) {
        this.rrn1 = rrn1;
    }

    public String getRrn2() {
		return rrn2;
	}

	public void setRrn2(String rrn2) {
		this.rrn2 = rrn2;
	}

	public String getTel1() {
        return tel1;
    }

    public void setTel1(String tel1) {
        this.tel1 = tel1;
    }

    public String getTel2() {
        return tel2;
    }

    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }

    public String getTel3() {
        return tel3;
    }

    public void setTel3(String tel3) {
        this.tel3 = tel3;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

	public LocalDate getTimeDate() {
		return timedate;
	}

	public void setTmeDate(LocalDate timedate) {
		this.timedate = timedate;
	}
    
}
