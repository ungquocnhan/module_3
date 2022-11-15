package service.impl;

import dto.CustomerUseFacilityDTO;
import repository.ICustomerUseFacilityRepository;
import repository.impl.CustomerUseFacilityRepository;
import service.ICustomerUseFacilityService;

import java.util.List;

public class CustomerUseFacilityService implements ICustomerUseFacilityService {
    private ICustomerUseFacilityRepository customerUseFacilityRepository = new CustomerUseFacilityRepository();

    @Override
    public List<CustomerUseFacilityDTO> selectAll() {
        return customerUseFacilityRepository.selectAll();
    }
}
