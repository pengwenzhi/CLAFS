package com.dao;

import com.model.Found;
import com.model.Lost;
import com.model.User;
import com.util.C3p0Utils;
import com.util.JDBCUtils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class FoundDao {
    /**
     * 保存拾物信息
     * @param found
     */
    public void insert(Found found) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        try {
            conn = C3p0Utils.getConnection();
            System.out.println(conn);
            String sql = "insert into found(id,username,title,sort,pickday,pubtime,address,photo,detail,state) value(null,?,?,?,?,?,?,?,?,?)";
            stat = conn.prepareStatement(sql);
            stat.setString(1,found.getUsername());
            stat.setString(2,found.getTitle());
            stat.setString(3,found.getSort());
            java.util.Date pickday = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(found.getPickday());
            java.sql.Timestamp date=new java.sql.Timestamp(pickday.getTime());
            stat.setTimestamp(4, date);
            Timestamp pt = new Timestamp(System.currentTimeMillis());
            stat.setTimestamp(5,pt);
            stat.setString(6,found.getAddress());
            stat.setString(7,found.getPhoto());
            stat.setString(8,found.getDetail());
            stat.setString(9,"归还中");
            stat.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(null, stat, conn);
        }
    }
    /**
     * 通过用户名查找拾物
     * @param username
     * @return found
     */
    public static Found findFoundByName(String username) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;

        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from found where username=\'"+username+"\' order by pubtime desc limit 0,1";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            if (rs.next()) {
                Found f = new Found();
                f.setId(rs.getInt("id"));
                f.setUsername(rs.getString("username"));
                f.setTitle(rs.getString("title"));
                f.setSort(rs.getString("sort"));
                f.setPickday(rs.getString("pickday"));
                f.setPubtime(rs.getString("pubtime"));
                f.setAddress(rs.getString("address"));
                f.setPhoto(rs.getString("photo"));
                f.setDetail(rs.getString("detail"));
                f.setState(rs.getString("state"));
                return f;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    /**
     * 通过用户名查找拾物
     * @param id
     * @return found
     */
    public static Found findFoundById(int id) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;

        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from found where id="+id;
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            if (rs.next()) {
                Found f = new Found();
                f.setId(rs.getInt("id"));
                f.setUsername(rs.getString("username"));
                f.setTitle(rs.getString("title"));
                f.setSort(rs.getString("sort"));
                f.setPickday(rs.getString("pickday"));
                f.setPubtime(rs.getString("pubtime"));
                f.setAddress(rs.getString("address"));
                f.setPhoto(rs.getString("photo"));
                f.setDetail(rs.getString("detail"));
                f.setState(rs.getString("state"));
                return f;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    public ArrayList<Found> findAllFoundByName(String username) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Found> list= new ArrayList<Found>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from found where username=\'"+username+"\' and state='归还中' order by pubtime desc";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Found f = new Found();
                f.setId(rs.getInt("id"));
                f.setUsername(rs.getString("username"));
                f.setTitle(rs.getString("title"));
                f.setSort(rs.getString("sort"));
                f.setPickday(rs.getString("pickday"));
                f.setPubtime(rs.getString("pubtime"));
                f.setAddress(rs.getString("address"));
                f.setPhoto(rs.getString("photo"));
                f.setDetail(rs.getString("detail"));
                f.setState(rs.getString("state"));
                list.add(f);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    public ArrayList<Found> findAllFound() throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Found> list= new ArrayList<Found>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from found where state='归还中' order by pubtime desc";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Found f = new Found();
                f.setId(rs.getInt("id"));
                f.setUsername(rs.getString("username"));
                f.setTitle(rs.getString("title"));
                f.setSort(rs.getString("sort"));
                f.setPickday(rs.getString("pickday"));
                f.setPubtime(rs.getString("pubtime"));
                f.setAddress(rs.getString("address"));
                f.setPhoto(rs.getString("photo"));
                f.setDetail(rs.getString("detail"));
                f.setState(rs.getString("state"));
                list.add(f);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    public ArrayList<Found> findAllFoundweek() throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Found> list= new ArrayList<Found>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from found where state='归还中' and pubtime>DATE_SUB(now(),INTERVAL 7 DAY)";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Found f = new Found();
                f.setId(rs.getInt("id"));
                f.setUsername(rs.getString("username"));
                f.setTitle(rs.getString("title"));
                f.setSort(rs.getString("sort"));
                f.setPickday(rs.getString("pickday"));
                f.setPubtime(rs.getString("pubtime"));
                f.setAddress(rs.getString("address"));
                f.setPhoto(rs.getString("photo"));
                f.setDetail(rs.getString("detail"));
                f.setState(rs.getString("state"));
                list.add(f);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    /**
     * 更新物品信息
     * @param objectid
     */
    public void updateState(int objectid) {
        Connection conn = null;
        PreparedStatement stat = null;
        try {
            conn = C3p0Utils.getConnection();

            String sql = "UPDATE found SET state=? WHERE id=?";
            stat = conn.prepareStatement(sql);
            System.out.println(sql);
            stat.setString(1,"已归还");
            stat.setInt(2,objectid);
            stat.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(null, stat, conn);
        }
    }
}
