package com.dao;

import com.model.Comment;
import com.model.Found;
import com.util.C3p0Utils;

import java.sql.*;
import java.util.ArrayList;

public class CommentDao {
    /**
     * 保存拾物信息
     * @param comment
     */
    public void insert(Comment comment) throws SQLException {
        Connection conn = null;
        PreparedStatement stat = null;
        try {
            conn = C3p0Utils.getConnection();
            System.out.println(conn);
            String sql = "insert into comment(id,objectid,username,visitor,content,pubtime) value(null,?,?,?,?,?)";
            stat = conn.prepareStatement(sql);
            stat.setInt(1,comment.getObjectid());
            stat.setString(2,comment.getUsername());
            stat.setString(3,comment.getVisitor());
            stat.setString(4,comment.getContent());
            Timestamp pt = new Timestamp(System.currentTimeMillis());
            stat.setTimestamp(5,pt);
            stat.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0Utils.release(null, stat, conn);
        }
    }

    public ArrayList<Comment> findAllCommentByName(int objectid) throws SQLException{
        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;
        ArrayList<Comment> list= new ArrayList<Comment>();
        try {
            //3.获取连接后发送sql语句访问数据库
            conn = C3p0Utils.getConnection();
            String sql = "select * from comment where objectid="+objectid+" order by pubtime desc";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Comment c=new Comment();
                c.setId(rs.getInt("id"));
                c.setObjectid(rs.getInt("objectid"));
                c.setUsername(rs.getString("username"));
                c.setVisitor(rs.getString("visitor"));
                c.setContent(rs.getString("content"));
                c.setPubtime(rs.getString("pubtime"));
                list.add(c);
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
