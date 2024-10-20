package ems.teamtrackr.root.teamtrackrapi.empdata;

import com.google.cloud.Date;

public class Employee_Info {
	
	String firstName;
	String lastName;
	String userName;
	String emailId;
	String password;
	int    employeeId;
	Date   joiningDate;
	int    phoneNumber;
	String companyName;
	String departmentName;
	String Designation;
	
	public Employee_Info()
	{
	super();	
	}
	
	public Employee_Info(String firstName, String lastName, String userName, String emailId, String password,
			int employeeId, Date joiningDate, int phoneNumber, String companyName, String departmentName,
			String designation) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.emailId = emailId;
		this.password = password;
		this.employeeId = employeeId;
		this.joiningDate = joiningDate;
		this.phoneNumber = phoneNumber;
		this.companyName = companyName;
		this.departmentName = departmentName;
		Designation = designation;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public Date getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getDesignation() {
		return Designation;
	}
	public void setDesignation(String designation) {
		Designation = designation;
	}
	
	
}
