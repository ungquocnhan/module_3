package repository.impl;

import model.Facility;
import repository.IFacilityRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {

    private static final String SQL_ALL_FACILITY = "SELECT * FROM facility";
    private static final String SQL_INSERT_FACILITY = "INSERT INTO facility(name, area, cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, rent_type_id, facility_type_id) VALUE (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_FACILITY_BY_ID = "SELECT * FROM facility WHERE id = ?";
    private static final String DELETE_FACILITY_SQL = "DELETE FROM facility WHERE id = ?;";
    //    private static final String UPDATE_FACILITY_SQL = "CALL get_edit_facility(?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_FACILITY_SQL = "UPDATE facility SET name = ?, area = ?, cost = ?, max_people = ?, standard_room = ?, description_other_convenience = ?, pool_area = ?, number_of_floors = ?, facility_free = ?, rent_type_id = ?, facility_type_id = ? WHERE id = ?";
    private static final String SEARCH_FACILITY = "SELECT * FROM facility WHERE name LIKE ?;";

    @Override
    public List<Facility> selectAllFacility() {
        List<Facility> facilityList = new ArrayList<>();
        Facility facility;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_ALL_FACILITY);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
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
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloor());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getFacilityTypeId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    @Override
    public Facility selectFacility(int id) {
        Facility facility = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FACILITY_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
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
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facility;
    }

    @Override
    public boolean isDeleteFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY_SQL);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean isUpdateFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
//            CallableStatement callableStatement = connection.prepareCall(UPDATE_FACILITY_SQL);
//            callableStatement.setString(1, facility.getName());
//            callableStatement.setInt(2, facility.getArea());
//            callableStatement.setDouble(3, facility.getCost());
//            callableStatement.setInt(4, facility.getMaxPeople());
//            callableStatement.setString(5, facility.getStandardRoom());
//            callableStatement.setString(6, facility.getDescriptionOtherConvenience());
//            callableStatement.setDouble(7, facility.getPoolArea());
//            callableStatement.setInt(8, facility.getNumberOfFloor());
//            callableStatement.setString(9, facility.getFacilityFree());
//            callableStatement.setInt(10, facility.getRentTypeId());
//            callableStatement.setInt(11, facility.getFacilityTypeId());
//            callableStatement.setInt(12, facility.getId());
            PreparedStatement preparedStatement = connection.prepareCall(UPDATE_FACILITY_SQL);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloor());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getFacilityTypeId());
            preparedStatement.setInt(12, facility.getId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Facility> searchFacility(String name) {
        List<Facility> facilityList = new ArrayList<>();
        Facility facility;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_FACILITY);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nameExits = resultSet.getString("name");
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

                facility = new Facility(id, nameExits, area, cost, maxPeople, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloor, facilityFree, rentTypeId, facilityTypeId);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }


}
