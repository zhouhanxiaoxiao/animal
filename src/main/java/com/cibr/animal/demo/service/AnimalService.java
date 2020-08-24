package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrAnimalDrosophilaMapper;
import com.cibr.animal.demo.entity.CibrAnimalDrosophila;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnimalService {

    @Autowired
    CibrAnimalDrosophilaMapper drosophilaMapper;

    public List<CibrAnimalDrosophila> getAllDrosos(){
        return drosophilaMapper.selectAll();
    }

    public void batchInsert(List<CibrAnimalDrosophila> list){
        drosophilaMapper.batchInsert(list);
    }
}
