package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    void insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean isDeleteUser(int id);

    boolean isUpdateUser(User user);
    
    List<User> searchByCountry(String countrySearch);
}
