package ezen.dev.spring.vo;

import java.sql.Date;

public class ReviewVo {
	
	private int re_idx;
	private String re_content;
	private int re_grade;
	private String re_image;
	private Date re_wdate;
	private String re_delyn;
	private String re_writer;
	private int m_idx;
	private int board_idx;
	
	
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public int getRe_grade() {
		return re_grade;
	}
	public void setRe_grade(int re_grade) {
		this.re_grade = re_grade;
	}
	public String getRe_image() {
		return re_image;
	}
	public void setRe_image(String re_image) {
		this.re_image = re_image;
	}
	public Date getRe_wdate() {
		return re_wdate;
	}
	public void setRe_wdate(Date re_wdate) {
		this.re_wdate = re_wdate;
	}
	public String getRe_delyn() {
		return re_delyn;
	}
	public void setRe_delyn(String re_delyn) {
		this.re_delyn = re_delyn;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	

}
