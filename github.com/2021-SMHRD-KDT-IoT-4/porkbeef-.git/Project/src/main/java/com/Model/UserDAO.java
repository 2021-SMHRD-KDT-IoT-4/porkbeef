package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	String Mb_id = null;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "pigManage";
			String db_pw = "pig";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int userJoin(MemberDTO dto) {
		conn();
		try {
			String sql = "insert into member values(?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMb_id());
			psmt.setString(2, dto.getMb_pw());
			psmt.setString(3, dto.getNickname());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public String userLogin(MemberDTO dto) {
		conn();
		try {
			String sql = "select id from member where id = ? and pw =?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMb_id());
			psmt.setString(2, dto.getMb_pw());

			rs = psmt.executeQuery();

			if (rs.next()) {
				Mb_id = rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return Mb_id;

	}
	public int userUpdate(MemberDTO dto) {
		conn();
		String sql = "update member set grade = ? where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getMb_id());
			psmt.setInt(1, dto.getMb_grade());

			rs = psmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int userDelete(MemberDTO dto) {
		conn();
		String sql = "delete member where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getMb_id());

			rs = psmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	
}
