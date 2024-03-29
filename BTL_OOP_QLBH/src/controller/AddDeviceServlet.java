
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Device;
import services.DeviceService;

@WebServlet(name = "AddDeviceServlet",urlPatterns ="/add-device" )

public class AddDeviceServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("view/form-addLK.jsp");
	dispatcher.forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //lấy dữ liệu
        Device device = new Device();
        device.setTenLK(req.getParameter("TENLK"));
        device.setNsx(req.getParameter("NSX"));
        device.setGiaLK(Integer.parseInt(req.getParameter("GIALK")));
         
        //thêm vào DB
        DeviceService deviceService = new DeviceService();

        deviceService.insertDevice(device);

        resp.sendRedirect(req.getContextPath() + "/list-device");
       
        
    }
    
    
}