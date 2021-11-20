package dto;

public class accountLogDTO {
	//고유번호
	private String account_log_id;
	//일자
	private String date;
	//입출금후 잔고
	private int amount;
	//입금 or출금
	private boolean type;
	//입출금 메세지
	private String info;
	//계좌번호
	private int account_id;
	
	
	public accountLogDTO() {}
	public accountLogDTO(String account_log_id, String date, int amount, boolean type, String info, int account_id) {
		super();
		this.account_log_id = account_log_id;
		this.date = date;
		this.amount = amount;
		this.type = type;
		this.info = info;
		this.account_id = account_id;
	}
	//getter, setter
	public String getAccount_log_id() {
		return account_log_id;
	}
	public void setAccount_log_id(String account_log_id) {
		this.account_log_id = account_log_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public boolean isType() {
		return type;
	}
	public void setType(boolean type) {
		this.type = type;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	//toString
	public String toString() {
		return "accountLogDTO [account_log_id=" + account_log_id + ", date=" + date + ", amount=" + amount + ", type="
				+ type + ", info=" + info + ", account_id=" + account_id + "]";
	}
}
