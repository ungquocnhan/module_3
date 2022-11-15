package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    boolean insertCustomer(Customer customer);

    Customer selectCustomer(int id);

    boolean isUpdateCustomer(Customer customer);

    boolean isDeleteCustomer(int id);

    List<Customer> searchByName(String name, String address, String numberPhone);

}
