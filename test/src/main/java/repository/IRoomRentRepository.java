package repository;

import model.RoomRent;

import java.util.List;

public interface IRoomRentRepository {
    List<RoomRent> selectAll();

    boolean addRoomRent(RoomRent roomRent);
}
