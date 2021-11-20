package dto;

public class cardDTO {
	//카드고유번호
	private int card_id;
	//발급일자
	private String issue_date;
	//한도
	private int limit;
	//카드종류
	private String type;
	//예금계좌
	private int account_id;
	
	
	//default generator
	public cardDTO() {}
	public cardDTO(int card_id, String issue_date, int limit, String type, int account_id) {
		this.card_id = card_id;
		this.issue_date = issue_date;
		this.limit = limit;
		this.type = type;
		this.account_id = account_id;
	}
	//getter, setter
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
	public String getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(String issue_date) {
		this.issue_date = issue_date;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	//toString
	public String toString() {
		return "cardDTO [card_id=" + card_id + ", issue_date=" + issue_date + ", limit=" + limit + ", type=" + type
				+ ", account_id=" + account_id + "]";
	}
	
}
