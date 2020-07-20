package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrAnimalDrosophilaMapper;
import com.cibr.animal.demo.dao.CibrSysTaskMapper;
import com.cibr.animal.demo.dao.CibrTaskAskDirectorMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.*;

@Service
public class TaskService {

    @Autowired
    CibrAnimalDrosophilaMapper drosophilaMapper;

    @Autowired
    CibrSysTaskMapper taskMapper;

    @Autowired
    CibrTaskAskDirectorMapper askDirectorMapper;

    public List<Map<String, Object>> getTaskStock(List<String> stockIds, List<Map<String, Object>> stockTable) {
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        for(Map<String, Object> tmp : stockTable){
            CibrStockDrosophila stock = (CibrStockDrosophila) tmp.get("stock");
            if (stock.getId() == null){
                continue;
            }
            if (stockIds.contains(stock.getId())){
                retList.add(tmp);
            }
        }
        return retList;
    }

    public List<CibrAnimalDrosophila> findAllDrosophila(){
        return drosophilaMapper.selectAll();
    }

    @Transactional(rollbackFor = Exception.class)
    public void createAskTask(CibrSysUser user, List<CibrSysUser> selectedStudyDirector, String purpose, String expectedTime,
                              String operationProcess, String remarks, Boolean urgent,
                              Map<String, Object> detailData) throws ParseException {
        /*任务表*/
        CibrSysTask task = new CibrSysTask();
        String taskId = Util.getUUID();
        task.setId(taskId);
        task.setTasktype("02");
        task.setTaskstatu("01");
        task.setCreateuser(user.getId());
        task.setCreatetime(new Date());
        task.setHandletime(new Date());
        taskMapper.insert(task);

        /*申请任务表*/
        CibrTaskAskDrosophila askDrosophila = new CibrTaskAskDrosophila();
        String askId = Util.getUUID();
        askDrosophila.setId(askId);
        askDrosophila.setCreater(user.getId());
        askDrosophila.setCreatetime(new Date());
        askDrosophila.setCurrentstatu("01");
        askDrosophila.setExpectedtime(Util.str2date(expectedTime,"yyyy-MM-dd"));
        askDrosophila.setOperationprocess(operationProcess);
        askDrosophila.setPurpose(purpose);
        askDrosophila.setTaskid(taskId);
        askDrosophila.setRemarks(remarks);
        askDrosophila.setUrgent(urgent?"1":"0");
        List<CibrTaskAskDirector> list = new ArrayList<CibrTaskAskDirector>();

        /*实验负责人*/
        for (CibrSysUser tmp : selectedStudyDirector){
            CibrTaskAskDirector askDirector = new CibrTaskAskDirector();
            askDirector.setId(Util.getUUID());
            askDirector.setCreatetime(new Date());
            askDirector.setCurstatu("0");
            askDirector.setTaskid(askId);
            askDirector.setUserid(tmp.getId());
            list.add(askDirector);
        }

        askDirectorMapper.batchInsert(list);

        List<CibrTaskDetailDrosophila> detailDrosophilaList = new ArrayList<CibrTaskDetailDrosophila>();
        /*实验材料*/
        Set<Map.Entry<String, Object>> entries = detailData.entrySet();
        for (Map.Entry<String, Object> tmp : entries){
            String key = tmp.getKey();
            Map<String,Object> value = (Map<String, Object>) tmp.getValue();
            CibrTaskDetailDrosophila taskDetailDrosophila = new CibrTaskDetailDrosophila();
            taskDetailDrosophila.setStockid(key);
            taskDetailDrosophila.setAge((String) value.get("age"));
            taskDetailDrosophila.setAskid(askId);
            taskDetailDrosophila.setCreatetime(new Date());
            taskDetailDrosophila.setGender((String) value.get("grender"));
            taskDetailDrosophila.setHybridstrain((String) value.get("hybridstrain"));
            taskDetailDrosophila.setIshybridizationnecessary((String) value.get("isHybridizationNecessary"));
        }
    }
}
