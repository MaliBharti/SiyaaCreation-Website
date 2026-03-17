package com.siyaa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.siyaa.model.Customer;
import com.siyaa.util.DBConnection;

public class CustomerDao {

    public boolean registerCustomer(Customer customer) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "INSERT INTO customers (name, email, phone, password) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getPassword());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public Customer getCustomerByEmail(String email) {

        Customer customer = null;

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM customers WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customer;
    }
}