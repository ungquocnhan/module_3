package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> selectAll();

    void addEmployee(Employee employee);

    Employee findEmployeeById(int id);

    boolean isEditEmployee(Employee employee);

    boolean isDeleteEmployee(int id);

}
