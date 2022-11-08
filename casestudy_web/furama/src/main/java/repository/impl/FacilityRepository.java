package repository.impl;

import model.Facility;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {

    private static final String SQL_ALL_FACILITY = "SELECT * FROM facility";
    private static final String SQL_INSERT_FACILITY = "INSERT INTO facility(name, area, cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, rent_type_id, facility_type_id) VALUE (?,?,?,?,?,?,?,?,?,?,?)";

    @Override
    public List<Facility> selectAllFacility() {
        List<Facility> facilityList = new ArrayList<>();
        Facility facility;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_ALL_FACILITY);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int area = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloor = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("facility_type_id");

                facility = new Facility(id, name, area, cost, maxPeople, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloor, facilityFree, rentTypeId, facilityTypeId);
                facilityList.add(facility);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public boolean addFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_INSERT_FACILITY);
            preparedStatement.setString(1,facility.getName());
            preparedStatement.setInt(2,facility.getArea());
            preparedStatement.setDouble(3,facility.getCost());
            preparedStatement.setInt(4,facility.getMaxPeople());
            preparedStatement.setString(5,facility.getStandardRoom());
            preparedStatement.setString(6,facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7,facility.getPoolArea());
            preparedStatement.setInt(8,facility.getNumberOfFloor());
            preparedStatement.setString(9,facility.getFacilityFree());
            preparedStatement.setInt(10,facility.getRentTypeId());
            preparedStatement.setInt(11,facility.getFacilityTypeId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }
}
