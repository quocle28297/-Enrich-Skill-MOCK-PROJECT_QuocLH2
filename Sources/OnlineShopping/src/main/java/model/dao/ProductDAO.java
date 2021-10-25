package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.Image;
import model.bean.Product;
import model.bean.ProductType;

public class ProductDAO {
	Connection conn = null;
	Connect con = new Connect();

	PreparedStatement ps = null;
	ResultSet rs = null;
	List<Product> products = null;

	public List<Product> getAllProduct() {
		// connect to database
		conn = con.getConnect();
		String sql = String.format("Select * From tbl_product");
		try {

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			products = new ArrayList<Product>();
			// get product from database
			while (rs.next()) {

				Product product = new Product(rs.getInt("product_id"), rs.getString("product_name"),
						rs.getFloat("product_price"), rs.getInt("product_sale"), rs.getString("product_decription"),
						rs.getInt("product_type"), rs.getString("product_image"));

				// add product to list
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
		return products;
	}

	public Product getProductById(int productId) {
		// TODO Auto-generated method stub
		conn = con.getConnect();
		Product product = null;
		String sql = String.format("Select * From tbl_product where product_id = %d", productId);
		try {

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			// get product from database
			if (rs.next()) {
				product = new Product(rs.getInt("product_id"), rs.getString("product_name"),
						rs.getFloat("product_price"), rs.getInt("product_sale"), rs.getString("product_decription"),
						rs.getInt("product_type"), rs.getString("product_image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
		return product;
	}

	public List<Product> getListProductByTypeId(int typeId) {
		// TODO Auto-generated method stub
		// connect to database
		conn = con.getConnect();
		String sql = String.format("Select * From tbl_product where product_type = %d", typeId);
		try {

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			products = new ArrayList<Product>();
			// get product from database
			while (rs.next()) {
				Product product = new Product(rs.getInt("product_id"), rs.getString("product_name"),
						rs.getFloat("product_price"), rs.getInt("product_sale"), rs.getString("product_decription"),
						rs.getInt("product_type"), rs.getString("product_image"));

				// add product to list
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
		return products;
	}

	public boolean insertProductDAO(Product product) {
		conn = con.getConnect();
		boolean result = false;

		String insertProduct = "insert into tbl_product(product_name,product_price,product_sale,product_decription,product_type,product_image) values(?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(insertProduct);
			ps.setString(1, product.getName());
			ps.setFloat(2, product.getPrice());
			ps.setInt(3, product.getSale());
			ps.setString(4, product.getDecription());
			ps.setInt(5, product.getTypeId());
			ps.setString(6, product.getImage());

			result = ps.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}finally {
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

	public boolean updateProductByIdDAO(Product product) {
		conn = con.getConnect();
		String updateProduct = "update tbl_product set  product_name= ?, product_price= ?,product_sale= ?, product_decription=?, product_type= ?, product_image = ? where product_id = ?";

		boolean result = false;
		try {
			ps = conn.prepareStatement(updateProduct);
			ps.setString(1, product.getName());
			ps.setFloat(2, product.getPrice());
			ps.setInt(3, product.getSale());
			ps.setString(4, product.getDecription());
			ps.setInt(5, product.getTypeId());
			ps.setString(6, product.getImage());
			ps.setInt(7, product.getId());

			result = ps.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
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

	public boolean deleteProductByIdDao(int productId) {
		conn = con.getConnect();
		boolean result = false;
		String deleteComputer = "Delete from tbl_product where product_id = ?";

		try {
			ps = conn.prepareStatement(deleteComputer);
			ps.setInt(1, productId);
			result = ps.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {

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
