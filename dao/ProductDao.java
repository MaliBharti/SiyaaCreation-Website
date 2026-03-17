package com.siyaa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.siyaa.model.Product;
import com.siyaa.util.DBConnection;

public class ProductDao {

    public boolean addProduct(Product product){

        boolean status=false;

        try(Connection con=DBConnection.getConnection()){

            String sql="INSERT INTO products(name,price,category,description,image) VALUES(?,?,?,?,?)";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setString(1,product.getName());
            ps.setDouble(2,product.getPrice());
            ps.setString(3,product.getCategory());
            ps.setString(4,product.getDescription());
            ps.setString(5,product.getImage());

            int rows=ps.executeUpdate();

            if(rows>0){
                status=true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    
    public List<Product> getAllProducts(){

        List<Product> list = new ArrayList<>();

        try(Connection con = DBConnection.getConnection()){

            String sql = "SELECT * FROM products";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Product p = new Product();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setCategory(rs.getString("category"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));

                list.add(p);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}