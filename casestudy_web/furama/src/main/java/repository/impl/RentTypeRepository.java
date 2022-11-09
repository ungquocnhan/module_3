package repository.impl;

import model.FacilityType;
import model.RentType;
import repository.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {

    @Override
    public List<RentType> selectAllRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        RentType rentType;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM rent_type");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                rentType = new RentType(id,name);
                rentTypeList.add(rentType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentTypeList;
    }
}
