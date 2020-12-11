/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ngọc Lan
 */
public class AdminDAO extends DBContext{
    public Admin getAdmin(String user, String pass){
        Admin a = null;
        String sql = "select * from Admins where username = ? and password = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = new Admin(user, pass);
            }
        } catch (SQLException e) {
        }
        return a;
    }
}
