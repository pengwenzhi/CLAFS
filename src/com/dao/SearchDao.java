package com.dao;

import com.model.Found;
import com.model.Lost;
import com.util.C3p0Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchDao {
    public ArrayList<Lost> searchLost(String sort,String start,String end,String address,String key) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Lost> list= new ArrayList<Lost>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from lost where state='寻找中' and sort=\'"+sort+"\' and lostday between \'"+start+"\' and \'"+end+"\' and address like \'%"+address+"%\' and detail like \'%"+key+"%\' or title like \'%"+key+"%\' order by pubtime desc";
            stat = conn.prepareStatement(sql);
            System.out.println(sql);
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

    public ArrayList<Lost> ssearchLost(String key) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Lost> list= new ArrayList<Lost>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from lost where state='寻找中' and detail like \'%"+key+"%\' or title like \'%"+key+"%\' or address like \'%"+key+"%\' or sort like \'%"+key+"%\' order by pubtime desc";
            stat = conn.prepareStatement(sql);
            System.out.println(sql);
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

    public ArrayList<Found> searchFound(String sort,String start,String end,String address,String key) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Found> list= new ArrayList<Found>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from found where state='归还中' and sort=\'"+sort+"\' and pickday between \'"+start+"\' and \'"+end+"\' and address like \'%"+address+"%\' and detail like \'%"+key+"%\' or title like\'%"+key+"%\' order by pubtime desc";
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

    public ArrayList<Found> ssearchFound(String key) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Found> list= new ArrayList<Found>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from found where state='归还中' and detail like \'%"+key+"%\' or title like \'%"+key+"%\' or address like \'%"+key+"%\' or sort like\'%"+key+"%\' order by pubtime desc";
            System.out.println(sql);
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
}
