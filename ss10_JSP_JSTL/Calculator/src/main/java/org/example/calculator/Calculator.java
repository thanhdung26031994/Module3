package org.example.calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class Calculator extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(req.getParameter("firstOperand"));
        float secondOperand = Float.parseFloat(req.getParameter("secondOperand"));
        String operator = req.getParameter("operator");
        try {
            float result = calculator(firstOperand,secondOperand,operator);
            String resultStr = firstOperand + " " + operator + " " + secondOperand + " = " + result;
            req.setAttribute("resultStr", resultStr);
        }catch (Exception e){
            req.setAttribute("message", e);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        dispatcher.forward(req,resp);


    }
    private float calculator(float firstOperand, float secondOperand,String operator){
        switch (operator){
            case "+":
                return firstOperand + secondOperand;

            case "-":
                return firstOperand - secondOperand;

            case "*":
                return firstOperand * secondOperand;

            case "/":
                if (secondOperand != 0){
                    return firstOperand / secondOperand;
                }else {
                    throw new RuntimeException("Không thể chia hết cho 0");
                }
            default:
                throw new RuntimeException("Thao tác không hơp lệ");
        }
    }
}
