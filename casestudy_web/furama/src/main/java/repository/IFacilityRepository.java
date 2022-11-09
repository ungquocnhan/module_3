package repository;

import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> selectAllFacility();

    boolean addFacility(Facility facility);

    Facility selectFacility(int id);

    boolean isDeleteFacility(int id);

    boolean isUpdateFacility(Facility facility);

    List<Facility> searchFacility(String name);

}
