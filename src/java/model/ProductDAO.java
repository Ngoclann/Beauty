/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ngọc Lan
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductbyType(String type) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.*, pt.tname\n"
                + "from ProductType pt inner join Products p on pt.tid = p.typeid\n"
                + "where tname =?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, type);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> searchProduct(String type, String search, String brand, String price) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.*, pt.tname,a.bname\n"
                + "from ProductType pt inner join Products p on pt.tid = p.typeid\n"
                + "inner join Brands a on a.bname = p.brand\n"
                + "where 1=1";
        if (type != null && !type.equalsIgnoreCase("All Products") && !type.equalsIgnoreCase("all")) {
            sql += " and tname = '" + type + "'";
        }
        if (search != null) {
            sql += " and pname like '%" + search + "%'";
        }
        if (brand != null && !brand.equalsIgnoreCase("all")) {
            sql += " and a.bname = '" + brand + "'";
        }
        if (price.equalsIgnoreCase("<20")) {
            sql += " and price < 20";
        } else if (price.equalsIgnoreCase("20-30")) {
            sql += " and price>=20 and price<30";
        } else if (price.equalsIgnoreCase("30-50")) {
            sql += " and price >=30 and price < 50";
        } else if (price.equalsIgnoreCase(">=50")) {
            sql += " and price >= 50";
        } else {
            sql += " and 2=2";
        }
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductbyID(String id) {
        Product p = null;
        String sql = "select* from Products where pid = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7));
            }
        } catch (SQLException e) {
        }
        return p;
    }

    //get the most bought product
    public List<Product> getTopProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 6 o.pid,pname,sum(o.quantity) as totalQuantity,image,price,stock\n"
                + "from Orders o inner join Products p on o.pid = p.pid \n"
                + "group by o.pid,pname,image,stock,price\n"
                + "order by sum(o.quantity) desc";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(4), rs.getDouble(5), rs.getInt(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByPage(List<Product> list, int start, int end) {
        List<Product> paging = new ArrayList<>();
        for (int i = start; i < end; i++) {
            paging.add(list.get(i));
        }
        return paging;
    }

    public int getProductStock(String typeID) {
        String sql = "select COUNT(tname)\n"
                + "from Products p inner join ProductType pt on pt.tid = p.typeid\n"
                + "where typeid = ? ";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, typeID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void updateProduct(Product p) {
        String sql = "update Products\n"
                + "set pname = ?,typeid = ?,brand = ?,image = ?,price = ?,stock = ?\n"
                + "where pid = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getPname());
            st.setString(2, p.getTypeid());
            st.setString(3, p.getBrand());
            st.setString(4, p.getImage());
            st.setDouble(5, p.getPrice());
            st.setInt(6, p.getStock());
            st.setString(7, p.getPid());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void removeProduct(String id) {
        String sql = "delete from Products where pid = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void insertProduct(Product p){
        String sql = "insert into Products values (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getPid());
            st.setString(2, p.getPname());
            st.setString(3, p.getTypeid());
            st.setString(4, p.getBrand());
            st.setString(5, p.getImage());
            st.setDouble(6, p.getPrice());
            st.setInt(7, p.getStock());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

}
