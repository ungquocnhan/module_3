package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> selectAll() {
        return employeeRepository.selectAll();
    }

    @Override
    public void addEmployee(Employee employee) {
        employeeRepository.addEmployee(employee);
    }

    @Override
    public Employee findEmployeeById(int id) {
        return employeeRepository.findEmployeeById(id);
    }

    @Override
    public boolean isEditEmployee(Employee employee) {
        return employeeRepository.isEditEmployee(employee);
    }

    @Override
    public boolean isDeleteEmployee(int id) {
        return employeeRepository.isDeleteEmployee(id);
    }
}
