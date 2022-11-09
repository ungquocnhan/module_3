package repository.impl;

import model.FacilityType;
import repository.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    @Override
    public List<FacilityType> selectAllFacilityType() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        FacilityType facilityType;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM facility_type");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                facilityType = new FacilityType(id,name);
                facilityTypeList.add(facilityType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityTypeList;
    }
}
