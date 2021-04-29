package com.dao;

import com.model.Record;
import com.util.C3p0Utils;

import java.sql.*;
import java.util.ArrayList;

public class RecordDao {
    /**
     * 保存失物去向
     * @param record
     */
    public void lrinsert(Record record) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        try {
            conn = C3p0Utils.getConnection();
            System.out.println(conn);
            String sql = "insert into record(objectid,username,title,sort,photo,state,pubtime,applyname,applytel,applyaddress) value(?,?,?,?,?,?,?,?,?,?)";
            stat = conn.prepareStatement(sql);
            stat.setInt(1,record.getObjectid());
            stat.setString(2,record.getUsername());
            stat.setString(3,record.getTitle());
            stat.setString(4,record.getSort());
            stat.setString(5,record.getPhoto());
            stat.setString(6,"已找回");
            Timestamp pt = new Timestamp(System.currentTimeMillis());
            stat.setTimestamp(7,pt);
            stat.setString(8,record.getApplyname());
            stat.setString(9,record.getApplytel());
            stat.setString(10,record.getApplyaddress());
            stat.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(null, stat, conn);
        }
    }

    /**
     * 保存拾物去向
     * @param record
     */
    public void frinsert(Record record) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        try {
            conn = C3p0Utils.getConnection();
            System.out.println(conn);
            String sql = "insert into record(objectid,username,title,sort,photo,state,pubtime,applyname,applytel,applyaddress) value(?,?,?,?,?,?,?,?,?,?)";
            stat = conn.prepareStatement(sql);
            stat.setInt(1,record.getObjectid());
            stat.setString(2,record.getUsername());
            stat.setString(3,record.getTitle());
            stat.setString(4,record.getSort());
            stat.setString(5,record.getPhoto());
            stat.setString(6,"已归还");
            Timestamp pt = new Timestamp(System.currentTimeMillis());
            stat.setTimestamp(7,pt);
            stat.setString(8,record.getApplyname());
            stat.setString(9,record.getApplytel());
            stat.setString(10,record.getApplyaddress());
            stat.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(null, stat, conn);
        }
    }

    public ArrayList<Record> findAllRecordByName(String username) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Record> list= new ArrayList<Record>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from record where username=\'"+username+"\' order by pubtime desc";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Record r = new Record();
                r.setObjectid(rs.getInt("objectid"));
                r.setUsername(rs.getString("username"));
                r.setTitle(rs.getString("title"));
                r.setSort(rs.getString("sort"));
                r.setPhoto(rs.getString("photo"));
                r.setState(rs.getString("state"));
                r.setPubtime(rs.getString("pubtime"));
                r.setApplyname(rs.getString("applyname"));
                r.setApplytel(rs.getString("applytel"));
                r.setApplyaddress(rs.getString("applyaddress"));
                list.add(r);
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
