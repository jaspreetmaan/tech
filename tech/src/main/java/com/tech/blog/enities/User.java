package com.tech.blog.enities;


import java.sql.*;


public class User { 
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private String profie;
	private Timestamp rdate;
	private Date dob;
	public User(int id, String name, String email, String password, String gender, String about,Date dob) {

		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.dob = dob;
	}
	
public User() {
	// TODO Auto-generated constructor stub
}

public User(String name, String email, String password, String gender, String about,Date dob) {
	super();
	this.name = name;
	this.email = email;
	this.password = password;
	this.gender = gender;
	this.about = about;
	this.dob = dob;
}
/* getters and setters */
public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getAbout() {
	return about;
}

public void setAbout(String about) {
	this.about = about;
}

public String getProfie() {
	return profie;
}

public void setProfie(String profie) {
	this.profie = profie;
}

public Timestamp getRdate() {
	return rdate;
}

public void setRdate(Timestamp rdate) {
	this.rdate = rdate;
}

public Date getDob() {
	return dob;
}

public void setDob(Date dob) {
	this.dob = dob;
}






	 
			 

}
