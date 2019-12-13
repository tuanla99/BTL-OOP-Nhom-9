/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Device;
import model.DonBh;
import model.Product;
import model.*;
import services.*;

/**
 *
 * @author dtl
 */
@WebServlet(name = "DonBhAdd", urlPatterns = "/donbh-add")
public class DonBhAdd extends HttpServlet {

    DonBhService dao = new DonBhService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/form-AddDonBaoHanh.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DonBh don = new DonBh();
        String imei = request.getParameter("imei");
        String giaDon = request.getParameter("giaDon");
        String moTaBenh = request.getParameter("moTaBenh");
        String maLK = request.getParameter("maLK");
        String maNV = request.getParameter("maNV");
        // String maKH = request.getParameter("maKH");
        String trangThai = request.getParameter("trangThai");
        if (imei != null && giaDon != null && moTaBenh != null && maLK != null && maNV != null && trangThai!= null){
            don.setImei(imei);
            ProductService productService = new ProductService();
            Product product =  productService.searchByImei(imei);

            don.setGiaDon(Integer.parseInt(giaDon));
            don.setLoi(moTaBenh);
            don.setMaLK(Integer.parseInt(maLK));
            don.setMaNV(Integer.parseInt(maNV));
            don.setMaKH(product.getMaKH());
            don.setTrangThai(trangThai);
            dao.insert(don);
            response.sendRedirect(request.getContextPath() + "/donbh-list"); // quay lai trang  danh sach don bao hanh
        }else {
            request.setAttribute("error","Một trường bỏ trống, hãy thực hiện lại");
            request.getRequestDispatcher("/view/form-AddDonBaoHanh.jsp").forward(request,response);
        }


    }
}
