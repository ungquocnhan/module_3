package controller;

import dto.CustomerUseFacilityDTO;
import service.ICustomerUseFacilityService;
import service.impl.CustomerUseFacilityService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerUseFacilityServlet" , value = "/customer_use_facility")
public class CustomerUseFacilityServlet extends HttpServlet {
    private ICustomerUseFacilityService customerUseFacilityService = new CustomerUseFacilityService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action = request.getParameter("action");
if(action == null){
    action = "";
}
switch (action){
    case "edit":
        break;
    case"delete":
        break;
    default:
        showListCustomerUseFacility(request, response);
        break;
}
    }

    private void showListCustomerUseFacility(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerUseFacilityDTO> customerUseFacilityDTOList = customerUseFacilityService.selectAll();
        request.setAttribute("customerUseFacilityDTOList",customerUseFacilityDTOList);
        try {
            request.getRequestDispatcher("view/customer_use_facility/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
