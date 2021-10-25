package model.bean;

public class Account {
	private String username;
	private String pass;
	private String email;
	private String phone;
	private String name;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Account() {
	}

	public Account(String username,String pass,String email,String phone,String name) {
		this.username = username;
		this.pass =pass;
		this.email =email;
		this.phone = phone;
		this.name = name;
	}
}
