package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.Account;

public class AccountDAO {
	Connection conn = null;
	Connect con = new Connect();

	PreparedStatement ps = null;
	ResultSet rs = null;

	public Account checkLogin(String userName, String passWord) {

		conn = con.getConnect();
		String sql = String.format("Select * From tbl_account where acc_username='%s' and acc_pass ='%s'", userName,
				passWord);
		Account account = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				account = new Account(rs.getString("acc_username"), rs.getString("acc_pass"), rs.getString("acc_email"),
						rs.getString("acc_phone"), rs.getString("acc_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return account;
	}

	public boolean insertAccountDAO(Account acc) {
		conn = con.getConnect();
		boolean result = false;

		String insertAccount = "insert into tbl_account(acc_username,acc_pass,acc_email,acc_name,acc_phone) values(?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(insertAccount);
			ps.setString(1, acc.getUsername());
			ps.setString(2, acc.getPass());
			ps.setString(3, acc.getEmail());
			ps.setString(4, acc.getName());
			ps.setString(5, acc.getPhone());

			result = ps.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
}
