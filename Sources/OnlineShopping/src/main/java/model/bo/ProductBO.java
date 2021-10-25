package model.bo;

import java.util.List;

import model.bean.Product;
import model.bean.ProductType;
import model.dao.ProductDAO;
import model.dao.ProductTypeDAO;

public class ProductBO {
	public List<Product> getAllProduct() {
		return new ProductDAO().getAllProduct();
	}

	public Product getProductById(int productId) {
		// TODO Auto-generated method stub
		return new ProductDAO().getProductById(productId);
	}

	public List<Product> getListProductByTypeId(int typeId) {
		// TODO Auto-generated method stub
		return new ProductDAO().getListProductByTypeId(typeId);
	}

	public List<ProductType> getListProductType() {
		// TODO Auto-generated method stub
		return new ProductTypeDAO().getListProductType();
	}

	public boolean insertProductBO(Product product) {
		return new ProductDAO().insertProductDAO(product);
	}

	public boolean updateProductByIdBO(Product product) {
		return new ProductDAO().updateProductByIdDAO(product);
	}

	public boolean deleteProductByIdBO(int productId) {
		return new ProductDAO().deleteProductByIdDao(productId);
	}
}
