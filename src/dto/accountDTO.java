package dto;

public class accountDTO 
{
	//계좌번호
	private int account_id;
	//계좌타입 ex)적금,예금 등등
	private int type;
	//잔고
	private int balance;
	//카드신청여부
	private boolean is_request;
	//계좌개설 일자
	private String open_date;
	//고객주민번호
	private String user_id;
	
	
	//default generator
	public accountDTO() {}
	public accountDTO(int account_id, int type, int balance, boolean is_request, String open_date, String user_id) {
		this.account_id = account_id;
		this.type = type;
		this.balance = balance;
		this.is_request = is_request;
		this.open_date = open_date;
		this.user_id = user_id;
	}
	//getters, setters
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public boolean isIs_request() {
		return is_request;
	}
	public void setIs_request(boolean is_request) {
		this.is_request = is_request;
	}
	public String getOpen_date() {
		return open_date;
	}
	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String toString() {
		return "accountDTO [account_id=" + account_id + ", type=" + type + ", balance=" + balance + ", is_request="
				+ is_request + ", open_date=" + open_date + ", user_id=" + user_id + "]";
	}
	
}
