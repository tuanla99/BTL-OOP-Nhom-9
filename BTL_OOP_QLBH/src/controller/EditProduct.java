package controller;

import model.Product;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import services.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/edit-product")
public class EditProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        // Thong tin san pham
        String imei = req.getParameter("IMEI");
        String tenSP = req.getParameter("TENSP");
        String nsx = req.getParameter("NSX");
        String loaiSp = req.getParameter("LOAISP");
        String thongtinsp = req.getParameter("THONGTINSP");
        String thoigianbaohanh = req.getParameter("THOIGIANBAOHANH");

        ProductService productService = new ProductService();

        productService.editProduct(imei, tenSP, loaiSp, nsx, thoigianbaohanh, thongtinsp);
        resp.sendRedirect(req.getContextPath()+"/list-product");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
