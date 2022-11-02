import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product_description");
        float listPrice = Float.parseFloat(request.getParameter("list_price"));
        float discountPercent = Float.parseFloat(request.getParameter("discount_percent"));

        float discountAmount = listPrice * discountPercent * 0.01f;

        float discountPrice = listPrice - discountAmount;

        request.setAttribute("product",product);
        request.setAttribute("discount_amount", discountAmount);
        request.setAttribute("discount_price", discountPrice);
        request.getRequestDispatcher("result.jsp").forward(request, response);
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
