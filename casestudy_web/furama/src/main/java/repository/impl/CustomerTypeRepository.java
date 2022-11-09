package repository.impl;

import model.CustomerType;
import repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private static final String SQL_CUSTOMER_TYPE_SELECT_ALL = "SELECT * FROM customer_type";

    @Override
    public List<CustomerType> selectAllCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        CustomerType customerType;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL_CUSTOMER_TYPE_SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                customerType = new CustomerType(id, name);
                customerTypeList.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypeList;
    }
}
