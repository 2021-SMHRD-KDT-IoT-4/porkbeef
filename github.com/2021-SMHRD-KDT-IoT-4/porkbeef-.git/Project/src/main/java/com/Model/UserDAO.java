package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	MemberDTO dto = null;
	private ArrayList<MemberDTO> dtos = null;


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
			psmt.setString(3, dto.getNick_name());
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public MemberDTO userLogin(MemberDTO dto) {
		conn();
		try {
			String sql = "select * from member where mb_id = ? and mb_pw =?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMb_id());
			psmt.setString(2, dto.getMb_pw());

			rs = psmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("mb_id");
				String pw = rs.getString("mb_pw");
				int grade = Integer.parseInt(rs.getString("grade"));
				String nick = rs.getString("nick_name");
				dto = new MemberDTO(id, pw, grade, nick);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;

	}

	public int userUpdate(MemberDTO dto) {
		conn();
		String sql = "update member set grade = ? where mb_id = ?";
		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMb_id());
			psmt.setInt(1, dto.getMb_grade());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int userDelete(MemberDTO dto) {
		conn();
		String sql = "delete member where mb_id = ?";
		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMb_id());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<MemberDTO> getAllMember(){
		dtos = new ArrayList<MemberDTO>();
		
		conn();
		try {
			String sql = "select * from member";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("mb_id");
				String pw = rs.getString("mb_pw");
				int grade = Integer.parseInt(rs.getString("grade"));
				String nick = rs.getString("nick_name");
				dto = new MemberDTO(id, pw, grade, nick);
				dtos.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dtos;
	}

}
