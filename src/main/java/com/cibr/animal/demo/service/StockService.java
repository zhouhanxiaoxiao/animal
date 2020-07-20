package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrAnimalDrosophilaMapper;
import com.cibr.animal.demo.entity.CibrAnimalDrosophila;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StockService {

    @Autowired
    private CibrAnimalDrosophilaMapper animalDrosophilaMapper;


    public Map<String,Object> findAllStrains(int pageSize, int currentPage) {
        Map<String,Object> map = new HashMap<String,Object>();
        int currIndex = currentPage * pageSize;
        List<CibrAnimalDrosophila> cibrAnimalDrosophilas = animalDrosophilaMapper.selectAllStockLimit(currIndex, pageSize);
        map.put("strains",cibrAnimalDrosophilas);
        int total = animalDrosophilaMapper.selectTotalNumber();
        map.put("totalnumber",total);
        return map;
    }
}
