package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> selectAllCustomer();

    boolean insertCustomer(Customer customer);
}
