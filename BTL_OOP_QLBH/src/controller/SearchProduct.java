package controller;

import model.Product;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/search-product")
public class SearchProduct extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String imei = req.getParameter("imei");
        Product product = productService.searchByImei(imei);
        List<Product> products = new ArrayList<>();
        products.add(product);
        req.setAttribute("products", products);
        req.getRequestDispatcher("/view/list-san-pham.jsp").forward(req, resp);


    }
}
