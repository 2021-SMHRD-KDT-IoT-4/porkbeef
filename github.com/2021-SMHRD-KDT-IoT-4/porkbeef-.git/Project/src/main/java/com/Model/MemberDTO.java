package com.Model;

public class MemberDTO {
	
<<<<<<< HEAD
	private String mb_id; // ȸ�� ���̵�
	private String mb_pw; // ȸ�� ��й�ȣ
	private int mb_grade; // ȸ�� ���
	private String nick_name; // ȸ�� �г���

/////////////////////////////////////////////////////////////////////////////////////////

=======
	
	public MemberDTO(String mb_id, String mb_pw, int mb_grade, String nick_name) {
		super();
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_grade = mb_grade;
		this.nick_name = nick_name;
	}
	
	public MemberDTO(String mb_id, String mb_pw) {
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
	}
	
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-IoT-4/porkbeef-.git
	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public int getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(int mb_grade) {
		this.mb_grade = mb_grade;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

/////////////////////////////////////////////////////////////////////////////////////////

	public MemberDTO(String mb_id, String mb_pw, int mb_grade, String nick_name) {
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_grade = mb_grade;
		this.nick_name = nick_name;
	}
}