package com.dao;

import com.model.Lost;
import com.model.User;
import com.util.C3p0Utils;
import com.util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {
    /**
     * 登录
     * @param user
     */
    public static User login(Connection conn, User user) throws SQLException {
        User resultUser=null;
        String sql="select * from user where username=? and password=? and role=?";
        PreparedStatement stmt=conn.prepareStatement(sql);
        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getPassword());
        stmt.setString(3,user.getRole());
        ResultSet rs=stmt.executeQuery();
        if(rs.next()){
            resultUser=new User();
            resultUser.setUsername(rs.getString("username"));
            resultUser.setPassword(rs.getString("password"));
        }
        return resultUser;
    }

    /**
     * 保存用户信息，注册
     * @param user
     */
    public void insert(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        try {
            conn = C3p0Utils.getConnection();
            System.out.println(conn);
            String sql = "insert into user(username,realname,password,gender,email,qq,tel,address,role) value(?,?,?,?,?,?,?,?,?)";
            stat = conn.prepareStatement(sql);
            stat.setString(1,user.getUsername());
            stat.setString(2,user.getRealname());
            stat.setString(3,user.getPassword());
            stat.setString(4,user.getGender());
            stat.setString(5,user.getEmail());
            stat.setString(6,user.getQq());
            stat.setString(7,user.getTel());
            stat.setString(8,user.getAddress());
            stat.setString(9,user.getRole());
            stat.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(null, stat, conn);
        }
    }
    /**
     * 通过用户名查找用户
     * @param username
     * @return
     */
    public static User findUserByName(String username) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;

        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from user where username=?";
            stat = conn.prepareStatement(sql);
            stat.setString(1, username);

            rs = stat.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setRealname(rs.getString("realname"));
                u.setPassword(rs.getString("password"));
                u.setGender(rs.getString("gender"));
                u.setEmail(rs.getString("email"));
                u.setQq(rs.getString("qq"));
                u.setTel(rs.getString("tel"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }
    /**
     * 所有查找用户
     * @param
     * @return list
     */
    public ArrayList<User> findAllUser() throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<User> list= new ArrayList<User>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from user where role='普通用户'";
            stat = conn.prepareStatement(sql);
            System.out.println(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                User u=new User();
                u.setUsername(rs.getString("username"));
                u.setRealname(rs.getString("realname"));
                u.setPassword(rs.getString("password"));
                u.setGender(rs.getString("gender"));
                u.setEmail(rs.getString("email"));
                u.setQq(rs.getString("qq"));
                u.setTel(rs.getString("tel"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                list.add(u);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }
}
