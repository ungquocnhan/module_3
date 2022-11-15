package service.impl;

import model.RoomRent;
import repository.IRoomRentRepository;
import repository.impl.RoomRentRepository;
import service.IRoomRentService;

import java.util.List;

public class RoomRentService implements IRoomRentService {
    private IRoomRentRepository roomRentRepository = new RoomRentRepository();
    @Override
    public List<RoomRent> selectAll() {
        return roomRentRepository.selectAll();
    }

    @Override
    public boolean addRoomRent(RoomRent roomRent) {
        return roomRentRepository.addRoomRent(roomRent);
    }
}
