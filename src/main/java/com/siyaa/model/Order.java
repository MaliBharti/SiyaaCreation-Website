package com.siyaa.model;

public class Order {

private int id;
private String name;
private String phone;
private String address;
private String city;
private String pincode;
private double total;

public Order(String name,String phone,String address,String city,String pincode,double total){

this.name=name;
this.phone=phone;
this.address=address;
this.city=city;
this.pincode=pincode;
this.total=total;

}

public String getName(){return name;}
public String getPhone(){return phone;}
public String getAddress(){return address;}
public String getCity(){return city;}
public String getPincode(){return pincode;}
public double getTotal(){return total;}

}