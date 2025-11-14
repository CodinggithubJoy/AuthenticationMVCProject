package controller;

import entity.User;
import model.UserDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServ extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String cpassword = req.getParameter("cpassword");

        if (!password.equals(cpassword)) {
            req.setAttribute("error", "Passwords do not match!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        User user = new User(fullname, email, username, password);
        UserDAO dao = new UserDAO();

        if (dao.registerUser(user)) {
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("error", "Registration failed. Try again!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}

