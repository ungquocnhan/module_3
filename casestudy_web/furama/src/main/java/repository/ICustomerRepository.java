package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> selectAllCustomer();

    boolean insertCustomer(Customer customer);

    Customer selectCustomer(int id);

    boolean isDeleteCustomer(int id);

    boolean isUpdateCustomer(Customer customer);

    List<Customer> searchByName(String name);
}
