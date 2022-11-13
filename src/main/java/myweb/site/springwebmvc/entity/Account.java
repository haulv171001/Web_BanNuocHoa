package myweb.site.springwebmvc.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Accounts")
public class Account implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3059154537061802754L;
	public Account() {
	}
	public static final String ROLE_MANAGER = "MANAGER";
	public static final String ROLE_EMPLOYEE = "EMPLOYEE";
	private String userName;
	private String password;
	private boolean active;
	private String userRole;
	
	@Id
	@Column(name = "User_Name",length = 20,nullable = false)
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Column(name = "Password", length = 20, nullable = false)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name = "Active", length = 1, nullable = false)
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	@Column(name = "User_Role", length = 20, nullable = false)
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public static String getRoleManager() {
		return ROLE_MANAGER;
	}
	public static String getRoleEmployee() {
		return ROLE_EMPLOYEE;
	}
	@Override
	public String toString() {
		return "Account [userName=" + userName + ", password=" + password + ", active=" + active + ", userRole="
				+ userRole + "]";
	}
	
	
	 
}
