package repository.impl;

import dto.CustomerUseFacilityDTO;
import model.Contract;
import model.Facility;
import repository.ICustomerUseFacilityRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class CustomerUseFacilityRepository implements ICustomerUseFacilityRepository {
    private final String SQL_CUSTOMER_USE_FACILITY = "CALL get_customer_use_facility();";
    @Override
    public List<CustomerUseFacilityDTO> selectAll() {
        List<CustomerUseFacilityDTO> customerUseFacilityDTOList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SQL_CUSTOMER_USE_FACILITY);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                String startDate = resultSet.getString("start_day");
                String endDate = resultSet.getString("end_day");
                String facilityName = resultSet.getString("facility_name");
                Contract contract = new Contract(startDate,endDate);
                Facility facility = new Facility(facilityName);
                CustomerUseFacilityDTO customerUseFacilityDTO = new CustomerUseFacilityDTO(id,name,idCard,phoneNumber,address,contract,facility);
                customerUseFacilityDTOList.add(customerUseFacilityDTO);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerUseFacilityDTOList;
    }
}
