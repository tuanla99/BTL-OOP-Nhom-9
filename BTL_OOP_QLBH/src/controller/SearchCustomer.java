package controller;

import model.Customer;
import services.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/search-customer")
public class SearchCustomer extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String soDT = req.getParameter("soDT");
        List<Customer> customers = new ArrayList<>();
        Customer customer = null;
        customer = customerService.searchByPhone(soDT);
        customers.add(customer);
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("/view/khach-hang.jsp").forward(req, resp);


    }
}
