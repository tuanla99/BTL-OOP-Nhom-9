package controller;

import services.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/delete-product")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String imei = req.getParameter("IMEI");
        ProductService productService = new ProductService();
        productService.deleteProduct(imei);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/san-pham.html");
        dispatcher.forward(req,resp);
    }
}
