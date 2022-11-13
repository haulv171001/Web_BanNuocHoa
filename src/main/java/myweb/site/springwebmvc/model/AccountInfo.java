package myweb.site.springwebmvc.model;

public class AccountInfo {
	private String userName;
	private String password;
	private boolean active = true;
	private String userRole = "EMPLOYEE";
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public AccountInfo(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	
	

}
