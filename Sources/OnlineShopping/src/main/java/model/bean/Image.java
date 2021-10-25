package model.bean;

import java.util.List;

public class Image {
	private int id;
	private String name;
	private int productId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	public Image() {}
	
	public Image(int id, String name, int productId) {
		this.id = id;
		this.name = name;
		this.productId = productId;
	}
	
	public Image(String name, int productId) {
		this.name = name;
		this.productId = productId;
	}
}
