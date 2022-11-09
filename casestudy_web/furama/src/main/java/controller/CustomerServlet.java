package controller;

import model.Customer;
import model.CustomerType;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerService();
    private ICustomerTypeService customerTypeService = new CustomerTypeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "save":
                addCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;

        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        List<Customer> customerList = iCustomerService.searchByName(name);
        request.setAttribute("customerList", customerList);
        request.setAttribute("search", name);

        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customerEdit = new Customer(id, name, birthday, gender, idCard, phoneNumber, email, address, customerTypeId);

        boolean check = iCustomerService.isUpdateCustomer(customerEdit);
        String message = "Edit No Success";
        if (check) {
            message = "Edit Success";
        }
        request.setAttribute("message", message);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer newCustomer = new Customer(name, birthday, gender, idCard, phoneNumber, email, address, customerTypeId);
        boolean check = iCustomerService.insertCustomer(newCustomer);
        String message = "Add Customer No Success";
        if (check) {
            message = "Add Customer Success";
        }
        request.setAttribute("message", message);
        try {
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateInsertCustomer(request, response);
                break;
            case "edit":
                showEditCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                showListCustomer(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = iCustomerService.isDeleteCustomer(id);
        String message = "Delete No Success";
        if (check) {
            message = "Delete Success";
        }
        request.setAttribute("message", message);
        showListCustomer(request, response);
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customerExists = iCustomerService.selectCustomer(id);
        request.setAttribute("customer", customerExists);
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateInsertCustomer(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = this.iCustomerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
