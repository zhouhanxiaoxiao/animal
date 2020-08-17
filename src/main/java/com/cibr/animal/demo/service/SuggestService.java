package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysSuggestMapper;
import com.cibr.animal.demo.entity.CibrSysSuggest;
import com.cibr.animal.demo.entity.CibrSysSuggestExample;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SuggestService {

    @Autowired
    private CibrSysSuggestMapper suggestMapper;

    @Autowired
    private LoginService loginService;

    public List<CibrSysSuggest> getAllSuggest(){
        CibrSysSuggestExample suggestExample = new CibrSysSuggestExample();
        suggestExample.setOrderByClause("createTime desc");
        List<CibrSysSuggest> cibrSysSuggests = suggestMapper.selectByExample(suggestExample);
        Map<String,CibrSysUser> uuid_user = new HashMap<String,CibrSysUser>();
        List<CibrSysUser> allUsers = loginService.findAllUsers();
        for (CibrSysUser user : allUsers){
            uuid_user.put(user.getId(),user);
        }
        for (CibrSysSuggest cibrSysSuggest : cibrSysSuggests){
            cibrSysSuggest.setUser(uuid_user.get(cibrSysSuggest.getCreater()));
        }
        return cibrSysSuggests;
    }

    public void createComment(String comment, CibrSysUser user) {
        CibrSysSuggest suggest = new CibrSysSuggest();
        suggest.setId(Util.getUUID());
        suggest.setCreater(user.getId());
        suggest.setComments(comment);
        suggest.setCreatetime(new Date());
        suggestMapper.insert(suggest);
    }
}
