package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Actuator_Status_DAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	Actuator_Status_DTO dto = null;

	private void conn() {
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

	private void close() {
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

	public Actuator_Status_DTO GetActuatorStatus() {

		conn();
		try {
			String sql = "select * from actuator_status";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			if (rs.next()) {
				
				int act_feed = rs.getInt("act_feed");
				int act_door = rs.getInt("act_door");
				int act_absor = rs.getInt("act_absor");
				int act_aircon = rs.getInt("act_aircon");
				int act_pump = rs.getInt("act_pump");
				int act_boil = rs.getInt("act_boil");
				int act_humid = rs.getInt("act_humid");

				dto = new Actuator_Status_DTO(act_feed, act_door, act_absor, act_aircon, 
						act_pump, act_boil, act_humid);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;

	}

	public int SetActuatorStatus(Actuator_Status_DTO dto) {

		try {
			conn();
			
			String sql = "update actuator_status set " + "act_feed = ?," + "act_door = ?," + "act_absor = ?,"
					+ "act_aircon = ?," + "act_pump = ?," + "act_boil = ?," + "act_humid = ?" + "where ROWNUM = 1";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getAct_feed());
			psmt.setInt(2, dto.getAct_door());
			psmt.setInt(3, dto.getAct_absor());
			psmt.setInt(4, dto.getAct_aircon());
			psmt.setInt(5, dto.getAct_pump());
			psmt.setInt(6, dto.getAct_boil());
			psmt.setInt(7, dto.getAct_humid());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
