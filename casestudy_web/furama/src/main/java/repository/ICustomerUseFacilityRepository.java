package repository;

import dto.CustomerUseFacilityDTO;

import java.util.List;

public interface ICustomerUseFacilityRepository {
    List<CustomerUseFacilityDTO> selectAll();
}
