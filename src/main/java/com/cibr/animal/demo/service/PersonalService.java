package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.*;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.*;

@Service
public class PersonalService {

    @Autowired
    CibrStockDrosophilaMapper stockDrosophilaMapper;

    @Autowired
    CibrAnimalDrosophilaMapper animalDrosophilaMapper;

    @Autowired
    CibrSysEnvironmentMapper environmentMapper;

    @Autowired
    CibrSysSampleindexMapper sampleindexMapper;

    @Autowired
    CibrSysUserGroupMapper groupMapper;

    @Autowired
    CibrSysUserMapper userMapper;

    public Map<String, Object> stockTable(int currentPage,int pageSize){
        Map<String, Object> retMap = new HashMap<String, Object>();
        List<Map<String ,Object>> retList = new ArrayList<>();
        List<CibrAnimalDrosophila> allStock = getAllStock();
        List<CibrSysEnvironment> cibrSysEnvironments = environmentMapper.selectAllRecord();
        Map<String,CibrSysEnvironment> envMap = new HashMap<String,CibrSysEnvironment>();
        for (CibrSysEnvironment env : cibrSysEnvironments){
            envMap.put(env.getId(),env);
        }
        if (allStock != null && allStock.size()>0){
            for (CibrAnimalDrosophila tmp : allStock){
                if (tmp.getStockDrosophilas() != null && tmp.getStockDrosophilas().size()>0){
                    for (CibrStockDrosophila stockDrosophila : tmp.getStockDrosophilas()){
                        Map<String ,Object> tmpStock = new HashMap<String ,Object>();
                        tmpStock.put("animal",tmp);
                        tmpStock.put("stock",stockDrosophila);
                        tmpStock.put("env",envMap.get(stockDrosophila.getEnvironment()));
                        retList.add(tmpStock);
                    }
                }else {
                    Map<String ,Object> tmpStock = new HashMap<String ,Object>();
                    tmpStock.put("animal",tmp);
                    tmpStock.put("stock",new CibrStockDrosophila());
                    tmpStock.put("env",new CibrSysEnvironment());
                    retList.add(tmpStock);
                }
            }
        }
        if (pageSize == 0){
            retMap.put("stockTable" ,retList);
        }else {
            int startIndex = currentPage * pageSize;
            int endIndex = currentPage * pageSize + pageSize;
            if (endIndex > retList.size()){
                endIndex = retList.size();
            }
            List<Map<String, Object>> subList = retList.subList(startIndex, endIndex);
            retMap.put("stockTable" ,subList);
        }
        retMap.put("totalnumber",retList.size());
        return  retMap;
    }

    public List<CibrAnimalDrosophila> getAllStock(){
        return animalDrosophilaMapper.selectAllStock();
    }

    public List<CibrAnimalDrosophila> findanimalByGen(String gentype) {
        CibrAnimalDrosophilaExample example = new CibrAnimalDrosophilaExample();
        example.createCriteria().andGenotypeEqualTo(gentype);
        List<CibrAnimalDrosophila> cibrAnimalDrosophilas = animalDrosophilaMapper.selectByExample(example);
        return cibrAnimalDrosophilas;
    }

    @Transactional(rollbackFor = Exception.class)
    public void stockAdd(String animalName,String stockID, String genotype, String resource,List<Map> rows, CibrSysUser user) throws ParseException {
        CibrAnimalDrosophila drosophila = new CibrAnimalDrosophila();
        String droId = Util.getUUID();
        drosophila.setId(droId);
        drosophila.setCreatetime(new Date());
        drosophila.setGenotype(genotype);
        drosophila.setCreateuser(user.getId());
        drosophila.setStockId(stockID);
        drosophila.setName(animalName);
        drosophila.setResource(resource);

        CibrStockDrosophila stockDrosophila = new CibrStockDrosophila();

        CibrSysSampleindexExample sampleindexExample = new CibrSysSampleindexExample();
        sampleindexExample.createCriteria().andNameEqualTo("FLY").andCurtimeEqualTo(TimeUtil.date2str(new Date(),"yyMM"));
        List<CibrSysSampleindex> sampleindices = sampleindexMapper.selectByExample(sampleindexExample);
        CibrSysSampleindex droInd = null;
        if (sampleindices == null || sampleindices.size() == 0){
            droInd = new CibrSysSampleindex();
            droInd.setName("DRO");
            droInd.setCurtime(TimeUtil.date2str(new Date(),"yyMM"));
            droInd.setCurrentindex(0);
        }else {
            droInd = sampleindices.get(0);
        }

        for (Map row : rows){
            String birthday = (String) row.get("birthday");
            String number = "";
            try {
                number = (String) row.get("number");
            }catch (Exception e){
                number = String.valueOf((Integer) row.get("number"));
            }
            String container = (String) row.get("container");
            String useType = (String) row.get("useType");
            String location = (String) row.get("location");
            String environmentId = (String) row.get("environmentId");

            droInd.setCurrentindex(droInd.getCurrentindex()+1);
            stockDrosophila.setStockindex(droInd.getSelfNum());
            stockDrosophila.setId(Util.getUUID());
            stockDrosophila.setBirthday(Util.str2date(birthday,"yyyy-MM-dd"));
            stockDrosophila.setContanernmuber(Integer.parseInt(number));
            stockDrosophila.setContanertype(container);
            stockDrosophila.setCreatetime(new Date());
            stockDrosophila.setDrosophilaId(droId);
            stockDrosophila.setCreateuser(user.getId());
            stockDrosophila.setEnvironment(environmentId);
            stockDrosophila.setRawnumber(Integer.parseInt(number));
            stockDrosophila.setRawtype(container);
            stockDrosophila.setUsagetype(useType);
            stockDrosophila.setLocation(location);
            stockDrosophilaMapper.insert(stockDrosophila);
        }
        animalDrosophilaMapper.insert(drosophila);
        if (sampleindices == null || sampleindices.size() == 0){
            sampleindexMapper.insert(droInd);
        }else {
            sampleindexMapper.updateByPrimaryKey(droInd);
        }
    }

    public List<CibrSysUserGroup> findallgroups() {
        List<CibrSysUserGroup> groups = groupMapper.findallgroupsWithUsers();
        return groups;
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateDepartment(List<CibrSysUserGroup> groups) {
        groupMapper.batchUpdate(groups);
        List<CibrSysUser> list = new ArrayList<>();
        for (CibrSysUserGroup group : groups){
            CibrSysUser user = userMapper.selectByPrimaryKey(group.getGroupadmin());
            user.setRoleid(group.getId());
            list.add(user);
        }
        userMapper.batchUpdate(list);
    }
}
