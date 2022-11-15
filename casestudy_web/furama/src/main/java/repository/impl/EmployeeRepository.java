package repository.impl;

import model.Division;
import model.EducationDegree;
import model.Employee;
import model.Position;
import repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private final String DELETE_EMPLOYEE = "UPDATE employee SET flag = 0 WHERE id = ?";
    private final String SELECT_ALL_EMPLOYEE = "SELECT e.*, p.name as name_position, ed.name as name_education_degree, d.name as name_division FROM employee e\n" +
            "JOIN position p on p.id = e.position_id\n" +
            "JOIN education_degree ed on ed.id = e.education_degree_id\n" +
            "JOIN division d on d.id = e.division_id\n" +
            "WHERE flag = 1;";
    private final String INSERT_EMPLOYEE = "INSERT INTO employee (name, day_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id, flag) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private final String FIND_BY_ID = "SELECT * FROM employee WHERE id = ?";
    private final String UPDATE_EMPLOYEE = "UPDATE employee SET name = ?, day_of_birth = ?, id_card = ?, salary = ?, phone_number = ?, email = ?, address = ?, position_id = ?, education_degree_id = ?, division_id = ? WHERE id = ?;";

    @Override
    public List<Employee> selectAll() {
        Connection connection = BaseRepository.getConnectDB();
        Employee employee;
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthday = String.valueOf(resultSet.getDate("day_of_birth"));
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String namePosition = resultSet.getString("name_position");
                String nameEducationDegree = resultSet.getString("name_education_degree");
                String nameDivision = resultSet.getString("name_division");
                Position position = new Position(namePosition);
                EducationDegree educationDegree = new EducationDegree(nameEducationDegree);
                Division division = new Division(nameDivision);
                employee = new Employee(id, name, birthday, idCard, salary, phoneNumber, email, address, position, educationDegree, division);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void addEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setDate(2, Date.valueOf(employee.getBirthday()));
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPosition().getId());
            preparedStatement.setInt(9, employee.getEducationDegree().getId());
            preparedStatement.setInt(10, employee.getDivision().getId());
            preparedStatement.setInt(11, employee.getFlag());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Employee findEmployeeById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Employee employee = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String birthday = String.valueOf(resultSet.getDate("day_of_birth"));
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId = resultSet.getInt("position-id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                Position position = new Position(positionId);
                EducationDegree educationDegree = new EducationDegree(educationDegreeId);
                Division division = new Division(divisionId);
                employee = new Employee(name, birthday, idCard, salary, phoneNumber, email, address, position, educationDegree, division);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean isEditEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setDate(2, Date.valueOf(employee.getBirthday()));
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPosition().getId());
            preparedStatement.setInt(9, employee.getEducationDegree().getId());
            preparedStatement.setInt(10, employee.getDivision().getId());
            preparedStatement.setInt(11, employee.getId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean isDeleteEmployee(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
