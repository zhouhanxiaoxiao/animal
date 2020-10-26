package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrAnimalDrosophilaMapper;
import com.cibr.animal.demo.dao.CibrStockDrosophilaMapper;
import com.cibr.animal.demo.entity.CibrAnimalDrosophila;
import com.cibr.animal.demo.entity.CibrAnimalDrosophilaExample;
import com.cibr.animal.demo.entity.CibrStockDrosophila;
import com.cibr.animal.demo.entity.CibrStockDrosophilaExample;
import com.cibr.animal.demo.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class AnimalService {

    @Autowired
    CibrAnimalDrosophilaMapper drosophilaMapper;

    @Autowired
    CibrStockDrosophilaMapper stockDrosophilaMapper;

    public List<CibrAnimalDrosophila> getAllDrosos(){
        return drosophilaMapper.selectAll();
    }

    public void batchInsert(List<CibrAnimalDrosophila> list){
        drosophilaMapper.batchInsert(list);
    }

    public int getAllStrainNumber(){
        CibrAnimalDrosophilaExample example = new CibrAnimalDrosophilaExample();
        example.createCriteria().andCurstatuNotEqualTo("09");
        return drosophilaMapper.countByExample(example);
    }

    public int getallstockNumber() {
        CibrStockDrosophilaExample example = new CibrStockDrosophilaExample();
        example.createCriteria().andStatuNotEqualTo("09");
        return stockDrosophilaMapper.countByExample(example);
    }

    public int getOneMonthStockNumber() {
        CibrStockDrosophilaExample example = new CibrStockDrosophilaExample();
        example.createCriteria().andCreatetimeGreaterThan(TimeUtil.dateAdd(new Date(), Calendar.MONTH,-1));
        return stockDrosophilaMapper.countByExample(example);
    }

    public int getOneMonthStrainNumber() {
        CibrAnimalDrosophilaExample example = new CibrAnimalDrosophilaExample();
        example.createCriteria().andCreatetimeGreaterThan(TimeUtil.dateAdd(new Date(), Calendar.MONTH,-1));
        return drosophilaMapper.countByExample(example);
    }
}
