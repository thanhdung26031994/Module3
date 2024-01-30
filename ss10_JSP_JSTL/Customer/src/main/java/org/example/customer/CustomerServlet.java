package org.example.customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer>  customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://i.pinimg.com/474x/5e/bb/d9/5ebbd990430d47ce3968e0810fc07fff.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://p1.hiclipart.com/preview/328/969/307/one-piece-anime-icon-v2-one-piece-png-icon.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hoà", "1983-08-22", "Hà Tây","https://static.myfigurecollection.net/upload/items/1/1892263-f699b.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Nam Định","https://cdn.openart.ai/published/gH3bc6l6S8b30IiNmys4/BXiYv7VS_zIu2_256.webp"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội","https://photo-resize-zmp3.zmdcdn.me/w256_r1x1_jpeg/cover/2/3/6/1/236141954e07e9504bb3b8f74dd963dc.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        req.setAttribute("list", customerList);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
