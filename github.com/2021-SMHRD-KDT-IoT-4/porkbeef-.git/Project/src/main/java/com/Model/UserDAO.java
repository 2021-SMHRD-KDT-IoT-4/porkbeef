package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
<<<<<<< HEAD
	
	private Connection connetion = null;
	private PreparedStatement prepar_statement = null;
	private ResultSet result_set = null;
	private int cnt = 0;
	private MemberDTO dto = null;
=======
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	MemberDTO dto = null;
	private ArrayList<MemberDTO> dtos = null;

>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-IoT-4/porkbeef-.git

	public void UserDAO_Connetion() {

		String ip_number = "localhost";
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
			System.out.println("UserDAO���� UserDAO_Connetion ClassNotFoundException����");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("UserDAO���� UserDAO_Connetion SQLException ����");
		}
	}

	public void close() {
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
			e.printStackTrace();
		}
	}

	public int userJoin(MemberDTO dto) {
		
		try {
			UserDAO_Connetion();
			
			String sql = "insert into MEMBERS values(?,?,?)";
			prepar_statement = connetion.prepareStatement(sql);
			prepar_statement.setString(1, dto.getMb_id());
			prepar_statement.setString(2, dto.getMb_pw());
			prepar_statement.setString(3, dto.getNick_name());
			cnt = prepar_statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public MemberDTO userLogin(MemberDTO dto) {
		
		try {
			UserDAO_Connetion();
			
			String sql = "select * from MEMBERS where mb_id = ? and mb_pw =?";

			prepar_statement = connetion.prepareStatement(sql);

			prepar_statement.setString(1, dto.getMb_id());
			prepar_statement.setString(2, dto.getMb_pw());

			result_set = prepar_statement.executeQuery();

<<<<<<< HEAD
			if (result_set.next()) {
				String id = result_set.getString("mb_id");
				String pw = result_set.getString("mb_id");
				int grade = Integer.parseInt(result_set.getString("MB_GRADE"));
				String nick = result_set.getString("nick_name");
=======
			if (rs.next()) {
				String id = rs.getString("mb_id");
				String pw = rs.getString("mb_pw");
				int grade = Integer.parseInt(rs.getString("grade"));
				String nick = rs.getString("nick_name");
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-IoT-4/porkbeef-.git
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
		
		try {
			UserDAO_Connetion();
			
			String sql = "update MEMBERS set grade = ? where mb_id = ?";
			prepar_statement = connetion.prepareStatement(sql);

			prepar_statement.setString(1, dto.getMb_id());
			prepar_statement.setInt(1, dto.getMb_grade());

			cnt = prepar_statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int userDelete(MemberDTO dto) {
		
		try {
			UserDAO_Connetion();
			
			String sql = "delete MEMBERS where mb_id = ?";
			prepar_statement = connetion.prepareStatement(sql);

			prepar_statement.setString(1, dto.getMb_id());

			cnt = prepar_statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
<<<<<<< HEAD
=======
	
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

>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-IoT-4/porkbeef-.git
}
