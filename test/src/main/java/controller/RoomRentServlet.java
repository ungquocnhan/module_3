package controller;

import model.Payment;
import model.RoomRent;
import service.IRoomRentService;
import service.impl.RoomRentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "RoomRentServlet", value = "/room")
public class RoomRentServlet extends HttpServlet {
    private IRoomRentService roomRentService = new RoomRentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addRoomRent(request,response);
                break;
            case"":
                break;
            
        }
    }

    private void addRoomRent(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String startDate = request.getParameter("startDate");
        int paymentId = Integer.parseInt(request.getParameter("payment"));
        String note = request.getParameter("note");
        boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
        Payment payment = new Payment(paymentId);
        RoomRent roomRent = new RoomRent(name,phoneNumber,startDate,note,payment,flag);
        roomRentService.addRoomRent(roomRent);
        try {
            response.sendRedirect("/room");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                break;
            default:
                showListRoom(request, response);
                break;
        }
    }

    private void showListRoom(HttpServletRequest request, HttpServletResponse response) {
        List<RoomRent> roomRentList = roomRentService.selectAll();
        request.setAttribute("roomRentList", roomRentList);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
