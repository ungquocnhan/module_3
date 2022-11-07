package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();

    public UserService() {
    }

    @Override
    public void insertUser(User user) {
        iUserRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public boolean isDeleteUser(int id) {
        return iUserRepository.isDeleteUser(id);
    }

    @Override
    public boolean isUpdateUser(User user) {
        return iUserRepository.isUpdateUser(user);
    }

    @Override
    public List<User> searchByCountry(String countrySearch) {
        return iUserRepository.searchByCountry(countrySearch);
    }

    @Override
    public User getUserById(int id) {
        return iUserRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) {
        iUserRepository.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(User user, int[] permission) {
        iUserRepository.addUserTransaction(user, permission);
    }
}
