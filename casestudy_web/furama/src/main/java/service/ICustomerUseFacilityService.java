package service;

import dto.CustomerUseFacilityDTO;

import java.util.List;

public interface ICustomerUseFacilityService {
    List<CustomerUseFacilityDTO> selectAll();

}
