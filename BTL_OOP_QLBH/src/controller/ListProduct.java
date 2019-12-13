package controller;

import model.Customer;
import model.Product;
import services.CustomerService;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/list-product")
public class ListProduct extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = null;
        products = productService.getAllProduct();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/view/list-san-pham.jsp").forward(req, resp);
    }
}
