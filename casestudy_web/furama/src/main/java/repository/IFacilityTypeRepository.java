package repository;

import model.CustomerType;
import model.FacilityType;

import java.util.List;

public interface IFacilityTypeRepository {
    List<FacilityType> selectAllFacilityType();

}
