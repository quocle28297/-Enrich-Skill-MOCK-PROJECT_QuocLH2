package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Image;
import model.bean.Product;
import model.bean.ProductType;
import model.bo.ProductBO;
import jakarta.servlet.RequestDispatcher;

/**
 * Servlet implementation class ProductmanagementServlet
 */
public class ProductmanagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductmanagementServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		ProductBO productBO = new ProductBO();
		List<ProductType> types = productBO.getListProductType();

		if ("btnEdiProduct".equalsIgnoreCase(request.getParameter("btnEdiProduct"))) {
			int idProduct = Integer.parseInt(request.getParameter("idProductEdit"));
			String nameProduct = request.getParameter("nameProductEdit");
			int productType = Integer.parseInt(request.getParameter("productTypeEdit"));
			float price = Float.parseFloat(request.getParameter("priceEdit"));
			int sales = Integer.parseInt(request.getParameter("salesEdit"));
			String description = request.getParameter("descriptionEdit");
			String image = request.getParameter("imageEdit");
			Product product = new Product(idProduct, nameProduct, price, sales, description, productType,image);

			// thuc hien add va tr ve ket qua : (kq = true :thanh cong, kq= false :that bai)
			String updateMessage = productBO.updateProductByIdBO(product) ? "Update success." : "Update failture.";
			request.setAttribute("updateMessage", updateMessage);
		} else if ("btnAddProduct".equalsIgnoreCase(request.getParameter("btnAddProduct"))) {
			String nameProduct = request.getParameter("nameProduct");
			int productType = Integer.parseInt(request.getParameter("productType"));
			float price = Float.parseFloat(request.getParameter("price"));
			int sales = request.getParameter("sales") == "" ? 0 : Integer.parseInt(request.getParameter("sales"));
			String description = request.getParameter("description");
			String image = request.getParameter("image");
			Product product = new Product(nameProduct, price, sales, description, productType, image);

			// thuc hien update va tra ve ket qua : (kq = true :thanh cong, kq= false :that bai)
			String messageInsert = productBO.insertProductBO(product) ? "Insert success." : "Insert failture.";
			request.setAttribute("messageInsert", messageInsert);
		} else if ("btnDeleteProduct".equalsIgnoreCase(request.getParameter("btnDeleteProduct"))) {
			String idProduct = request.getParameter("idProductDelete");
			
			// thuc hien delete va tr ve ket qua : (kq = true :thanh cong, kq= false :that bai)
			String messageDelete = productBO.deleteProductByIdBO(Integer.parseInt(idProduct)) ? "Delete success."
					: "Delete failture.";
			request.setAttribute("messageDelete", messageDelete);
		}

		List<Product> products = productBO.getAllProduct();

		request.setAttribute("products", products);
		request.setAttribute("types", types);
		RequestDispatcher rd = request.getRequestDispatcher("/productmanagement.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
