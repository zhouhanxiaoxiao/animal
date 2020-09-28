package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrAnimalDrosophilaMapper;
import com.cibr.animal.demo.dao.CibrStockDrosophilaMapper;
import com.cibr.animal.demo.dao.CibrSysEnvironmentMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;

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
//        List<CibrAnimalDrosophila> cibrAnimalDrosophilas = animalDrosophilaMapper.selectAllStockLimit(currIndex, pageSize);
        CibrAnimalDrosophilaExample example = new CibrAnimalDrosophilaExample();
        example.createCriteria().andCurstatuNotEqualTo("09");
        example.setOrderByClause("selfindex,createTime");
        List<CibrAnimalDrosophila> list = animalDrosophilaMapper.selectByExample(example);
        map.put("strains",list);
//        int total = animalDrosophilaMapper.selectTotalNumber();
//        map.put("totalnumber",total);
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

    @Transactional(rollbackFor = Exception.class)
    public void deleteStock(CibrSysUser user, List<String> stockIds) {
        CibrStockDrosophilaExample stockDrosophilaExample = new CibrStockDrosophilaExample();
        stockDrosophilaExample.createCriteria().andIdIn(stockIds);
        List<CibrStockDrosophila> list = stockDrosophilaMapper.selectByExample(stockDrosophilaExample);
        if (list != null && list.size()>0){
            for (CibrStockDrosophila stock : list){
                stock.setStatu("09");
                stock.setUpdateuser(user.getId());
                stock.setUpdatetime(new Date());
            }
        }
        stockDrosophilaMapper.batchUpdate(list);
    }

    public Map<String, Object> currentStock(int currentPage, int pageSize) {
        Map<String, Object> retMap = new HashMap<>();
        List<CibrStockDrosophila> cibrStockDrosophilas = stockDrosophilaMapper.selectAllStocks(null);
        retMap.put("currentStock",cibrStockDrosophilas);
        CibrStockDrosophilaExample stockDrosophilaExample = new CibrStockDrosophilaExample();
        stockDrosophilaExample.createCriteria().andStatuNotEqualTo("09");
        return retMap;
    }

    public Map<String, Object> initAddStockPage() {
        Map<String, Object> retMap = new HashMap<>();
        CibrAnimalDrosophilaExample animalDrosophilaExample = new CibrAnimalDrosophilaExample();
        animalDrosophilaExample.setOrderByClause("selfindex");
        List<CibrAnimalDrosophila> list = animalDrosophilaMapper.selectByExample(animalDrosophilaExample);
        retMap.put("animals",list);
        List<CibrSysEnvironment> envs = environmentMapper.selectByExample(new CibrSysEnvironmentExample());
        retMap.put("envs",envs);
        return retMap;
    }

    public void saveStock(CibrStockDrosophila stockDrosophila, CibrSysUser user) {
        stockDrosophila.setId(Util.getUUID());
        stockDrosophila.setCreateuser(user.getId());
        stockDrosophila.setCreatetime(new Date());
        stockDrosophila.setRawtype(stockDrosophila.getContanertype());
        stockDrosophila.setRawnumber(stockDrosophila.getContanernmuber());
        stockDrosophila.setStatu("01");
        stockDrosophilaMapper.insert(stockDrosophila);
    }

    public void stockImport(List<List<String>> rows, CibrSysUser user) throws ParseException {
        List<CibrAnimalDrosophila> animals = animalDrosophilaMapper.selectByExample(new CibrAnimalDrosophilaExample());
        Map<String,String> selfNum_uuid = new HashMap<>();
        if (animals != null && animals.size()>0){
            for (CibrAnimalDrosophila animal : animals){
                selfNum_uuid.put(animal.getSelfindex(),animal.getId());
            }
        }
        List<CibrSysEnvironment> cibrSysEnvironments = environmentMapper.selectByExample(new CibrSysEnvironmentExample());
        Map<String,String> name_uuid = new HashMap<>();
        for (CibrSysEnvironment env : cibrSysEnvironments){
            name_uuid.put(env.getDisplayname(),env.getId());
        }
        List<CibrStockDrosophila> list = new ArrayList<>();
        if (rows != null && rows.size()>0){
            for (List<String> row : rows){
                CibrStockDrosophila stock = new CibrStockDrosophila();
                stock.setId(Util.getUUID());
                String selfNum = row.get(0);
                stock.setDrosophilaId(Util.nullToStr(selfNum_uuid.get(selfNum)));
                int index = 1;
                stock.setContanertype(row.get(index++));
                BigDecimal bigDecimal = new BigDecimal(row.get(index++));
                bigDecimal.intValue();
                Integer num = bigDecimal.intValue();
                if (num == 0){
                    continue;
                }
                stock.setContanernmuber(num);
                stock.setUsagetype("保种".equals(Util.nullToStr(row.get(index++))) ? "keep" : "stock");
                stock.setEnvironment(name_uuid.get(row.get((index++))));
                stock.setCreatetime(TimeUtil.str2date(row.get(index++),"yyyy.MM.dd"));
                stock.setBirthday(TimeUtil.str2date(row.get(index++),"yyyy.MM.dd"));
                stock.setCreateuser(user.getId());
                stock.setRawnumber(stock.getContanernmuber());
                stock.setRawtype(stock.getContanertype());
                stock.setStatu("01");
                list.add(stock);
            }
        }
        if (list.size()>0){
            stockDrosophilaMapper.batchInsert(list);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteStrains(List<String> ids, CibrSysUser user) {
        /*删除品系*/
        CibrAnimalDrosophilaExample animalDrosophilaExample = new CibrAnimalDrosophilaExample();
        animalDrosophilaExample.createCriteria().andIdIn(ids);
        List<CibrAnimalDrosophila> list = animalDrosophilaMapper.selectByExample(animalDrosophilaExample);
        if (list != null && list.size() > 0){
            for (CibrAnimalDrosophila animalDrosophila : list){
                animalDrosophila.setCurstatu("09");
                animalDrosophila.setUpdatetime(new Date());
                animalDrosophila.setUpdateuser(user.getId());
            }
            animalDrosophilaMapper.batchUpdate(list);
        }
        /*删除库存*/
        CibrStockDrosophilaExample stockDrosophilaExample = new CibrStockDrosophilaExample();
        stockDrosophilaExample.createCriteria().andDrosophilaIdIn(ids);
        List<CibrStockDrosophila> stocks = stockDrosophilaMapper.selectByExample(stockDrosophilaExample);
        if (stocks != null && stocks.size() > 0){
            for (CibrStockDrosophila stock : stocks){
                stock.setStatu("09");
                stock.setUpdatetime(new Date());
                stock.setUpdateuser(user.getId());
            }
            stockDrosophilaMapper.batchUpdate(stocks);
        }
    }

    public CibrAnimalDrosophila getStrainById(String strainId) {
        return animalDrosophilaMapper.selectByPrimaryKey(strainId);
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateStrain(CibrAnimalDrosophila drosophila, CibrSysUser user) {
        drosophila.setUpdateuser(user.getId());
        drosophila.setUpdatetime(new Date());
        animalDrosophilaMapper.updateByPrimaryKey(drosophila);
    }
}
