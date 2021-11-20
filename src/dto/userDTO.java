package dto;

public class userDTO 
{
	//주민번호
	private String user_id;
	//이름
	private String name;
	//주소
	private String address;
	//생일
	private String birth;
	//이매일
	private String email;
	//전화번호
	private String phone;
	//직업
	private String job;
	//직원or고객
	private boolean is_client;
	//비번
	private String password;
	

	//default generator
	public userDTO() {}
	public userDTO(String user_id, String name, String address, String birth, String email, String phone,
			String job, boolean is_client,String password) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.address = address;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.job = job;
		this.is_client = is_client;
		this.password = password;
	}

	//getters, setters
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isIs_client() {
		return is_client;
	}
	public void setIs_client(boolean is_client) {
		this.is_client = is_client;
	}
	//toString
	public String toString() {
		return "userDTO [user_id=" + user_id + ", name=" + name + ", adress=" + address + ", birthday=" + birth
				+ ", email=" + email + ", phone_num=" + phone + ", job=" + job + ", type=" + is_client + "]";
	}
}
