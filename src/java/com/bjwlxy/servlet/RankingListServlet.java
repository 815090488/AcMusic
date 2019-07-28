package com.bjwlxy.servlet;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.service.RankingListService;
import com.bjwlxy.service.impl.RankingListServceImpl;
import com.bjwlxy.utils.PageBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Ranking")
public class RankingListServlet extends HttpServlet {


    RankingListService rankingListService = new RankingListServceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取当前页
        String pn = req.getParameter("pageNumber");
        int pageNumber = Integer.parseInt(pn);
        int pageSize = 5;
        PageBean<Music> pageBean=rankingListService.getPageBean(pageNumber,pageSize);
        System.out.println(pageBean);
        if (pageBean!=null){
            HttpSession session = req.getSession();
            session.setAttribute("pageBean",pageBean);
            req.getRequestDispatcher("/RankingList.jsp").forward(req,resp);
        }
    }
}
