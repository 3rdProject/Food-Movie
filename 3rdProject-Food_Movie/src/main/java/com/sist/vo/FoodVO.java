package com.sist.vo;
/*
 *  NO       NOT NULL NUMBER         
	RNO               NUMBER         
	POSTER            VARCHAR2(4000) 
	RNAME    NOT NULL VARCHAR2(300)  
	SCORE             NUMBER(2,1)    
	ADDR              VARCHAR2(1000) 
	TEL               VARCHAR2(20)   
	RTYPE    NOT NULL VARCHAR2(100)  
	PRICE             VARCHAR2(100)  
	PARKING           VARCHAR2(100)  
	OPENHOUR          VARCHAR2(500)  
	MENU              VARCHAR2(4000) 
	GOOD              NUMBER         
	SOSO              NUMBER         
	BAD               NUMBER         
	RTAG              VARCHAR2(1000) 

 */
public class FoodVO {
	private int no,rno;
	private String poster,rname;
	private double score;
	private String addr,tel,rtype,price,parking,openhour,menu;
	private int good,soso,bad;
	private String rtag;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getOpenhour() {
		return openhour;
	}
	public void setOpenhousr(String openhour) {
		this.openhour = openhour;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getSoso() {
		return soso;
	}
	public void setSoso(int soso) {
		this.soso = soso;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getRtag() {
		return rtag;
	}
	public void setRtag(String rtag) {
		this.rtag = rtag;
	}
	
	
}
