package com.bjwlxy.servlet;

import com.bjwlxy.pojo.User;
import com.bjwlxy.service.UserService;
import com.bjwlxy.service.impl.UserServiceImpl;
import com.bjwlxy.utils.base64Util;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class UserServlet extends HttpServlet {

    UserService userService = new UserServiceImpl();

        @Override
        protected void service(HttpServletRequest req, HttpServletResponse resp)  {
            String username = req.getParameter("username");
            String userpwd = req.getParameter("password");
            System.out.println(username+":"+userpwd);
            try {
                String originKey = "123678";
                String password = base64Util.desEncript(userpwd, originKey);
                System.out.println("password="+password);
                User user = userService.UserLogin(username,password);
                System.out.println(user);
                if(user!=null){
                    resp.setContentType("text/html;chartset=utf-8");
                    HttpSession session = req.getSession();
                    session.setAttribute("user",user);
                    System.out.println("登录成功");
                    req.getRequestDispatcher("/").forward(req,resp);
                }else{
                    System.out.println("登陆失败");
                    resp.sendRedirect("/");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
    }
}
