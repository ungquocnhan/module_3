package service;

import model.User;

import java.util.List;

public interface IUserService {
    void insertUser(User user);
    
    User selectUser(int id);
    
    List<User> selectAllUsers();
    
    boolean isDeleteUser(int id);
    
    boolean isUpdateUser(User user);

    List<User> searchByCountry(String countrySearch);

}
