package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.ProductType;

public class ProductTypeDAO {
	Connection conn = null;
	Connect con = new Connect();

	PreparedStatement ps = null;
	ResultSet rs = null;
	List<ProductType> types = null;

	public List<ProductType> getListProductType() {
		// connect to database
		conn = con.getConnect();
		String sql = String.format("Select * From tbl_type");
		try {

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			types = new ArrayList<ProductType>();
			// get product from database
			while (rs.next()) {
				ProductType type = new ProductType(rs.getInt("type_id"), rs.getString("type_name"));

				// add product to list
				types.add(type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return types;
	}
}
