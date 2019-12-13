package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login", loadOnStartup = 1, name = "login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String error = "";
        if (username.equals("") || password.equals("")) {
            error = "User/Password bị bỏ trống, hãy đăng nhập lại.";
        } else if (username.equals("admin") && password.equals("admin")) {
            error = "";
        } else {
            error = "User/Password sai, hãy đăng nhập lại.";
        }

        if (error.length() > 0) {
            response.sendRedirect(request.getContextPath() + "/donbh-list");
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/login.jsp");
            rd.forward(request, response);

        }

    }
}

