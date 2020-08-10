package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrAnimalDrosophilaMapper;
import com.cibr.animal.demo.dao.CibrStockDrosophilaMapper;
import com.cibr.animal.demo.dao.CibrSysEnvironmentMapper;
import com.cibr.animal.demo.entity.*;
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
    public void stockAdd(String animalName, String useType, String birthday, String location, String stockID, String genotype, String resource, String container, String number, String environmentId, CibrSysUser user) throws ParseException {
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
        animalDrosophilaMapper.insert(drosophila);
        stockDrosophilaMapper.insert(stockDrosophila);
    }
}
