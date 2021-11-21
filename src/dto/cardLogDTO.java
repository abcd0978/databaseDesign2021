package dto;

public class cardLogDTO {
	//고객id
	private String user_id;
	//카드id
	private int card_id;
	//결제일자
	private String payment_date;
	//금액
	private int amount;
	//고유번호
	private int card_log_id;
	
	public cardLogDTO() {}
	
	public cardLogDTO(String user_id, int card_id, String payment_date, int amount, int card_log_id) {
		super();
		this.user_id = user_id;
		this.card_id = card_id;
		this.payment_date = payment_date;
		this.amount = amount;
		this.card_log_id = card_log_id;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCard_id() {
		return card_id;
	}
	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCard_log_id() {
		return card_log_id;
	}
	public void setCard_log_id(int card_log_id) {
		this.card_log_id = card_log_id;
	}
	@Override
	public String toString() {
		return "cardLogDTO [user_id=" + user_id + ", card_id=" + card_id + ", payment_date=" + payment_date
				+ ", amount=" + amount + ", card_log_id=" + card_log_id + "]";
	}
	
}
