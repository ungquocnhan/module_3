import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("first_operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second_operand"));
        char operator = request.getParameter("operator").charAt(0);
        float result;
        try {
            result = Calculator.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("result", result);
        } catch (ArithmeticException exception) {
            request.setAttribute("result", exception.getMessage());
        }

        request.setAttribute("first_operand", firstOperand);
        request.setAttribute("second_operand", secondOperand);
        request.setAttribute("operator", operator);

        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
