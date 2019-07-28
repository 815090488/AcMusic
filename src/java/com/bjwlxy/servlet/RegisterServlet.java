package com.bjwlxy.servlet;

import com.bjwlxy.pojo.User;
import com.bjwlxy.service.UserService;
import com.bjwlxy.service.impl.UserServiceImpl;
import com.bjwlxy.utils.base64Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    UserService userService = new UserServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String userpwd = req.getParameter("password");
        String sex = req.getParameter("sex");
        String email = req.getParameter("email");
        System.out.println(username + ":" + userpwd + ":" + sex + ":" + email);

        String originKey = "123678";
        String password = null;
        try {
            password = base64Util.desEncript(userpwd, originKey);
            int index = userService.UserRegister(0, username, password, sex, email, 0);
            System.out.println(index);
            if (index >= 0) {
                System.out.println("注册成功");
                req.getRequestDispatcher("/").forward(req, resp);
            } else {
                System.out.println("注册失败");
                resp.sendRedirect("/AcMusic1/register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}
