package repository;

import model.CustomerType;
import model.RentType;

import java.util.List;

public interface IRentTypeRepository {
    List<RentType> selectAllRentType();

}
