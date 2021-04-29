package com.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class C3p0Utils {
    private static DataSource dataSource=new ComboPooledDataSource();

    public static DataSource getDataSource() {
        return dataSource;
    }

    //从数据源得到连接
    public static Connection getConnection() throws SQLException,ClassNotFoundException{
        try {
            System.out.println("ok");
            return dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("服务器连接错误");
        }
    }
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
