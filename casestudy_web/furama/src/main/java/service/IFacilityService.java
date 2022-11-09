package service;

import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> selectAllFacility();

    boolean addFacility(Facility facility);

    Facility selectFacility(int id);

    boolean isDeleteFacility(int id);

    boolean isUpdateFacility(Facility facility);

    List<Facility> searchFacility(String name);

}
