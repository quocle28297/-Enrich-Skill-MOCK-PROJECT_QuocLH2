package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.Image;
import model.bean.Product;

public class ImageDAO {
	PreparedStatement ps = null;
	ResultSet rs = null;

	public Image getListImageById(Connection conn, int productId) {
		String query = String.format("Select DISTINCT  * From tbl_image where img_product_id = %d", productId);
		Image image = null;
		
		try {
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			// get product from database
			while (rs.next()) {
				image = new Image(rs.getInt("img_id"), rs.getString("img_name"), rs.getInt("img_product_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return image;
	}
	
	public boolean insertImageDAO(Connection conn, Image image) {
		boolean result = false;

		String insertImage = "insert into tbl_image(img_name,img_product_id) values(?,?)";
		try {
			ps = conn.prepareStatement(insertImage);
			ps.setString(1, image.getName());
			ps.setInt(2, image.getProductId());

			result = ps.executeUpdate() > 0 ? true : false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}
		return result;
	}
}
