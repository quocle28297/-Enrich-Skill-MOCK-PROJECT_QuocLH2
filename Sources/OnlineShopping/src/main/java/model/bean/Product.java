package model.bean;

import java.util.List;

public class Product {
	private int id;
	private String name;
	private float price;
	private int sale;
	private String decription;
	private int typeId;
	private String image;

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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public String getDecription() {
		return decription;
	}

	public void setDecription(String decription) {
		this.decription = decription;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Product() {
	}
	
	public Product(int id, String name, float price, int sale, String decription, int typeId, String image) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.sale = sale;
		this.decription = decription;
		this.typeId = typeId;
		this.image = image;
	}

	public Product(String name, float price, int sale, String decription, int typeId, String image) {
		this.name = name;
		this.price = price;
		this.sale = sale;
		this.decription = decription;
		this.typeId = typeId;
		this.image = image;
	}
}
