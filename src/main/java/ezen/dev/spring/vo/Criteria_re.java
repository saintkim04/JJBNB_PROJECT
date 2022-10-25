package ezen.dev.spring.vo;

public class Criteria_re {
	private int pageNum;
	
	private int amount;
	
	private String keyword;
	
	private int board_idx;


	/* 스킵 할 게시물 수( (pageNum-1) * amount ) */
    private int skip;
	
	public Criteria_re() {
		this(1,5);
		this.skip = 0;
	}
	
	 /* 생성자 => 원하는 pageNum, 원하는 amount */
    public Criteria_re(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
    }


	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (pageNum-1)*this.amount;
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", skip=" + skip + "]";
	}

	
	
	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	


	
	
	
}
