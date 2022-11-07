package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    boolean insertCustomer(Customer customer);
}
