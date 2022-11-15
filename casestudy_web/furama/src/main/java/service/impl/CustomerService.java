package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<Customer> selectAllCustomer() {
        return iCustomerRepository.selectAllCustomer();
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        return iCustomerRepository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return iCustomerRepository.selectCustomer(id);
    }

    @Override
    public boolean isUpdateCustomer(Customer customer) {
        return iCustomerRepository.isUpdateCustomer(customer);
    }

    @Override
    public boolean isDeleteCustomer(int id) {
        return iCustomerRepository.isDeleteCustomer(id);
    }

    @Override
    public List<Customer> searchByName(String name, String address, String numberPhone) {
        return iCustomerRepository.searchByName(name, address, numberPhone);
    }
}
