package controller;

import model.Customer;
import model.Product;
import services.CustomerService;
import services.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "addProduct", urlPatterns = "/addProduct")
public class AddProduct extends HttpServlet {
    CustomerService customerService = new CustomerService();
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        // Thong tin san pham

        String imei = req.getParameter("IMEI");
        String tenSP = req.getParameter("TENSP");
        String nsx = req.getParameter("NSX");
        String loaiSp = req.getParameter("LOAISP");
        String thongtinsp = req.getParameter("THONGTINSP");
        String thoigianbaohanh = req.getParameter("THOIGIANBAOHANH");

        if (imei != null && tenSP != null && nsx != null && loaiSp != null && thongtinsp != null && thoigianbaohanh != null) {
            Product product = new Product();
            product.setImei(imei);
            product.setTenSP(tenSP);
            product.setNxs(nsx);
            product.setLoaiSP(loaiSp);
            product.setHanBaoHanh(thoigianbaohanh);
            product.setThongTinSP(thongtinsp);

            // Thong tin khach hang
            if (req.getParameter("MAKH") == null) {
                String tenKH = req.getParameter("TENKH");
                String dienThoai = req.getParameter("DIENTHOAI");
                String email = req.getParameter("EMAIL");
                String diaChi = req.getParameter("DIACHI");
                customerService.addCustomer(tenKH, dienThoai, email, diaChi);
                Customer customer = customerService.searchByPhone(dienThoai);


                productService.addProduct(product, customer.getMaKH());
                resp.sendRedirect(req.getContextPath() + "/list-customer");
            } else {
                String maKH = req.getParameter("MAKH");
                productService.addProduct(product, Integer.parseInt(maKH));
                resp.sendRedirect(req.getContextPath() + "/list-product");
            }

        }else {
            req.setAttribute("error","Một trường bị bỏ trống, hãy thực hiện lại.");
            req.getRequestDispatcher("/view/form-addSP.jsp").forward(req,resp);
        }


    }

}
