package repository.impl;

import model.Payment;
import model.RoomRent;
import repository.IRoomRentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomRentRepository implements IRoomRentRepository {
    private final String SELECT_ALL = "select rr.*, p.name as payment_name from room_rent rr join payment p on p.id = rr.payment_id  where rr.flag = 1;";
    private final String INSERT = "INSERT into room_rent(name, phone_number, start_date, note,  payment_id, flag) value (?,?,?,?,?,?)";
    @Override
    public List<RoomRent> selectAll() {
        List<RoomRent> roomRentList = new ArrayList<>();
        RoomRent roomRent;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String phoneNumber = resultSet.getString("phone_number");
                String startDate = resultSet.getString("start_date");
                String note = resultSet.getString("note");
                String paymentName = resultSet.getString("payment_name");
                Payment payment = new Payment(paymentName);
                roomRent = new RoomRent(id,name,phoneNumber,startDate,payment,note);
                roomRentList.add(roomRent);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return roomRentList;
    }

    @Override
    public boolean addRoomRent(RoomRent roomRent) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1,roomRent.getName());
            preparedStatement.setString(2,roomRent.getNumberPhone());
            preparedStatement.setString(3, String.valueOf(roomRent.getStartDate()));
            preparedStatement.setString(4,roomRent.getNote());
            preparedStatement.setInt(5,roomRent.getPayment().getId());
            preparedStatement.setBoolean(6,roomRent.isFlag());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }


}
