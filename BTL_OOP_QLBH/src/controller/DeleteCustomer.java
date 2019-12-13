package controller;

import services.CustomerService;
import services.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/delete-customer")
public class DeleteCustomer extends HttpServlet {
    CustomerService customerService = new CustomerService();

    @Override
    protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String maKH = req.getParameter("maKH");
        customerService.deleteCustomer(Integer.parseInt(maKH));
        resp.sendRedirect(req.getContextPath()+"/list-customer");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
