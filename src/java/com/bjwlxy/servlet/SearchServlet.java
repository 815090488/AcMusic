package com.bjwlxy.servlet;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.service.SearchService;
import com.bjwlxy.service.impl.SearchServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    SearchService searchService = new SearchServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        System.out.println(search);
        List<Music> musicList = searchService.seleSong(search);
        System.out.println(musicList);
        HttpSession session = req.getSession();
        session.setAttribute("musicList",musicList);
        req.getRequestDispatcher("/search.jsp").forward(req,resp);
    }
}
