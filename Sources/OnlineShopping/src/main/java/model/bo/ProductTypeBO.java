package model.bo;

import java.util.List;

import model.bean.ProductType;
import model.dao.ProductTypeDAO;

public class ProductTypeBO {
	public List<ProductType> getListProductType() {
		return new ProductTypeDAO().getListProductType();
	}
}
