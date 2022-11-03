import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4S3VxkdrYLuXcimo4BIhST1GzkUKJMOJUmg&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRh969qwLc8eZLWY760nA1nvRFC-Btzl66GQ&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUSEXJYW1fpfKKr5NlJwEPR6-jkJLp1QqRwg&usqp=CAU"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnK4ijsH_HLwCqb9jY-nmUwiEdHvahqoqclA&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt3FlZbcIoFtexHW9urqOElQiPMCs5Rqw7sQ&usqp=CAU"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("list_customer.jsp").forward(request, response);
    }
}
