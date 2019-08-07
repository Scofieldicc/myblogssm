package com.qf.myblogssm.service.impl;

import com.qf.myblogssm.dao.UserMapper;
import com.qf.myblogssm.pojo.User;
import com.qf.myblogssm.service.UserService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceimpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password){
        User user = userMapper.selectByName(username);
         //如果用户不为null，则进行密码对比
        //如果密码为null
        if(user!=null){
            //首先得将前端传过来的密码进行加密以后对比
            Md5Hash md5Hash = new Md5Hash(password, username, 1000);
           // md5Hash.toString();
            if(user.getUserPassword().equals(md5Hash.toString())){
                return user;
            }
        }
        return  null;
    }
}
