package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Automatic_Control_DAO {

	private Connection connetion = null;
	private PreparedStatement prepar_statement = null;
	private ResultSet result_set = null;
	private int state_Check = 0; // 성공여부 체크
	

	private Automatic_Control_DTO automatic_DTO = null;
	
	public void Automatic_Connetion() {

		String ip_number = "211.107.188.204";
		String port_number = "1521";
		String nick_name = "xe";
		String oracle_id = "pigManage";
		String oracle_password = "pig";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String path = "jdbc:oracle:thin:@" + ip_number + ":" + port_number + ":" + nick_name;

			connetion = DriverManager.getConnection(path, oracle_id, oracle_password);

		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Connetion ClassNotFoundException에러");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Connetion SQLException 에러");
		}
	}

	public int Automatic_SUpdate(Automatic_Control_DTO automatic_dto) {

		state_Check = 0;

		try {
			Automatic_Connetion();

			String sql = "update AUTOMATIC_CONTROL set feed_time = ?, absor_start = ?, absor_stop = ?, "
					+ "aircon_start = ?, aircon_stop = ?, humid_start = ?, humid_stop = ?, boil_start = ?, "
					+ "boil_stop = ?";

			prepar_statement = connetion.prepareStatement(sql);

			prepar_statement.setString(1, automatic_dto.getFeed_time());
			prepar_statement.setInt(2, automatic_dto.getAbsor_start());
			prepar_statement.setInt(3, automatic_dto.getAbsor_stop());
			prepar_statement.setInt(4, automatic_dto.getAircon_start());
			prepar_statement.setInt(5, automatic_dto.getAircon_stop());
			prepar_statement.setInt(6, automatic_dto.getHumid_start());
			prepar_statement.setInt(7, automatic_dto.getHumid_stop());
			prepar_statement.setInt(8, automatic_dto.getBoil_start());
			prepar_statement.setInt(9, automatic_dto.getBoil_stop());
			
//			String feed_time = null; 	// 밥줄시간
//			int absor_start = 0; 		// 흡배기 시작 농도
//			int absor_stop = 0; 		// 흡배기 정지 농도
//			int aircon_start = 0; 		// 에어컨
//			nt aircon_stop = 0; 		// 에어컨 정지 온도
//			int humid_start = 0;		// 가습기 시작 습도
//			nt humid_stop = 0;		 	// 가습기 정지 습도
//			int boil_start = 0; 		// 보일러 시작 온도
//			int boil_stop = 0; 			// 보일러 정지 온도
			
			state_Check = prepar_statement.executeUpdate();

		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Update SQL문제 발생");
		} finally {
			Automatic_Close();
		}
		return state_Check;
	}

	public Automatic_Control_DTO Automatic_SRead() {

		automatic_DTO = null;
		try {

			Automatic_Connetion();

			String sql = "select * from AUTOMATIC_CONTROL"; // where 조건 필요시 추가하기

			prepar_statement = connetion.prepareStatement(sql);

			result_set = prepar_statement.executeQuery();

			if (result_set.next()) {

//				변수 확인용 필요없으면 지우기			
//				String feed_time = null; 	// 밥줄시간
//				int absor_start = 0; 		// 흡배기 시작 농도
//				int absor_stop = 0; 		// 흡배기 정지 농도
//				int aircon_start = 0; 		// 에어컨
//				int aircon_stop = 0; 		// 에어컨 정지 온도
//				int humid_start = 0;		// 가습기 시작 습도
//				nt humid_stop = 0;		 	// 가습기 정지 습도
//				int boil_start = 0; 		// 보일러 시작 온도
//				int boil_stop = 0; 			// 보일러 정지 온도

				String feed_time = result_set.getString(1);
				int absor_start = result_set.getInt(2);
				int absor_stop = result_set.getInt(3);
				int aircon_start = result_set.getInt(4);
				int aircon_stop = result_set.getInt(5);
				int humid_start = result_set.getInt(6);
				int humid_stop = result_set.getInt(7);
				int boil_start = result_set.getInt(8);
				int boil_stop = result_set.getInt(9);

				// 확인용 확인 후 지우기
				System.out.println(feed_time);
				System.out.println(absor_start);
				System.out.println(absor_stop);
				System.out.println(aircon_start);
				System.out.println(aircon_stop);
				System.out.println(humid_start);
				System.out.println(humid_stop);
				System.out.println(boil_start);
				System.out.println(boil_stop);
				
				automatic_DTO = new Automatic_Control_DTO(feed_time, absor_start, absor_stop, aircon_start, 
						aircon_stop, humid_start, humid_stop, boil_start, boil_stop);

			
			}

		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Select SQLException에러");
		} finally {
			Automatic_Close();
		}

		return automatic_DTO;
	}

	public void Automatic_Close() {
		try {

			if (result_set != null) {
				result_set.close();
			}

			if (prepar_statement != null) {
				prepar_statement.close();
			}

			if (connetion != null) {
				connetion.close();
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Close SQLException에러");
		}
	}
}
