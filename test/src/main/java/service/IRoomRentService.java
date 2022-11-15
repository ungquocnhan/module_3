package service;

import model.RoomRent;

import java.util.List;

public interface IRoomRentService {
    List<RoomRent> selectAll();

    boolean addRoomRent(RoomRent roomRent);


}
