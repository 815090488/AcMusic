

package com.bjwlxy.servlet;

import com.bjwlxy.pojo.Music;
import com.bjwlxy.pojo.SongMenu;
import com.bjwlxy.service.SongListService;
import com.bjwlxy.service.SongMenuService;
import com.bjwlxy.service.impl.SongListServiceImpl;
import com.bjwlxy.service.impl.SongMenuServiceImpl;
import com.bjwlxy.utils.PageBean;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/songlist")
public class SongListServlet extends HttpServlet {

    SongListService songListService = new SongListServiceImpl();
    SongMenuService songMenuService = new SongMenuServiceImpl();
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //获取当前页
        String pn = req.getParameter("pageNumber");
        int pageNumber = Integer.parseInt(pn);
        int pageSize = 5;
        PageBean<Music> pageBean=songListService.getPageBean(pageNumber,pageSize);
        System.out.println(pageBean);
        List<SongMenu> songMenuList = songMenuService.seLSong();
        System.out.println(songMenuList);
      if (pageBean!=null){
          HttpSession session = req.getSession();
          session.setAttribute("pageBean",pageBean);
          session.setAttribute("songMenuList",songMenuList);
          req.getRequestDispatcher("/songlist.jsp").forward(req,res);
      }
    }
}
