package com.util;

import java.sql.*;

public class JDBCUtils {

    //2.获取数据库连接（Connection 发送sql的桥梁）
    public static Connection getConnection() throws SQLException,ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/laf";
        String username="root";
        String password="pwz19980311";
        Connection conn= DriverManager.getConnection(url,username,password);
        return conn;
    }

    //4.释放资源
    public static void release(ResultSet rs, Statement stat, Connection conn) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (stat != null) {
            try {
                stat.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (conn != null){
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
