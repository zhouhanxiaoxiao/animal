package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysMenuMapper;
import com.cibr.animal.demo.entity.CibrSysMenu;
import com.cibr.animal.demo.entity.CibrSysMenuExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeService {
    
    @Autowired
    private CibrSysMenuMapper menuMapper;

    /**
     *
     * @return
     */
    public List<CibrSysMenu> getMenus(){
        List<CibrSysMenu> menus = menuMapper.selectByExample(new CibrSysMenuExample());
        if (menus != null && menus.size()>0){

        }
        return null;
    }
}
