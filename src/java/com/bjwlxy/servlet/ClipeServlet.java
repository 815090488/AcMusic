package com.bjwlxy.servlet;

import com.bjwlxy.pojo.Clipe;
import com.bjwlxy.pojo.Music;
import com.bjwlxy.service.ClipeService;
import com.bjwlxy.service.impl.ClipeServiceImpl;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@WebServlet("/clipe")
public class ClipeServlet extends HttpServlet {

    ClipeService clipeService = new ClipeServiceImpl();

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) {

        Long clip = Long.parseLong(req.getParameter("clip"));

        try {
            List<Music> musicList = clipeService.seleClipeList(clip);
            Clipe clipe =  clipeService.seleClipe(clip);
            System.out.println(musicList);
            HttpSession session = req.getSession();
            session.setAttribute("clipe",clipe);
            session.setAttribute("musicList",musicList);
            req.getRequestDispatcher("/clipe.jsp").forward(req,res);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
