package com.dao;

import com.model.Lost;
import com.util.C3p0Utils;
import com.util.JDBCUtils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class LostDao {
    public void insert(Lost lost) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        try {
            conn = C3p0Utils.getConnection();
            System.out.println(conn);
            String sql = "insert into lost(id,username,title,sort,lostday,pubtime,address,photo,detail,state) value(null,?,?,?,?,?,?,?,?,?)";
            stat = conn.prepareStatement(sql);
            stat.setString(1,lost.getUsername());
            stat.setString(2,lost.getTitle());
            stat.setString(3,lost.getSort());
            java.util.Date lostday = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(lost.getLostday());
            java.sql.Timestamp date=new java.sql.Timestamp(lostday.getTime());
            Timestamp pt = new Timestamp(System.currentTimeMillis());
            stat.setTimestamp(4, date);
            System.out.println(pt);
            stat.setTimestamp(5,pt);
            stat.setString(6,lost.getAddress());
            stat.setString(7,lost.getPhoto());
            stat.setString(8,lost.getDetail());
            stat.setString(9,"寻找中");
            stat.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(null, stat, conn);
        }
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

            String sql = "UPDATE lost SET state=? WHERE id=?";
            stat = conn.prepareStatement(sql);
            System.out.println(sql);
            stat.setString(1,"已找回");
            stat.setInt(2,objectid);
            stat.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(null, stat, conn);
        }
    }

    /**
     * 通过用户名查找失物
     * @param username
     * @return lost
     */
    public static Lost findLostByName(String username) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;

        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from lost where username=\'"+username+"\' order by pubtime desc limit 0,1";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            if (rs.next()) {
                Lost l = new Lost();
                l.setId(rs.getInt("id"));
                l.setUsername(rs.getString("username"));
                l.setTitle(rs.getString("title"));
                l.setSort(rs.getString("sort"));
                l.setLostday(rs.getString("lostday"));
                l.setPubtime(rs.getString("pubtime"));
                l.setAddress(rs.getString("address"));
                l.setPhoto(rs.getString("photo"));
                l.setDetail(rs.getString("detail"));
                l.setState(rs.getString("state"));
                return l;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    /**
     * 通过id查找失物
     * @param id
     * @return lost
     */
    public static Lost findLostById(int id) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;

        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from lost where id="+id;
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            if (rs.next()) {
                Lost l = new Lost();
                l.setId(rs.getInt("id"));
                l.setUsername(rs.getString("username"));
                l.setTitle(rs.getString("title"));
                l.setSort(rs.getString("sort"));
                l.setLostday(rs.getString("lostday"));
                l.setPubtime(rs.getString("pubtime"));
                l.setAddress(rs.getString("address"));
                l.setPhoto(rs.getString("photo"));
                l.setDetail(rs.getString("detail"));
                l.setState(rs.getString("state"));
                return l;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    public ArrayList<Lost> findAllLostByName(String username) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Lost> list= new ArrayList<Lost>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from lost where username=\'"+username+"\' and state='寻找中' order by pubtime desc";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Lost l = new Lost();
                l.setId(rs.getInt("id"));
                l.setUsername(rs.getString("username"));
                l.setTitle(rs.getString("title"));
                l.setSort(rs.getString("sort"));
                l.setLostday(rs.getString("lostday"));
                l.setPubtime(rs.getString("pubtime"));
                l.setAddress(rs.getString("address"));
                l.setPhoto(rs.getString("photo"));
                l.setDetail(rs.getString("detail"));
                l.setState(rs.getString("state"));
                list.add(l);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    public ArrayList<Lost> findAllLost() throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Lost> list= new ArrayList<Lost>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from lost where state='寻找中' order by pubtime desc";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Lost l = new Lost();
                l.setId(rs.getInt("id"));
                l.setUsername(rs.getString("username"));
                l.setTitle(rs.getString("title"));
                l.setSort(rs.getString("sort"));
                l.setLostday(rs.getString("lostday"));
                l.setPubtime(rs.getString("pubtime"));
                l.setAddress(rs.getString("address"));
                l.setPhoto(rs.getString("photo"));
                l.setDetail(rs.getString("detail"));
                l.setState(rs.getString("state"));
                list.add(l);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    public ArrayList<Lost> findAllLostweek() throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Lost> list= new ArrayList<Lost>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from lost where state='寻找中' and pubtime>DATE_SUB(now(),INTERVAL 7 DAY)";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Lost l = new Lost();
                l.setId(rs.getInt("id"));
                l.setUsername(rs.getString("username"));
                l.setTitle(rs.getString("title"));
                l.setSort(rs.getString("sort"));
                l.setLostday(rs.getString("lostday"));
                l.setPubtime(rs.getString("pubtime"));
                l.setAddress(rs.getString("address"));
                l.setPhoto(rs.getString("photo"));
                l.setDetail(rs.getString("detail"));
                l.setState(rs.getString("state"));
                list.add(l);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(rs, stat, conn);
        }
        return null;
    }

    public ArrayList<Lost> findAllLosted() throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Lost> list= new ArrayList<Lost>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from lost where state='已找回' order by pubtime desc";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Lost l = new Lost();
                l.setId(rs.getInt("id"));
                l.setUsername(rs.getString("username"));
                l.setTitle(rs.getString("title"));
                l.setSort(rs.getString("sort"));
                l.setLostday(rs.getString("lostday"));
                l.setPubtime(rs.getString("pubtime"));
                l.setAddress(rs.getString("address"));
                l.setPhoto(rs.getString("photo"));
                l.setDetail(rs.getString("detail"));
                l.setState(rs.getString("state"));
                list.add(l);
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
