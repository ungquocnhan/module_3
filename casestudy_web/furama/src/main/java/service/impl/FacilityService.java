package service.impl;

import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository facilityRepository = new FacilityRepository();

    @Override
    public List<Facility> selectAllFacility() {
        return facilityRepository.selectAllFacility();
    }

    @Override
    public boolean addFacility(Facility facility) {
        return facilityRepository.addFacility(facility);
    }

    @Override
    public Facility selectFacility(int id) {
        return facilityRepository.selectFacility(id);
    }

    @Override
    public boolean isDeleteFacility(int id) {
        return facilityRepository.isDeleteFacility(id);
    }

    @Override
    public boolean isUpdateFacility(Facility facility) {
        return facilityRepository.isUpdateFacility(facility);
    }

    @Override
    public List<Facility> searchFacility(String name) {
        return facilityRepository.searchFacility(name);
    }
}
