package com.bjwlxy.servlet;

import com.alibaba.fastjson.JSON;
import com.bjwlxy.pojo.Music;
import com.bjwlxy.pojo.SongMenu;
import com.bjwlxy.service.SongMenuService;
import com.bjwlxy.service.impl.SongMenuServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/songmenu")
public class SongMenuServlet extends HttpServlet {

    SongMenuService songMenuService = new SongMenuServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String songMenu1 = req.getParameter("songMenu1");
        if (songMenu1.equals("songMenu1")) {
            try {
                seleSongMenu(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (songMenu1.equals("ajax")) {
            seleMenuName(req, resp);
        } else if (songMenu1.equals("addSong")) {
            updaDiyId(req, resp);
        }

    }

    /**
     * 添加表单
     *
     * @param req
     * @param resp
     */
    private void updaDiyId(HttpServletRequest req, HttpServletResponse resp) {
        Long musicid =Long.parseLong(req.getParameter("musicid"));
        System.out.println(musicid);
        int seleVal =Integer.parseInt(req.getParameter("seleVal"));
        System.out.println(seleVal);
        int addSong = songMenuService.addSongMenu(musicid, seleVal);
    }

    /**
     * ajax返回歌单内容
     *
     * @param req
     * @param resp
     * @throws IOException
     */
    private void seleMenuName(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // String musicid = req.getParameter("musicid");
        List<SongMenu> songMenuList = songMenuService.seLSong();
        System.out.println(songMenuList);
        String str = JSON.toJSON(songMenuList).toString();
        resp.getWriter().print(str);
    }

    /**
     * 查出歌单表和歌单中的音乐
     *
     * @param req
     * @param resp
     * @throws SQLException
     * @throws ClassNotFoundException
     * @throws ServletException
     * @throws IOException
     */
    private void seleSongMenu(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));

        List<Music> musicList = songMenuService.seleSong(id);
        System.out.println(musicList);
        SongMenu songMenu = songMenuService.seleSongMenu(id);
        System.out.println(songMenu);
        List<SongMenu> songMenuList = songMenuService.seLSong();
        HttpSession session = req.getSession();
        session.setAttribute("songMenu", songMenu);
        session.setAttribute("musicList", musicList);
        session.setAttribute("songMenuList",songMenuList);
        req.getRequestDispatcher("/songMenu.jsp").forward(req, resp);
    }


}
