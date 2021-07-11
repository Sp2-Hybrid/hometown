package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "ServletRegister", value = "/ServletRegister")
public class ServletRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        String password = request.getParameter("password");
        String confirm = request.getParameter("repeatPassword");


        Connection con = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            if(password.equals(confirm)){
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hometown?rewriteBatchedStatement=true&serverTimezone=UTC&characterEncoding=UTF-8", "root", "songpeng123");
                String sql = "insert into user values ('"+email+"','"+name+"','"+password+"')";
                psmt = con.prepareStatement(sql);
                psmt.executeUpdate();

                response.sendRedirect("/hometown_war/login.jsp");
            }else{
                response.sendRedirect("/hometown_war/register.jsp");
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
    }
}
