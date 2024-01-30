package org.example.productdiscountcalculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpRetryException;
@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/calculator")
public class Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String describe = req.getParameter("describe");
        Float price = Float.parseFloat(req.getParameter("price"));
        Integer percent = Integer.parseInt(req.getParameter("percent"));

        double amount = price * percent * 0.01;

        PrintWriter writer =resp.getWriter();
        writer.println("<html>");
        writer.println("<h2>Product Description "+describe+"</h2>");
        writer.println("<h2>List Price "+price+"</h2>");
        writer.println("<h2>Discount Percent "+percent+"%</h2>");
        writer.println("<h2>Discount Amount "+amount+"</h2>");
        writer.println("</html>");
    }
}
