package service;

import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> selectAllFacility();

    boolean addFacility(Facility facility);


}
