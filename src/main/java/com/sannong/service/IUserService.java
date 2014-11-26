package com.sannong.service;

import java.util.List;
import java.util.Map;

import com.sannong.infrastructure.persistance.entity.User;

public interface IUserService {
	
    public List<User> getUserByCondition(Map<String, Object> map);
    
    public List<User> getUserByFuzzyMatch(Map<String, Object> map);

    public boolean updateUser(User user) throws Exception;

    public boolean updatePassword(User user) throws Exception;
    
    public String getUserTotalCount(Map<String,Object> map) throws Exception;

    public String getUserNameByCellphone(String cellphone) throws Exception;
}
