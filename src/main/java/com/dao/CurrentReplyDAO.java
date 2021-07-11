package com.dao;

import com.entity.CurrentReply;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CurrentReplyDAO {
    public List readCurrentReply() {
        List<CurrentReply> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hometown?rewriteBatchedStatement=true&serverTimezone=UTC&characterEncoding=UTF-8", "root", "songpeng123");
            String sql = "select * from CurrentReply";
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                CurrentReply currentReply = new CurrentReply(id);
                list.add(currentReply);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (psmt != null) {
                    psmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public void setCurrentReply(int id){
        Connection con = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hometown?rewriteBatchedStatement=true&serverTimezone=UTC&characterEncoding=UTF-8", "root", "songpeng123");
            String sql = "update currentreply " +
                    "set id = "+id;
//            System.out.println(sql);
            psmt = con.prepareStatement(sql);
            psmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (psmt != null) {
                    psmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public static void main(String[] args) {
        System.out.println(new CurrentReplyDAO().readCurrentReply());
    }
}
