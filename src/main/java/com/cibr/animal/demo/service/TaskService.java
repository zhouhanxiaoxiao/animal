package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.*;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.TaskUtil;
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

    @Autowired
    CibrTaskAskDrosophilaMapper askDrosophilaMapper;

    @Autowired
    CibrTaskDetailDrosophilaMapper detailDrosophilaMapper;

    @Autowired
    CibrSysUserMapper userMapper;

    @Autowired
    EmailService emailService;

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
    public void createAskTask(CibrSysUser user, List<String> selectedStudyDirector, String purpose, String expectedTime,
                              String operationProcess, String remarks, String urgent,
                              Map<String, Object> detailData) throws ParseException {
        /*任务表*/
        CibrSysTask task = new CibrSysTask();
        String taskId = Util.getUUID();
        task.setId(taskId);
        task.setTasktype(TaskUtil.ASK_TASK);
        task.setTaskstatu(TaskUtil.TASK_STATU_TODO);
        CibrSysUser handler = getHandler(TaskUtil.ASK_TASK);
        task.setCurrentuser(handler.getId());
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
        askDrosophila.setCurrentstatu(TaskUtil.TASK_STATU_UNDO);
        askDrosophila.setExpectedtime(Util.str2date(expectedTime,"yyyy-MM-dd"));
        askDrosophila.setOperationprocess(operationProcess);
        askDrosophila.setPurpose(purpose);
        askDrosophila.setTaskid(taskId);
        askDrosophila.setRemarks(remarks);
        askDrosophila.setUrgent(urgent);
        askDrosophilaMapper.insert(askDrosophila);


        List<CibrTaskAskDirector> list = new ArrayList<CibrTaskAskDirector>();
        /*实验负责人*/
        for (String tmp : selectedStudyDirector){
            CibrTaskAskDirector askDirector = new CibrTaskAskDirector();
            askDirector.setId(Util.getUUID());
            askDirector.setCreatetime(new Date());
            askDirector.setCurstatu("0");
            askDirector.setTaskid(askId);
            askDirector.setUserid(tmp);
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
            taskDetailDrosophila.setAge(String.valueOf((Integer) value.get("age")));
            taskDetailDrosophila.setAskid(askId);
            taskDetailDrosophila.setCreatetime(new Date());
            taskDetailDrosophila.setGender((String) value.get("grender"));
            taskDetailDrosophila.setHybridstrain((String) value.get("hybridStrainId"));
            taskDetailDrosophila.setIshybridizationnecessary((String) value.get("isHybridizationNecessary"));
            taskDetailDrosophila.setOrdernumber((String) value.get("orderNumber"));
            taskDetailDrosophila.setId(Util.getUUID());
            detailDrosophilaList.add(taskDetailDrosophila);
        }
        detailDrosophilaMapper.batchInsert(detailDrosophilaList);
        /*给饲养员发邮件提醒*/
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("creater",user.getName());
        map.put("expectedTime",expectedTime);
        map.put("urgent",urgent);
        String context = Util.getAskTaskTemplate(map);
        emailService.simpleSendEmail(context,handler.getEmail(),Util.EMAIL_SUB_ASKTASK);
    }

    public CibrSysUser getHandler(String taskType){
        CibrSysUser handler = null;
        /*果蝇使用申请任务，获取果蝇饲养员userId*/
        if (TaskUtil.ASK_TASK.equals(taskType)){
            CibrSysUserExample userExample = new CibrSysUserExample();
            userExample.createCriteria().andRoleidEqualTo("2");
            List<CibrSysUser> cibrSysUsers = userMapper.selectByExample(userExample);
            if (cibrSysUsers != null && cibrSysUsers.size()>0){
                handler = cibrSysUsers.get(0);
            }
        }
        return handler;
    }

    /**
     * 获取所有任务
     * @param currentPage
     * @param pageSize
     */
    public Map<String,Object> findAllTask(Integer currentPage, Integer pageSize,CibrSysUser user) {
        /*获取任务主表所有任务*/
        Map condition = new HashMap();
        condition.put("start",currentPage * pageSize);
        condition.put("pageSize", pageSize);
        condition.put("userId", user.getId());
        List<CibrSysTask> cibrSysTasks = taskMapper.selectByLimit(condition);
        List<CibrSysUser> cibrSysUsers = userMapper.selectByExample(new CibrSysUserExample());
        Map<String,CibrSysUser> userid_user = new HashMap<String,CibrSysUser>();
        /**用户map*/
        for (CibrSysUser userTmp : cibrSysUsers) {
            userid_user.put(userTmp.getId(),userTmp);
        }
        List<String> taskids = new ArrayList<String>();
        for (CibrSysTask task: cibrSysTasks) {
            taskids.add(task.getId());
        }

        CibrTaskAskDrosophilaExample drosophilaExample = new CibrTaskAskDrosophilaExample();
        drosophilaExample.createCriteria().andTaskidIn(taskids);
        List<CibrTaskAskDrosophila> cibrTaskAskDrosophilas = askDrosophilaMapper.selectByExample(drosophilaExample);

        List<Map<String,Object>> retList = new ArrayList<>();
        /*组合数据*/
        for (CibrSysTask task: cibrSysTasks){
            Map<String,Object> ret = new HashMap<>();
            ret.put("task",task);
            for (CibrTaskAskDrosophila ask : cibrTaskAskDrosophilas){
                if (task.getId().equals(ask.getTaskid())){
                    ret.put("ask",ask);
                    break;
                }
            }
            ret.put("creater",userid_user.get(task.getCreateuser()));
            retList.add(ret);
        }

        CibrSysTaskExample taskExample = new CibrSysTaskExample();
        taskExample.createCriteria().andCreateuserEqualTo(user.getId());
        int total = taskMapper.countByExample(taskExample);
        Map<String,Object> retMap = new HashMap<String,Object>();
        retMap.put("alltask", retList);
        retMap.put("total",total);
        return retMap;
    }
}
