package com.tech.blog.enities;

public class Likes {
private int lid;
private int uid;
private int pid;
public Likes() {

	// TODO Auto-generated constructor stub
}
public Likes(int lid, int uid, int pid) {
	super();
	this.lid = lid;
	this.uid = uid;
	this.pid = pid;
}
public int getLid() {
	return lid;
}
public void setLid(int lid) {
	this.lid = lid;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public Likes(int uid) {
	super();
	this.uid = uid;
}



}
