package com.bjwlxy.servlet;

import com.bjwlxy.service.CountService;
import com.bjwlxy.service.impl.CountServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;

@WebServlet("/count")
public class CountServlet extends HttpServlet {

    CountService countService = new CountServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        int PlyaNum =countService.selePlyNum(id);
        PlyaNum = PlyaNum+1;
        int count =countService.UpdPlyNum(id, PlyaNum);
        resp.getWriter().print(PlyaNum);
    }
}
