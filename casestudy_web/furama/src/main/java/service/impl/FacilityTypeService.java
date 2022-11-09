package service.impl;

import model.FacilityType;
import repository.IFacilityRepository;
import repository.IFacilityTypeRepository;
import repository.impl.BaseRepository;
import repository.impl.FacilityRepository;
import repository.impl.FacilityTypeRepository;
import service.IFacilityService;
import service.IFacilityTypeService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {
    private IFacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<FacilityType> selectAllFacilityType() {
        return facilityTypeRepository.selectAllFacilityType();
    }
}
