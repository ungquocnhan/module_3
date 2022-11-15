package repository;

import model.Customer;
import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAll();

    void addEmployee(Employee employee);

    Employee findEmployeeById(int id);

    boolean isEditEmployee(Employee employee);

    boolean isDeleteEmployee(int id);

}
