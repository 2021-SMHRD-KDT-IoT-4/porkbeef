package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Domestic_AnimalsDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	Domestic_AnimalDTO[] info = null;

	public void conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@211.107.188.204:1521:xe";
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

	public int update(Domestic_AnimalDTO dto) {
		try {
			String sql = "update domestic_animals product_cnt = ?, receving_date = ?, forwarding_date = ?, fir_vaccine = ?, sec_vaccine = ?, thr_vaccine = ?, enableGrade = ? where room = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getProduct_cnt());
			psmt.setString(2, dto.getReceving_date());
			psmt.setString(3, dto.getForwarding_date());
			psmt.setString(4, dto.getFir_vaccine());
			psmt.setString(5, dto.getSec_vaccine());
			psmt.setString(6, dto.getThr_vaccine());
			psmt.setInt(7, dto.getEnableGrade());
			psmt.setInt(8, dto.getRoom());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public Domestic_AnimalDTO[] getinfo(Domestic_AnimalDTO dto) {
		try {
			String sql = "select * from domestic_animals"; 
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cnt);
			rs = psmt.executeQuery();
			info = new Domestic_AnimalDTO[2];
			int i = 0;
			while (rs.next()) {
				int room = rs.getInt("room");
				int product_cnt = rs.getInt("product_cnt");
				String receving_date = rs.getString("receving_date");
				String forwarding_date = rs.getString("forwarding_date");
				String fir_vaccine = rs.getString("fir_vaccine");
				String sec_vaccine = rs.getString("sec_vaccine");
				String thr_vaccine = rs.getString("thr_vaccine");
				int enableGrade = rs.getInt("enableGrade");

				
				info[i] = new Domestic_AnimalDTO(room, product_cnt, receving_date, forwarding_date, fir_vaccine, sec_vaccine, thr_vaccine, enableGrade);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return info;

	}

}
