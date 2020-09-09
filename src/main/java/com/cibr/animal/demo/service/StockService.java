package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrAnimalDrosophilaMapper;
import com.cibr.animal.demo.dao.CibrStockDrosophilaMapper;
import com.cibr.animal.demo.dao.CibrSysEnvironmentMapper;
import com.cibr.animal.demo.entity.CibrAnimalDrosophila;
import com.cibr.animal.demo.entity.CibrStockDrosophila;
import com.cibr.animal.demo.entity.CibrSysEnvironment;
import com.cibr.animal.demo.entity.CibrSysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StockService {

    @Autowired
    private CibrAnimalDrosophilaMapper animalDrosophilaMapper;

    @Autowired
    private CibrStockDrosophilaMapper stockDrosophilaMapper;

    @Autowired
    private CibrSysEnvironmentMapper environmentMapper;

    public Map<String,Object> findAllStrains(int pageSize, int currentPage) {
        Map<String,Object> map = new HashMap<String,Object>();
        int currIndex = currentPage * pageSize;
        List<CibrAnimalDrosophila> cibrAnimalDrosophilas = animalDrosophilaMapper.selectAllStockLimit(currIndex, pageSize);
        map.put("strains",cibrAnimalDrosophilas);
        int total = animalDrosophilaMapper.selectTotalNumber();
        map.put("totalnumber",total);
        return map;
    }

    public void batchInsert(List<CibrStockDrosophila> list){
        stockDrosophilaMapper.batchInsert(list);
    }

    public CibrStockDrosophila stockEditInit(String stockId) {
        CibrStockDrosophila stock = stockDrosophilaMapper.selectByPrimaryKey(stockId);
        CibrAnimalDrosophila animal = animalDrosophilaMapper.selectByPrimaryKey(stock.getDrosophilaId());
        CibrSysEnvironment env = environmentMapper.selectByPrimaryKey(stock.getEnvironment());
        List<CibrSysEnvironment> cibrSysEnvironments = environmentMapper.selectAllRecord();
        stock.setEnvs(cibrSysEnvironments);
        stock.setAnimal(animal);
        stock.setEnv(env);
        return stock;
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateStock(CibrStockDrosophila stock, CibrSysUser user) {
        stock.setUpdateuser(user.getId());
        stock.setUpdatetime(new Date());
        stockDrosophilaMapper.updateByPrimaryKey(stock);
    }
}
