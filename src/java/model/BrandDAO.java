/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import entity.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Ngọc Lan
 */
public class BrandDAO extends DBContext{
    public List<Brand> getAllBrands(){
        List<Brand> list = new ArrayList<>();
        String sql = "select* from Brands";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new Brand(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
