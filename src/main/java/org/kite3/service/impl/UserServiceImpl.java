package org.kite3.service.impl;

import java.util.List;

import org.kite3.dao.UserDao;
import org.kite3.entity.User;
import org.kite3.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 根据username获取
     **/
    public User getByUsername(String username) {
        return userDao.getByUsername(username);
    }

    public User getById(int id) {
        return userDao.getById(id);
    }

    /**
     * 根据username和password获取
     **/
    public User getByUsernameAndPassword(User User) {
        return userDao.getByUsernameAndPassword(User);
    }

    /**
     * 获取首页推荐5个讲师
     **/
    public List<User> queryRecomd() {
        return userDao.queryRecomd();
    }

    /**
     * 创建新用户
     **/
    public void createSelectivity(User user) {
        userDao.createSelectivity(user);
    }

    public void updateSelectivity(User entity) {
        userDao.updateSelectivity(entity);
    }
}
