package controller;

import model.Facility;
import model.FacilityType;
import model.RentType;
import service.IFacilityService;
import service.IFacilityTypeService;
import service.IRentTypeService;
import service.impl.FacilityService;
import service.impl.FacilityTypeService;
import service.impl.RentTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();
    private IFacilityTypeService facilityTypeService = new FacilityTypeService();
    private IRentTypeService rentTypeService = new RentTypeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "save":
                addFacility(request, response);
                break;
            case "edit":
                editFacility(request, response);
                break;
            case "search":
                searchFacility(request, response);
                break;

        }
    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        List<Facility> facilityList = facilityService.searchFacility(name);
        request.setAttribute("facilityList", facilityList);
        List<FacilityType> facilityTypeList = facilityTypeService.selectAllFacilityType();
        request.setAttribute("facilityTypeList", facilityTypeList);
        List<RentType> rentTypeList = rentTypeService.selectAllRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void editFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        String facilityFree = request.getParameter("facilityFree");
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        Facility facilityEdit = new Facility(id, name, area, cost, maxPeople, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloor, facilityFree, rentTypeId, facilityTypeId);

        boolean check = facilityService.isUpdateFacility(facilityEdit);
        String message = "Edit No Success";
        if (check) {
            message = "Edit Success";
        }
        request.setAttribute("message", message);
        showListFacility(request, response);
    }

    private void addFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        String facilityFree = request.getParameter("facilityFree");
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));

        Facility facility = new Facility(name, area, cost, maxPeople, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloor, facilityFree, rentTypeId, facilityTypeId);
        boolean check = facilityService.addFacility(facility);
        String message = "Add Customer No Success";
        if (check) {
            message = "Add Customer Success";
        }
        request.setAttribute("message", message);
        showListFacility(request, response);
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
                showFormAddFacility(request, response);
                break;
            case "edit":
                showFormEditFacility(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            default:
                showListFacility(request, response);
                break;
        }
    }

    private void showFormEditFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facilityExists = facilityService.selectFacility(id);
        request.setAttribute("facility", facilityExists);
        List<FacilityType> facilityTypeList = facilityTypeService.selectAllFacilityType();
        request.setAttribute("facilityTypeList", facilityTypeList);
        List<RentType> rentTypeList = rentTypeService.selectAllRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            request.getRequestDispatcher("view/facility/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = facilityService.isDeleteFacility(id);
        String message = "Delete No Success";
        if (check) {
            message = "Delete Success";
        }
        request.setAttribute("message", message);
        showListFacility(request, response);
    }

    private void showFormAddFacility(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/facility/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.selectAllFacility();
        request.setAttribute("facilityList", facilityList);
        List<FacilityType> facilityTypeList = facilityTypeService.selectAllFacilityType();
        request.setAttribute("facilityTypeList", facilityTypeList);
        List<RentType> rentTypeList = rentTypeService.selectAllRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
