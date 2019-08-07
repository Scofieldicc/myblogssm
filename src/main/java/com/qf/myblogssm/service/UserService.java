package com.qf.myblogssm.service;

import com.qf.myblogssm.pojo.User;

public interface UserService {

    /*
    *用户的登陆接口
    * @param username
    *
     */
    User login(String username, String password);

}
