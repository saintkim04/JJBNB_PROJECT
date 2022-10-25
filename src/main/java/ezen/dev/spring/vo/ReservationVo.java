package ezen.dev.spring.vo;

import java.util.Date;

public class ReservationVo {
	private int r_idx;
	private int board_idx;
	private String r_sdate;
	private String r_edate;
	private int r_cost;
	private String r_name;
	private String r_tell;
	private int m_idx;
	private String origin_filename1;
	private String title;
	
	public String getOrigin_filename1() {
		return origin_filename1;
	}
	public void setOrigin_filename1(String origin_filename1) {
		this.origin_filename1 = origin_filename1;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getR_sdate() {
		return r_sdate;
	}
	public void setR_sdate(String r_sdate) {
		this.r_sdate = r_sdate;
	}
	public String getR_edate() {
		return r_edate;
	}
	public void setR_edate(String r_edate) {
		this.r_edate = r_edate;
	}
	public int getR_cost() {
		return r_cost;
	}
	public void setR_cost(int r_cost) {
		this.r_cost = r_cost;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_tell() {
		return r_tell;
	}
	public void setR_tell(String r_tell) {
		this.r_tell = r_tell;
	}
}
