package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.*;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.FileUtil;
import com.cibr.animal.demo.util.TaskUtil;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import javafx.concurrent.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class TaskService {

    private Logger logger = LoggerFactory.getLogger(TaskService.class);

    @Autowired
    private CibrAnimalDrosophilaMapper drosophilaMapper;

    @Autowired
    private CibrStockDrosophilaMapper stockDrosophilaMapper;

    @Autowired
    private CibrSysTaskMapper taskMapper;

    @Autowired
    private CibrTaskAskDirectorMapper askDirectorMapper;

    @Autowired
    private CibrTaskAskDrosophilaMapper askDrosophilaMapper;

    @Autowired
    private CibrTaskDetailDrosophilaMapper detailDrosophilaMapper;

    @Autowired
    private CibrSysUserMapper userMapper;

    @Autowired
    private EmailService emailService;

    @Autowired
    private CibrSysTaskBusinessMapper businessMapper;

    @Autowired
    private CibrTaskFailMapper failMapper;

    @Autowired
    private CibrTaskAskPrepareMapper prepareMapper;

    @Autowired
    private CibrTaskAskConfirmMapper confirmMapper;

    @Autowired
    private CibrSysRoleMapper roleMapper;

    @Autowired
    private CibrSysUserRoleMapper userRoleMapper;

    @Autowired
    private CibrTaskProcessMapper processMapper;

    @Autowired
    private CibrTaskProcessEmailMapper processEmailMapper;

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private CibrRecordMeterialMapper recordMeterialMapper;

    @Autowired
    private CibrTaskPartnerMapper partnerMapper;

    @Autowired
    private FileService fileService;

    @Autowired
    private CibrSysUserService userService;

    @Autowired
    private CibrSysUserGroupMapper groupMapper;

    @Autowired
    private CibrTaskShareMapper shareMapper;

    public List<Map<String, Object>> getTaskStock(List<String> stockIds, List<Map<String, Object>> stockTable) {
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        for (Map<String, Object> tmp : stockTable) {
            CibrStockDrosophila stock = (CibrStockDrosophila) tmp.get("stock");
            if (stock.getId() == null) {
                continue;
            }
            if (stockIds.contains(stock.getId())) {
                retList.add(tmp);
            }
        }
        return retList;
    }

    public List<CibrAnimalDrosophila> findAllDrosophila() {
        return drosophilaMapper.selectAll();
    }

    @Transactional(rollbackFor = Exception.class)
    public void createAskTask(String supporter, CibrSysUser user, List<String> selectedStudyDirector, String remarks, String urgent,
                              Map<String, Object> detailData) throws ParseException {
        logger.info("开始创建任务事务！");
        String bus = user.getName() + ":创建果蝇使用任务，实验目的：";
        /*任务表*/
        CibrSysTask task = new CibrSysTask();
        String taskId = Util.getUUID();
        task.setId(taskId);
        task.setTasktype(TaskUtil.ASK_TASK);
        task.setTaskstatu(TaskUtil.TASK_STATU_TODO);
        task.setCurrentuser(supporter);
        task.setCreateuser(user.getId());
        task.setCreatetime(new Date());
        task.setHandletime(new Date());
        task.setTaskdesc(remarks);
        taskMapper.insert(task);
        /*申请任务表*/
        CibrTaskAskDrosophila askDrosophila = new CibrTaskAskDrosophila();
        String askId = Util.getUUID();
        askDrosophila.setId(askId);
        askDrosophila.setCurrenthandler(supporter);
        askDrosophila.setCreater(user.getId());
        askDrosophila.setCreatetime(new Date());
        askDrosophila.setCurrentstatu(TaskUtil.ASK_TASK_STATU_UNDO);
        askDrosophila.setTaskid(taskId);
        askDrosophila.setRemarks(remarks);
        askDrosophila.setUrgent(urgent);
        askDrosophilaMapper.insert(askDrosophila);
        List<CibrTaskAskDirector> list = new ArrayList<CibrTaskAskDirector>();
        /*实验负责人*/
        for (String tmp : selectedStudyDirector) {
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
        for (Map.Entry<String, Object> tmp : entries) {
            String key = tmp.getKey();
            Map<String, Object> value = (Map<String, Object>) tmp.getValue();
            CibrTaskDetailDrosophila taskDetailDrosophila = new CibrTaskDetailDrosophila();
            taskDetailDrosophila.setStockid(key);
            taskDetailDrosophila.setAge(String.valueOf(value.get("age")));
            taskDetailDrosophila.setAskid(askId);
            taskDetailDrosophila.setCreatetime(new Date());
            taskDetailDrosophila.setExpectedtime(Util.str2date(String.valueOf(value.get("expectedTime")), "yyyy-MM-dd"));
            taskDetailDrosophila.setPurpose((String) value.get("purpose"));
            taskDetailDrosophila.setOperationprocess((String) value.get("operationProcess"));
            taskDetailDrosophila.setGender((String) value.get("gender"));
            taskDetailDrosophila.setVirginfly((String) value.get("virginFly"));
            taskDetailDrosophila.setHybridstrain((String) value.get("hybridStrainId"));
            taskDetailDrosophila.setIshybridizationnecessary((String) value.get("isHybridizationNecessary"));
            taskDetailDrosophila.setSpecialfeeding((String) value.get("specialFeeding"));
            taskDetailDrosophila.setSpecificfeeding((String) value.get("specificFeeding"));
            taskDetailDrosophila.setOrdernumber(String.valueOf(value.get("orderNumber")));

            String detailId = Util.getUUID();
            taskDetailDrosophila.setId(detailId);
            taskDetailDrosophila.setConfirmstatu("00");
            String needWy = String.valueOf(value.get("needWy"));
            if ("Y".equals(needWy)) {
                List<String> times = (List<String>) value.get("wyTime");
                CibrRecordMeterial recordMeterial = new CibrRecordMeterial();
                recordMeterial.setId(Util.getUUID());
                recordMeterial.setCreater(user.getId());
                //todo 暂时写死，后续有更多的唯一资源再继续补充
                recordMeterial.setResourceid("asdfasedf");
                recordMeterial.setCreatetime(new Date());
                recordMeterial.setDetailid(detailId);
                recordMeterial.setStarttime(Util.str2date(times.get(0), "yyyy-MM-dd HH:mm"));
                recordMeterial.setEndtime(Util.str2date(times.get(1), "yyyy-MM-dd HH:mm"));
                recordMeterial.setUsagemsg("实验");
                recordMeterialMapper.insert(recordMeterial);
            }
            String needPhoto = String.valueOf(value.get("needPhoto"));
            if ("Y".equals(needPhoto)) {
                List<String> times = (List<String>) value.get("photoTime");
                CibrRecordMeterial recordMeterial = new CibrRecordMeterial();
                recordMeterial.setId(Util.getUUID());
                recordMeterial.setCreater(user.getId());
                //todo 暂时写死，后续有更多的唯一资源再继续补充
                recordMeterial.setResourceid("asdfased3");
                recordMeterial.setCreatetime(new Date());
                recordMeterial.setDetailid(detailId);
                recordMeterial.setStarttime(Util.str2date(times.get(0), "yyyy-MM-dd HH:mm"));
                recordMeterial.setEndtime(Util.str2date(times.get(1), "yyyy-MM-dd HH:mm"));
                recordMeterial.setUsagemsg("实验");
                recordMeterialMapper.insert(recordMeterial);
            }
            detailDrosophilaList.add(taskDetailDrosophila);
            bus += taskDetailDrosophila.getPurpose();
        }
        detailDrosophilaMapper.batchInsert(detailDrosophilaList);

        CibrSysTaskBusiness business = new CibrSysTaskBusiness();
        business.setId(Util.getUUID());
        business.setCreatetime(new Date());
        business.setPrestatu(TaskUtil.ASK_TASK_STATU_UNDO);
        business.setNextstatu(TaskUtil.ASK_TASK_STATU_TODO);
        business.setTaskid(taskId);
        business.setUserid(user.getId());
        business.setBusiness(bus);
        businessMapper.insert(business);
        /*给饲养员发邮件提醒*/
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("creater", user.getName());
        map.put("urgent", urgent);
        String context = Util.getAskTaskTemplate(map);
        CibrSysUser supper = userMapper.selectByPrimaryKey(supporter);
        emailService.simpleSendEmail(context, supper.getEmail(), Util.EMAIL_SUB_ASKTASK);
    }

    public CibrSysUser getHandler(String taskType) {
        CibrSysUser handler = null;
        /*果蝇使用申请任务，获取果蝇饲养员userId*/
        if (TaskUtil.ASK_TASK.equals(taskType)) {
            CibrSysRoleExample roleExample = new CibrSysRoleExample();
            roleExample.createCriteria().andRoletypeEqualTo("02");
            List<CibrSysRole> roles = roleMapper.selectByExample(roleExample);
            CibrSysUserRoleExample userRoleExample = new CibrSysUserRoleExample();
            userRoleExample.createCriteria().andRoleidEqualTo(roles.get(0).getId());

            CibrSysUserExample userExample = new CibrSysUserExample();
            userExample.createCriteria().andRoleidEqualTo("2");
            List<CibrSysUser> cibrSysUsers = userMapper.selectByExample(userExample);
            if (cibrSysUsers != null && cibrSysUsers.size() > 0) {
                handler = cibrSysUsers.get(0);
            }
        }
        return handler;
    }

    public Map<String, Object> findAllTask(CibrSysUser user, String pageLocation) {
        List<CibrSysTask> allTask = new ArrayList<>();
        Map<String, Object> retMap = new HashMap<String, Object>();
        /**果蝇使用申请任务*/
        List<CibrSysTask> askTasks = taskMapper.selectAskTask(user.getId(), pageLocation);
        /**协助申请任务*/
        List<CibrSysTask> partnerTasks = taskMapper.selectPartnerTask(user.getId(), pageLocation);
        /**流程管理任务*/
        List<CibrSysTask> processTasks = taskMapper.selectProcessTask(user.getId());
        /**账号申请任务*/
        List<CibrSysTask> userTasks = taskMapper.selectAllAccountTask(user.getId());

        List<CibrSysUser> users = userService.selectAllUserWithDesc();

        List<String> taskIds = new ArrayList<>();
        if (userTasks != null && userTasks.size() > 0) {
            allTask.addAll(userTasks);
            for (CibrSysTask tmp : userTasks){
                taskIds.add(tmp.getId());
            }
        }
        if (askTasks != null && askTasks.size() > 0) {
            allTask.addAll(askTasks);
            for (CibrSysTask tmp : askTasks){
                taskIds.add(tmp.getId());
            }
        }
        if (partnerTasks != null && partnerTasks.size() > 0) {
            allTask.addAll(partnerTasks);
            for (CibrSysTask tmp : partnerTasks){
                taskIds.add(tmp.getId());
            }
        }
        if (processTasks != null && processTasks.size() > 0) {
            allTask.addAll(processTasks);
            for (CibrSysTask tmp : processTasks){
                taskIds.add(tmp.getId());
            }
        }
        List<CibrTaskShare> shares = new ArrayList<>();
        /*项目分享者*/
        if (taskIds.size() > 0){
            CibrTaskShareExample shareExample = new CibrTaskShareExample();
            shareExample.createCriteria().andTaskidIn(taskIds);
            shareExample.setDistinct(true);
            List<CibrTaskShare> dblist = shareMapper.selectByExample(shareExample);
            if (dblist != null){
                shares.addAll(dblist);
            }
        }

        /**已任务状态，创建时间排序*/
        Collections.sort(allTask, new Comparator<CibrSysTask>() {
            @Override
            public int compare(CibrSysTask o1, CibrSysTask o2) {
                int flag = new BigDecimal(o1.getTaskstatu()).compareTo(new BigDecimal(o2.getTaskstatu()));
                if (flag == 0) {
                    return o2.getCreatetime().compareTo(o1.getCreatetime());
                } else {
                    return flag;
                }
            }
        });
        retMap.put("alltask", allTask);
        retMap.put("users", users);
        retMap.put("shares", shares);
        return retMap;
    }

    /**
     * 获取所有任务
     *
     * @param currentPage
     * @param pageSize
     */
    public Map<String, Object> findAllTask(Integer currentPage, Integer pageSize, String pageLocation, CibrSysUser user) {
        /*获取任务主表所有任务*/
        Map condition = new HashMap();

        condition.put("start", currentPage * pageSize);
        condition.put("pageSize", pageSize);
        if ("mytask".equals(pageLocation)) {
            condition.put("userId", user.getId());
        }
        List<CibrSysTask> cibrSysTasks = taskMapper.selectByLimit(condition);
        List<CibrSysUser> cibrSysUsers = userMapper.selectByExample(new CibrSysUserExample());
        Map<String, CibrSysUser> userid_user = new HashMap<String, CibrSysUser>();
        /**用户map*/
        for (CibrSysUser userTmp : cibrSysUsers) {
            userid_user.put(userTmp.getId(), userTmp);
        }

        List<String> taskids = new ArrayList<String>();
        for (CibrSysTask task : cibrSysTasks) {
            taskids.add(task.getId());
        }

        List<CibrTaskAskDrosophila> cibrTaskAskDrosophilas = new ArrayList<>();
        if (cibrSysTasks != null && cibrSysTasks.size() > 0) {
            CibrTaskAskDrosophilaExample drosophilaExample = new CibrTaskAskDrosophilaExample();
            drosophilaExample.createCriteria().andTaskidIn(taskids);
            cibrTaskAskDrosophilas = askDrosophilaMapper.selectByExample(drosophilaExample);
        }

        Map<String, CibrTaskAskDrosophila> uuid_ask = new HashMap<>();
        for (CibrTaskAskDrosophila ask : cibrTaskAskDrosophilas) {
            uuid_ask.put(ask.getTaskid(), ask);
        }

        Map<String, CibrTaskProcess> uuid_process = new HashMap<>();
        List<CibrTaskProcess> allPorcess = processTaskService.findAllPorcess();
        for (CibrTaskProcess process : allPorcess) {
            uuid_process.put(process.getTaskid(), process);
        }

        List<CibrTaskPartner> cibrTaskPartners = partnerMapper.selectByExample(new CibrTaskPartnerExample());
        Map<String, CibrTaskPartner> uuid_partner = new HashMap<>();
        for (CibrTaskPartner partner : cibrTaskPartners) {
            uuid_partner.put(partner.getTaskid(), partner);
        }

        Map<String, CibrSysUserGroup> uuid_group = userService.getuuid_group();

        List<Map<String, Object>> retList = new ArrayList<>();
        /*组合数据*/
        for (CibrSysTask task : cibrSysTasks) {
            Map<String, Object> ret = new HashMap<>();
            ret.put("task", task);
            CibrSysUser creater = userid_user.get(task.getCreateuser());
            ret.put("creater", creater);
            if (uuid_ask.get(task.getId()) != null) {
                ret.put("ask", uuid_ask.get(task.getId()));
            }
            if (uuid_process.get(task.getId()) != null) {
                CibrTaskProcess process = uuid_process.get(task.getId());
                ret.put("process", process);
                CibrSysUserGroup group = uuid_group.get(creater.getRoleid());
                if (TaskUtil.PROCESS_TASK.equals(task.getTasktype())) {
                    if (!user.getId().equals(task.getCreateuser())
                            && !user.getId().equals(group.getGroupadmin())
                            && !user.getId().equals(process.getSampleinput())
                            && !user.getId().equals(process.getSamplepreparation())
                            && !user.getId().equals(process.getLibrarypreparation())
                            && !user.getId().equals(process.getDismountdata())
                            && !user.getId().equals(process.getBioinformaticsanalysis())
                    ) {
                        continue;
                    }
                }
            }
            if (uuid_partner.get(task.getId()) != null) {
                ret.put("partner", uuid_partner.get(task.getId()));
            }
            retList.add(ret);
        }
        int total = taskMapper.selectCount(condition);
        Map<String, Object> retMap = new HashMap<String, Object>();
        retMap.put("alltask", retList);
        retMap.put("total", total);
        return retMap;
    }

    public Map<String, Object> findTaskDetail(String taskId) {
        Map<String, Object> retMap = new HashMap<String, Object>();
        /*获取申请使用任务*/
        CibrSysTask task = taskMapper.selectByPrimaryKey(taskId);
        if (!"02".equals(task.getTasktype())) {
            return null;
        }

        CibrTaskAskDrosophilaExample askDrosophilaExample = new CibrTaskAskDrosophilaExample();
        askDrosophilaExample.createCriteria().andTaskidEqualTo(taskId);
        List<CibrTaskAskDrosophila> cibrTaskAskDrosophilas = askDrosophilaMapper.selectByExample(askDrosophilaExample);
        CibrTaskAskDrosophila ask = cibrTaskAskDrosophilas.get(0);

        /*获取实验材料*/
        CibrTaskDetailDrosophilaExample detailDrosophilaExample = new CibrTaskDetailDrosophilaExample();
        detailDrosophilaExample.createCriteria().andAskidEqualTo(ask.getId());
        List<CibrTaskDetailDrosophila> detailDrosophilas = detailDrosophilaMapper.selectByExample(detailDrosophilaExample);

        /*获取所有已有品系，*/
        CibrAnimalDrosophilaExample animalDrosophilaExample = new CibrAnimalDrosophilaExample();
        List<CibrAnimalDrosophila> cibrAnimalDrosophilas = drosophilaMapper.selectByExample(animalDrosophilaExample);
        Map<String, CibrAnimalDrosophila> uuid_dros = new HashMap<String, CibrAnimalDrosophila>();
        for (CibrAnimalDrosophila dros : cibrAnimalDrosophilas) {
            uuid_dros.put(dros.getId(), dros);
        }

        /*获取所有库存*/
        CibrStockDrosophilaExample stockDrosophilaExample = new CibrStockDrosophilaExample();
        List<CibrStockDrosophila> cibrStockDrosophilas = stockDrosophilaMapper.selectByExample(stockDrosophilaExample);
        Map<String, CibrStockDrosophila> uuid_stock = new HashMap<String, CibrStockDrosophila>();
        for (CibrStockDrosophila stock : cibrStockDrosophilas) {
            uuid_stock.put(stock.getId(), stock);
        }

        List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
        /*转换实验材料中的杂交品系*/
        for (CibrTaskDetailDrosophila detailDrosophila : detailDrosophilas) {
            Map<String, Object> row = new HashMap<String, Object>();
            if ("02".equals(detailDrosophila.getConfirmstatu())) {
                CibrTaskFailExample failExample = new CibrTaskFailExample();
                failExample.createCriteria().andDetailidEqualTo(detailDrosophila.getId());
                List<CibrTaskFail> cibrTaskFails = failMapper.selectByExample(failExample);
                row.put("fail", cibrTaskFails.get(0));
            }
            row.put("detail", detailDrosophila);
            CibrStockDrosophila stockDrosophila = uuid_stock.get(detailDrosophila.getStockid());
            row.put("stock", stockDrosophila);
            row.put("animal", uuid_dros.get(stockDrosophila.getDrosophilaId()));
            if (!StringUtils.isEmpty(detailDrosophila.getHybridstrain())) {
                detailDrosophila.setHybridstrain(uuid_dros.get(detailDrosophila.getHybridstrain()).getGenotype());
            }
            rows.add(row);
        }
        retMap.put("task", task);
        retMap.put("ask", ask);
        retMap.put("rows", rows);
        return retMap;
    }

    /**
     * 更新cibr_sys_task 和 ask表 并同时生成操作流水记录
     *
     * @param taskId    task主表id
     * @param taskStatu 主表的状态
     * @param askStatu  申请表的状态
     * @param user      操作者
     * @return task表和ask表
     */
    public Map<String, Object> updateDrosoTask(String taskId, String taskStatu, String askStatu, CibrSysUser user) {
        Map<String, Object> ret = new HashMap<String, Object>();
        /*处理任务主表*/
        CibrSysTaskExample taskExample = new CibrSysTaskExample();
        taskExample.createCriteria().andIdEqualTo(taskId);
        List<CibrSysTask> cibrSysTasks = taskMapper.selectByExample(taskExample);
        CibrSysTask cibrSysTask = cibrSysTasks.get(0);
        if (taskStatu != null) {
            cibrSysTask.setTaskstatu(taskStatu);
        }
        cibrSysTask.setHandletime(new Date());
        taskMapper.updateByPrimaryKey(cibrSysTask);
        ret.put("task", cibrSysTask);

        /*处理果蝇申请表*/
        CibrTaskAskDrosophilaExample askDrosophilaExample = new CibrTaskAskDrosophilaExample();
        askDrosophilaExample.createCriteria().andTaskidEqualTo(cibrSysTask.getId());
        List<CibrTaskAskDrosophila> cibrTaskAskDrosophilas = askDrosophilaMapper.selectByExample(askDrosophilaExample);
        CibrTaskAskDrosophila askDrosophila = cibrTaskAskDrosophilas.get(0);
        String preStatu = askDrosophila.getCurrentstatu();
        String nextStatu = askStatu;
        askDrosophila.setCurrentstatu(nextStatu);
        askDrosophilaMapper.updateByPrimaryKey(askDrosophila);
        ret.put("ask", askDrosophila);

        /*添加处理流水*/
        CibrSysTaskBusiness business = new CibrSysTaskBusiness();
        business.setId(Util.getUUID());
        business.setCreatetime(new Date());
        business.setTaskid(cibrSysTask.getId());
        business.setUserid(user.getId());
        business.setPrestatu(preStatu);
        business.setNextstatu(nextStatu);
        String buss = "";
        if (TaskUtil.ASK_TASK_STATU_FAIL.equals(askStatu)) {
            buss = "拒绝请求";
        } else if (TaskUtil.ASK_TASK_STATU_CONFIRM.equals(askStatu)) {
            buss = "确认申请";
        }
        business.setBusiness(buss);
        return ret;
    }

    @Transactional(rollbackFor = Exception.class)
    public void refuseAskTask(String taskId, String reason, String detailId, CibrSysUser user) {
        /*更新detail状态*/
        CibrTaskDetailDrosophila cibrTaskDetailDrosophila = detailDrosophilaMapper.selectByPrimaryKey(detailId);
        cibrTaskDetailDrosophila.setConfirmstatu("02");
        detailDrosophilaMapper.updateByPrimaryKey(cibrTaskDetailDrosophila);

        CibrTaskDetailDrosophilaExample detailDrosophilaExample = new CibrTaskDetailDrosophilaExample();
        detailDrosophilaExample.createCriteria().andAskidEqualTo(cibrTaskDetailDrosophila.getAskid());
        List<CibrTaskDetailDrosophila> cibrTaskDetailDrosophilas = detailDrosophilaMapper.selectByExample(detailDrosophilaExample);

        boolean hasAllConfirm = true;
        boolean hasSuccFlag = false;
        for (CibrTaskDetailDrosophila tmp : cibrTaskDetailDrosophilas) {
            if ("00".equals(tmp.getConfirmstatu())) {
                hasAllConfirm = false;
            }
            if ("01".equals(tmp.getConfirmstatu())) {
                hasSuccFlag = true;
            }
        }

        CibrSysTask cibrSysTask = taskMapper.selectByPrimaryKey(taskId);
        /*添加失败记录*/
        CibrTaskFail fail = new CibrTaskFail();
        fail.setId(Util.getUUID());
        fail.setCreatetime(new Date());
        fail.setHandler(user.getId());
        fail.setReason(reason);
        fail.setDetailid(detailId);
        failMapper.insert(fail);

        /*如果所有的果蝇请求都处理了，处理任务状态，并给创建者发送邮件*/
        if (hasAllConfirm) {
            allDetailConfirm(taskId, cibrTaskDetailDrosophilas, hasSuccFlag, true, cibrSysTask, user);
        }
    }

    public void allDetailConfirm(String taskId, List<CibrTaskDetailDrosophila> cibrTaskDetailDrosophilas,
                                 boolean hasSuccFlag, boolean hasFailFlag, CibrSysTask cibrSysTask, CibrSysUser user) {
        String taskStatu = TaskUtil.TASK_STATU_TODO;
        String askStatu = "";
        if (hasSuccFlag && hasFailFlag) {
            askStatu = TaskUtil.ASK_TASK_PART_CONFIRM;
        } else if (hasFailFlag && !hasSuccFlag) {
            askStatu = TaskUtil.ASK_TASK_STATU_FAIL;
            taskStatu = TaskUtil.TASK_STATU_FAIL;
        } else if (hasSuccFlag && !hasFailFlag) {
            askStatu = TaskUtil.ASK_TASK_STATU_CONFIRM;
        }
        updateDrosoTask(taskId, taskStatu, askStatu, user);
        /*向申请者发送反馈信息*/
        CibrSysUser creater = userMapper.selectByPrimaryKey(cibrSysTask.getCreateuser());
        StringBuilder contex = new StringBuilder(Util.EMAIL_PREFIX);
        contex.append("您有一个【");
        contex.append(TaskUtil.ASK_TASK_DROSOPHILA);
        contex.append("】已处理，其中：\n");
        int succCount = 0;
        int failCount = 0;
        for (CibrTaskDetailDrosophila tmp : cibrTaskDetailDrosophilas) {
            if ("01".equals(tmp.getConfirmstatu())) {
                succCount++;
            } else if ("02".equals(tmp.getConfirmstatu())) {
                failCount++;
            }
        }
        contex.append("成功【" + succCount + "】条，拒绝【" + failCount + "】条。\n");
        contex.append("请及时查看！");
        contex.append("如有疑问，请联系【");
        contex.append(user.getEmail());
        contex.append("】");
        contex.append(Util.EMAIL_SUFFIX);
        emailService.simpleSendEmail(contex.toString(), creater.getEmail(), Util.EMAIL_SUB_ASKTASK);
    }

    @Transactional(rollbackFor = Exception.class)
    public void confirmTask(String taskid, String detailId, String isNeedMore, String startDate, String endDate, String remarks, CibrSysUser user) throws ParseException {
        /*更新detail状态*/
        CibrTaskDetailDrosophila cibrTaskDetailDrosophila = detailDrosophilaMapper.selectByPrimaryKey(detailId);
        cibrTaskDetailDrosophila.setConfirmstatu("01");
        detailDrosophilaMapper.updateByPrimaryKey(cibrTaskDetailDrosophila);
        /*更新task主表和更新ask表*/
//        Map<String, Object> taskAndAsk = updateDrosoTask(taskid, null, TaskUtil.ASK_TASK_STATU_CONFIRM, user);
//        CibrTaskAskDrosophila ask = (CibrTaskAskDrosophila) taskAndAsk.get("ask");
//        CibrSysTask cibrSysTask =  (CibrSysTask) taskAndAsk.get("task");
        CibrSysTask cibrSysTask = taskMapper.selectByPrimaryKey(taskid);
        CibrTaskAskDrosophila ask = askDrosophilaMapper.selectByPrimaryKey(cibrTaskDetailDrosophila.getAskid());
        CibrTaskAskPrepare prepare = new CibrTaskAskPrepare();
        prepare.setId(Util.getUUID());
        prepare.setAskid(ask.getId());
        prepare.setDetailid(detailId);
        prepare.setNeedmore(isNeedMore);
        prepare.setCreatetime(new Date());
        prepare.setHandler(user.getId());
        if (!StringUtils.isEmpty(startDate)) {
            prepare.setStarttime(Util.str2date(startDate, "yyyy-MM-dd"));
        }
        if (!StringUtils.isEmpty(endDate)) {
            prepare.setEndtime(Util.str2date(endDate, "yyyy-MM-dd"));
        }
        prepare.setRemarks1(remarks);
        prepare.setPrestatu("01");
        prepareMapper.insert(prepare);

        CibrTaskDetailDrosophilaExample detailDrosophilaExample = new CibrTaskDetailDrosophilaExample();
        detailDrosophilaExample.createCriteria().andAskidEqualTo(cibrTaskDetailDrosophila.getAskid());
        List<CibrTaskDetailDrosophila> cibrTaskDetailDrosophilas = detailDrosophilaMapper.selectByExample(detailDrosophilaExample);

        boolean hasAllConfirm = true;
        boolean hasFailFlag = false;
        for (CibrTaskDetailDrosophila tmp : cibrTaskDetailDrosophilas) {
            if ("00".equals(tmp.getConfirmstatu())) {
                hasAllConfirm = false;
            }
            if ("02".equals(tmp.getConfirmstatu())) {
                hasFailFlag = true;
            }
        }
        /*如果所有的果蝇请求都处理了，处理任务状态，并给创建者发送邮件*/
        if (hasAllConfirm) {
            allDetailConfirm(taskid, cibrTaskDetailDrosophilas, true, hasFailFlag, cibrSysTask, user);
        }
    }


    public Map<String, Object> getPrepare(String askId) {
        Map<String, Object> retMap = new HashMap<>();

        CibrTaskAskPrepareExample prepareExample = new CibrTaskAskPrepareExample();
        prepareExample.createCriteria().andAskidEqualTo(askId);
        List<CibrTaskAskPrepare> cibrTaskAskPrepares = prepareMapper.selectByExample(prepareExample);

        CibrStockDrosophilaExample stockDrosophilaExample = new CibrStockDrosophilaExample();
        List<CibrStockDrosophila> cibrStockDrosophilas = stockDrosophilaMapper.selectByExample(stockDrosophilaExample);
        Map<String, CibrStockDrosophila> uuid_stock = new HashMap<String, CibrStockDrosophila>();
        for (CibrStockDrosophila stock : cibrStockDrosophilas) {
            uuid_stock.put(stock.getId(), stock);
        }

        CibrAnimalDrosophilaExample animalDrosophilaExample = new CibrAnimalDrosophilaExample();
        List<CibrAnimalDrosophila> cibrAnimalDrosophilas = drosophilaMapper.selectByExample(animalDrosophilaExample);
        Map<String, CibrAnimalDrosophila> uuid_animal = new HashMap<String, CibrAnimalDrosophila>();
        for (CibrAnimalDrosophila animal : cibrAnimalDrosophilas) {
            uuid_animal.put(animal.getId(), animal);
        }

        CibrTaskDetailDrosophilaExample detailDrosophilaExample = new CibrTaskDetailDrosophilaExample();
        List<CibrTaskDetailDrosophila> cibrTaskDetailDrosophilas = detailDrosophilaMapper.selectByExample(detailDrosophilaExample);
        Map<String, CibrTaskDetailDrosophila> uuid_detail = new HashMap<String, CibrTaskDetailDrosophila>();
        for (CibrTaskDetailDrosophila detail : cibrTaskDetailDrosophilas) {
            uuid_detail.put(detail.getId(), detail);
        }

        List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
        for (CibrTaskAskPrepare prepare : cibrTaskAskPrepares) {
            Map<String, Object> row = new HashMap<>();
            CibrTaskDetailDrosophila detailDrosophila = uuid_detail.get(prepare.getDetailid());
            CibrStockDrosophila stockDrosophila = uuid_stock.get(detailDrosophila.getStockid());
            CibrAnimalDrosophila animalDrosophila = uuid_animal.get(stockDrosophila.getDrosophilaId());
            if ("03".equals(prepare.getPrestatu()) || "04".equals(prepare.getPrestatu())) {
                CibrTaskAskConfirmExample confirmExample = new CibrTaskAskConfirmExample();
                confirmExample.createCriteria().andPrepareidEqualTo(prepare.getId());
                List<CibrTaskAskConfirm> cibrTaskAskConfirms = confirmMapper.selectByExample(confirmExample);
                row.put("confirm", cibrTaskAskConfirms.get(0));
            }
            row.put("animal", animalDrosophila);
            row.put("prepare", prepare);
            rows.add(row);
        }
        retMap.put("rows", rows);
        return retMap;
    }

    @Transactional(rollbackFor = Exception.class)
    public void confrimPrepare(String prepId, String readyTime, String allowTime, String remarks, Integer realAge, Integer realNumber, CibrSysUser user) throws ParseException {
        CibrTaskAskPrepare prepare = prepareMapper.selectByPrimaryKey(prepId);
        prepare.setPrestatu("02");
        prepare.setCompletetime(Util.str2date(readyTime, "yyyy-MM-dd"));
        prepare.setRealexptime(Util.str2date(allowTime, "yyyy-MM-dd"));
        prepare.setReamrks2(remarks);
        prepare.setRealage(String.valueOf(realAge));
        prepare.setRealnumber(String.valueOf(realNumber));
        prepare.setUpdateuser(user.getId());
        prepare.setUpdatetime(new Date());

        prepareMapper.updateByPrimaryKey(prepare);

        CibrTaskAskPrepareExample prepareExample = new CibrTaskAskPrepareExample();
        prepareExample.createCriteria().andAskidEqualTo(prepare.getAskid());
        List<CibrTaskAskPrepare> cibrTaskAskPrepares = prepareMapper.selectByExample(prepareExample);
        boolean hasAllDeal = true;
        for (CibrTaskAskPrepare tmp : cibrTaskAskPrepares) {
            if (prepId.equals(tmp.getId())) {
                continue;
            }
            if ("01".equals(tmp.getPrestatu())) {
                hasAllDeal = false;
            }
        }

        CibrTaskAskDrosophila askDrosophila = askDrosophilaMapper.selectByPrimaryKey(prepare.getAskid());

        if (hasAllDeal) {
            updateDrosoTask(askDrosophila.getTaskid(), null, TaskUtil.ASK_TASK_PREPARED, user);
            StringBuilder contex = new StringBuilder(Util.EMAIL_PREFIX);
            contex.append("您有一个【");
            contex.append(TaskUtil.ASK_TASK_DROSOPHILA);
            contex.append("】已准备完毕，请及时查看。");
            contex.append("\n如有疑问，请联系【");
            contex.append(user.getEmail());
            contex.append("】");
            contex.append(Util.EMAIL_SUFFIX);
            emailService.simpleSendEmail(contex.toString(), user.getEmail(), Util.EMAIL_SUB_ASKTASK);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void createrConfirmTask(String prepareId, String isComplete, String remarks, CibrSysUser user) {
        CibrTaskAskPrepare prepare = prepareMapper.selectByPrimaryKey(prepareId);
        CibrTaskAskConfirm confirm = new CibrTaskAskConfirm();
        confirm.setCreater(user.getId());
        confirm.setCreatetime(new Date());
        confirm.setIscomplete(isComplete);
        confirm.setPrepareid(prepareId);
        confirm.setRemarks(remarks);
        confirm.setId(Util.getUUID());
        confirmMapper.insert(confirm);

        CibrTaskAskPrepareExample prepareExample = new CibrTaskAskPrepareExample();
        prepareExample.createCriteria().andAskidEqualTo(prepare.getAskid());
        List<CibrTaskAskPrepare> cibrTaskAskPrepares = prepareMapper.selectByExample(prepareExample);
        boolean hasAllConfirm = true;
        boolean hasYes = false;
        boolean hasNo = false;
        for (CibrTaskAskPrepare tmp : cibrTaskAskPrepares) {
            if (prepareId.equals(tmp.getId())) {
                continue;
            }
            if ("02".equals(tmp.getPrestatu())) {
                hasAllConfirm = false;
                break;
            }
            if ("05".equals(tmp.getPrestatu())) {
                hasYes = true;
            }
            if ("04".equals(tmp.getPrestatu())) {
                hasNo = true;
            }
        }
        if ("Y".equals(isComplete)) {
            prepare.setPrestatu("05");
            hasYes = true;
        } else {
            hasNo = true;
            prepare.setPrestatu("04");
        }
        prepareMapper.updateByPrimaryKey(prepare);
        if (hasAllConfirm) {
            String taskType = TaskUtil.TASK_STATU_SUCCESS;
            String askType = "";
            if (hasYes && hasNo) {
                askType = TaskUtil.ASK_TASK_ASKER_PART_CONFIRM;
            } else if (hasYes & !hasNo) {
                askType = TaskUtil.ASK_TASK_ASKER_CONFIRM;
            } else {
                askType = TaskUtil.ASK_TASK_ASKER_ALL_REFUSE;
                taskType = TaskUtil.TASK_STATU_FAIL;
            }
            CibrTaskAskDrosophila askDrosophila = askDrosophilaMapper.selectByPrimaryKey(prepare.getAskid());
            updateDrosoTask(askDrosophila.getTaskid(), taskType, askType, user);
        }
    }

    public Map<String, Object> getUserAllowTask(String taskId) {
        Map<String, Object> retMap = new HashMap<String, Object>();
        CibrSysTask task = taskMapper.selectByPrimaryKey(taskId);
        CibrSysUser user = userMapper.selectByPrimaryKey(task.getCreateuser());
        CibrSysRoleExample roleExample = new CibrSysRoleExample();
        roleExample.createCriteria().andRoletypeNotEqualTo("999999");
        List<CibrSysRole> cibrSysRoles = roleMapper.selectByExample(roleExample);
        if (TaskUtil.TASK_STATU_FAIL.equals(task.getTaskstatu())) {
            CibrTaskFailExample failExample = new CibrTaskFailExample();
            failExample.createCriteria().andDetailidEqualTo(taskId);
            List<CibrTaskFail> cibrTaskFails = failMapper.selectByExample(failExample);
            retMap.put("fail", cibrTaskFails.get(0));
        }
        CibrSysUserGroup group = groupMapper.selectByPrimaryKey(user.getRoleid());
        List<CibrSysUser> reviewers = userService.findUserByRoleAndGroup(Util.ROLE_TYPE_REVIEWER, group.getGroupname());
        retMap.put("task", task);
        retMap.put("creater", user);
        retMap.put("reviewers", reviewers);
        retMap.put("roles", cibrSysRoles);
        return retMap;
    }

    @Transactional(rollbackFor = Exception.class)
    public void refuseUserAllow(String taskId, String reason, String remarks, CibrSysUser user) {
        CibrSysTaskBusiness business = new CibrSysTaskBusiness();
        /*更新任务表状态*/
        CibrSysTask task = taskMapper.selectByPrimaryKey(taskId);
        business.setPrestatu(task.getTaskstatu());
        task.setHandletime(new Date());
        task.setTaskstatu(TaskUtil.TASK_STATU_FAIL);
        taskMapper.updateByPrimaryKey(task);

        /*更新用户状态*/
        CibrSysUser cibrSysUser = userMapper.selectByPrimaryKey(task.getCreateuser());
        cibrSysUser.setUserstatu("3");
        userMapper.updateByPrimaryKey(cibrSysUser);

        /*增加失败记录*/
        CibrTaskFail fail = new CibrTaskFail();
        fail.setId(Util.getUUID());
        fail.setDetailid(taskId);
        fail.setReason(reason);
        fail.setHandler(user.getId());
        fail.setCreatetime(new Date());
        fail.setRemarks(remarks);
        failMapper.insert(fail);

        /*增加操作记录*/
        business.setBusiness("拒绝注册申请");
        business.setUserid(user.getId());
        business.setId(Util.getUUID());
        business.setNextstatu(TaskUtil.TASK_STATU_FAIL);
        business.setTaskid(taskId);
        business.setCreatetime(new Date());
        businessMapper.insert(business);

        /*发送拒绝申请邮件*/
        StringBuilder contex = new StringBuilder(Util.EMAIL_PREFIX);
        contex.append("非常抱歉！您有一个【");
        contex.append(TaskUtil.TASK_CREATE_USER);
        contex.append("】被【拒绝】，原因：【" + reason + "】");
        contex.append("\n如有疑问，请联系【");
        contex.append(user.getEmail());
        contex.append("】");
        contex.append(Util.EMAIL_SUFFIX);
        emailService.simpleSendEmail(contex.toString(), cibrSysUser.getEmail(), Util.USER_CREATE);
    }

    @Transactional(rollbackFor = Exception.class)
    public void allowCreateUser(List<String> roles, String taskId, CibrSysUser user) {
        CibrSysTaskBusiness business = new CibrSysTaskBusiness();
        /*更新任务表状态*/
        CibrSysTask task = taskMapper.selectByPrimaryKey(taskId);
        business.setPrestatu(task.getTaskstatu());
        task.setHandletime(new Date());
        task.setTaskstatu(TaskUtil.TASK_STATU_SUCCESS);
        taskMapper.updateByPrimaryKey(task);

        /*更新用户状态*/
        CibrSysUser cibrSysUser = userMapper.selectByPrimaryKey(task.getCreateuser());
        cibrSysUser.setUserstatu("2");
        userMapper.updateByPrimaryKey(cibrSysUser);

        /*增加操作记录*/
        business.setBusiness("同意注册");
        business.setUserid(user.getId());
        business.setId(Util.getUUID());
        business.setNextstatu(TaskUtil.TASK_STATU_SUCCESS);
        business.setTaskid(taskId);
        business.setCreatetime(new Date());
        businessMapper.insert(business);

        /*增加权限关联表*/
        List<CibrSysUserRole> list = new ArrayList<CibrSysUserRole>();
        for (String roleId : roles) {
            CibrSysUserRole userRole = new CibrSysUserRole();
            userRole.setUserid(task.getCreateuser());
            userRole.setRoleid(roleId);
            list.add(userRole);
        }
        userRoleMapper.batchInsert(list);

        /*发送邮件提醒用户注册成功*/
        StringBuilder contex = new StringBuilder(Util.EMAIL_PREFIX);
        contex.append("您有一个【");
        contex.append(TaskUtil.TASK_CREATE_USER);
        contex.append("】已审批通过，欢迎使用。");
        contex.append("\n如有疑问，请联系【");
        contex.append(user.getEmail());
        contex.append("】");
        contex.append(Util.EMAIL_SUFFIX);
        emailService.simpleSendEmail(contex.toString(), cibrSysUser.getEmail(), Util.USER_CREATE);
    }


    public Map<String, Object> findPartnerDetail(String taskId) {
        Map<String, Object> retMap = new HashMap<>();
        CibrTaskPartnerExample partnerExample = new CibrTaskPartnerExample();
        partnerExample.createCriteria().andTaskidEqualTo(taskId);
        List<CibrTaskPartner> partners = partnerMapper.selectByExample(partnerExample);
        if (partners == null || partners.size() == 0) {
            return null;
        }
        CibrTaskPartner partner = partners.get(0);
        CibrSysUser creater = userMapper.selectByPrimaryKey(partner.getCreater());
        String[] recordIds = partner.getRecordid().split("##");

        CibrRecordMeterialExample example = new CibrRecordMeterialExample();
        example.createCriteria().andIdIn(Arrays.asList(recordIds));
        example.setOrderByClause("startTime");
        List<CibrRecordMeterial> recordMeterials = recordMeterialMapper.selectByExample(example);
        retMap.put("creater", creater);
        retMap.put("records", recordMeterials);
        retMap.put("partner", partner);
        if ("02".equals(partner.getTaskstatu())) {
            CibrTaskFailExample failExample = new CibrTaskFailExample();
            failExample.createCriteria().andDetailidEqualTo(partner.getId());
            List<CibrTaskFail> cibrTaskFails = failMapper.selectByExample(failExample);
            retMap.put("fail", cibrTaskFails.get(0));
        }
        CibrSysTask task = taskMapper.selectByPrimaryKey(taskId);
        retMap.put("task", task);

        CibrSysUser user = userMapper.selectByPrimaryKey(task.getCurrentuser());
        retMap.put("supporter", user);
        return retMap;
    }

    @Transactional(rollbackFor = Exception.class)
    public void refusePartner(String partnerId, String reason, String remarks, CibrSysUser user) {
        CibrTaskPartner partner = partnerMapper.selectByPrimaryKey(partnerId);
        partner.setTaskstatu(TaskUtil.PARTNER_TASK_FAIL);

        CibrSysTask task = taskMapper.selectByPrimaryKey(partner.getTaskid());
        task.setHandletime(new Date());
        task.setTaskstatu(TaskUtil.TASK_STATU_FAIL);
        task.setTaskdesc(reason);
        taskMapper.updateByPrimaryKey(task);

        String[] records = partner.getRecordid().split("##");
        CibrRecordMeterialExample example = new CibrRecordMeterialExample();
        example.createCriteria().andIdIn(Arrays.asList(records));
        List<CibrRecordMeterial> recordMeterials = recordMeterialMapper.selectByExample(example);
        String rem = "";
        for (CibrRecordMeterial record : recordMeterials) {
            rem += "自 " + TimeUtil.date2str(record.getStarttime(), "yyyy-MM-dd HH:00")
                    + " 到 " + TimeUtil.date2str(record.getEndtime(), "yyyy-MM-dd HH:00")
                    + "    ";
        }
        partner.setRemark(rem);
        partnerMapper.updateByPrimaryKey(partner);
        recordMeterialMapper.deleteByExample(example);

        CibrTaskFail fail = new CibrTaskFail();
        fail.setId(Util.getUUID());
        fail.setRemarks(remarks);
        fail.setReason(reason);
        fail.setCreatetime(new Date());
        fail.setHandler(user.getId());
        fail.setDetailid(partnerId);
        failMapper.insert(fail);

        CibrSysUser creater = userMapper.selectByPrimaryKey(partner.getCreater());
        String content = Util.EMAIL_PREFIX;
        content += "您的协助请求被拒绝，请求协助时间【" + rem +
                "】，原因【" + reason + "】。" + Util.EMAIL_SUFFIX;
        emailService.simpleSendEmail(content, creater.getEmail(), TaskUtil.TASK_PARTNER);
    }

    @Transactional(rollbackFor = Exception.class)
    public void acceptPartner(String partnerId, CibrSysUser user) {
        CibrTaskPartner partner = partnerMapper.selectByPrimaryKey(partnerId);
        partner.setTaskstatu(TaskUtil.PARTNER_TASK_COMFIRM);

        CibrSysTask task = taskMapper.selectByPrimaryKey(partner.getTaskid());
        task.setHandletime(new Date());
        task.setTaskstatu(TaskUtil.TASK_STATU_SUCCESS);
        taskMapper.updateByPrimaryKey(task);
        String[] records = partner.getRecordid().split("##");
        CibrRecordMeterialExample example = new CibrRecordMeterialExample();
        example.createCriteria().andIdIn(Arrays.asList(records));
        List<CibrRecordMeterial> recordMeterials = recordMeterialMapper.selectByExample(example);
        String rem = "";
        for (CibrRecordMeterial record : recordMeterials) {
            rem += "自 " + TimeUtil.date2str(record.getStarttime(), "yyyy-MM-dd HH:00")
                    + " 到 " + TimeUtil.date2str(record.getEndtime(), "yyyy-MM-dd HH:00")
                    + "    ";
        }
        partner.setRemark(rem);
        partnerMapper.updateByPrimaryKey(partner);

        CibrSysUser creater = userMapper.selectByPrimaryKey(partner.getCreater());
        String content = Util.EMAIL_PREFIX;
        content += "您的协助请求已接受！请求协助时间【" + rem + "】" + Util.EMAIL_SUFFIX;
        emailService.simpleSendEmail(content, creater.getEmail(), TaskUtil.TASK_PARTNER);
    }

    /***
     * 导入果蝇预约任务
     * @param user
     * @param file
     */
    @Transactional(rollbackFor = Exception.class)
    public void importOrderTask(CibrSysUser user, MultipartFile file) throws ParseException {
        CibrSysTask task = new CibrSysTask();
        task.setId(Util.getUUID());
        task.setTaskstatu(TaskUtil.ASK_TASK_STATU_TODO);
        task.setCreatetime(new Date());
        task.setCreateuser(user.getId());
        task.setTasktype(TaskUtil.ASK_TASK);

        CibrTaskAskDrosophila askDrosophila = new CibrTaskAskDrosophila();
        askDrosophila.setCreater(user.getId());
        askDrosophila.setId(Util.getUUID());
        askDrosophila.setCreatetime(new Date());
        askDrosophila.setTaskid(task.getId());
        askDrosophila.setCurrentstatu(TaskUtil.ASK_TASK_STATU_UNDO);

        List<MultipartFile> files = new ArrayList<>();
        files.add(file);
        File dist = fileService.saveFile(files, task.getId(), user);
        List<List<String>> rows = FileUtil.getRows(dist);

        List<CibrTaskDetailDrosophila> details = new ArrayList<>();
        Set<String> expers = new HashSet<>();
        String supporter = null;

        List<CibrAnimalDrosophila> cibrAnimalDrosophilas = drosophilaMapper.selectAll();
        Map<String, CibrAnimalDrosophila> stockId_animal = new HashMap<>();
        for (CibrAnimalDrosophila drosophila : cibrAnimalDrosophilas) {
            stockId_animal.put(drosophila.getSelfindex(), drosophila);
        }
        List<CibrStockDrosophila> cibrStockDrosophilas = stockDrosophilaMapper.selectAllStocks(null);
        Map<String, CibrStockDrosophila> stockid_stock = new HashMap<>();
        for (CibrStockDrosophila stock : cibrStockDrosophilas) {
            stockid_stock.put(stock.getStockindex(), stock);
        }

        for (List<String> row : rows) {
            CibrTaskDetailDrosophila detail = new CibrTaskDetailDrosophila();
            int index = 3;
            if (StringUtils.isEmpty(row.get(index))) {
                continue;
            }
            detail.setId(Util.getUUID());
            detail.setAskid(askDrosophila.getId());
            detail.setConfirmstatu("00");
            detail.setPurpose(Util.nullToStr(row.get(index++)));
//            detail.setStockid(stockid_stock.get(Util.nullToStr(row.get(5))).getId());
            detail.setVirginfly(Util.yesOrNo(row.get(index++)));
            detail.setGender(Util.isMale(row.get(index++)));
            detail.setIshybridizationnecessary(Util.yesOrNo(row.get(index++)));
            String xStrain = row.get(index++);
            if (!StringUtils.isEmpty(Util.nullToStr(xStrain))) {
                detail.setHybridstrain(stockId_animal.get(Util.nullToStr(xStrain)).getId());
            }
            detail.setSpecialfeeding(Util.yesOrNo(row.get(index++)));
            detail.setSpecificfeeding(Util.nullToStr(row.get(index++)));
            detail.setAge(Util.nullToStr(row.get(index++)));
            detail.setOrdernumber(Util.nullToStr(row.get(index++)));
            detail.setExpectedtime(TimeUtil.str2date(Util.nullToStr(row.get(index++)), "yyyy/MM/dd"));
            detail.setOperationprocess(Util.nullToStr(row.get(index++)));
            index++;
            detail.setStockid(stockid_stock.get(Util.nullToStr(row.get(index++))).getId());
            if (StringUtils.isEmpty(detail.getStockid())) {
                continue;
            }
            details.add(detail);
            if (StringUtils.isEmpty(supporter)) {
                supporter = Util.nullToStr(row.get(14));
            }
            expers.add(Util.nullToStr(row.get(2)));
        }

        detailDrosophilaMapper.batchInsert(details);

        Map<String, CibrSysUser> name_user = userService.getName_User();
        List<CibrTaskAskDirector> directors = new ArrayList<>();

        for (String name : expers) {
            CibrSysUser exp = name_user.get(name);
            CibrTaskAskDirector director = new CibrTaskAskDirector();
            director.setId(Util.getUUID());
            director.setCreatetime(new Date());
            director.setCurstatu("00");
            director.setTaskid(askDrosophila.getId());
            director.setUserid(exp.getId());
            directors.add(director);
        }
        askDirectorMapper.batchInsert(directors);
        askDrosophila.setCurrenthandler(name_user.get(supporter).getId());
        task.setCurrentuser(name_user.get(supporter).getId());

        taskMapper.insert(task);
        askDrosophilaMapper.insert(askDrosophila);

        /*给饲养员发邮件提醒*/
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("creater", user.getName());
        String context = Util.getAskTaskTemplate(map);
        CibrSysUser supper = name_user.get(supporter);
        emailService.simpleSendEmail(context, supper.getEmail(), Util.EMAIL_SUB_ASKTASK);
    }

    public int findSelfTaskNumber(String userId) {
        Map cod = new HashMap();
        cod.put("userId", userId);
        cod.put("taskstatu", TaskUtil.TASK_STATU_TODO);
        return taskMapper.selectCount(cod);
    }

    public void cancelPartner(String partnerId, CibrSysUser user) {
        CibrTaskPartner partner = partnerMapper.selectByPrimaryKey(partnerId);
        partner.setTaskstatu(TaskUtil.PARTNER_TASK_CANCEL);
        CibrSysTask task = taskMapper.selectByPrimaryKey(partner.getTaskid());
        task.setHandletime(new Date());
        task.setTaskstatu(TaskUtil.TASK_STATU_FAIL);
        task.setTaskdesc("已取消");
        taskMapper.updateByPrimaryKey(task);

        String[] records = partner.getRecordid().split("##");
        CibrRecordMeterialExample example = new CibrRecordMeterialExample();
        example.createCriteria().andIdIn(Arrays.asList(records));
        List<CibrRecordMeterial> recordMeterials = recordMeterialMapper.selectByExample(example);
        String rem = "";
        for (CibrRecordMeterial record : recordMeterials) {
            rem += "自 " + TimeUtil.date2str(record.getStarttime(), "yyyy-MM-dd HH:00")
                    + " 到 " + TimeUtil.date2str(record.getEndtime(), "yyyy-MM-dd HH:00")
                    + "    ";
        }
        partner.setRemark(rem);
        partnerMapper.updateByPrimaryKey(partner);
        recordMeterialMapper.deleteByExample(example);

        CibrSysUser curent = userMapper.selectByPrimaryKey(task.getCurrentuser());
        String content = Util.EMAIL_PREFIX;
        content += "您的协助请求任务已取消！请求协助时间【" + rem + "】" + Util.EMAIL_SUFFIX;
        emailService.simpleSendEmail(content, curent.getEmail(), TaskUtil.TASK_PARTNER);
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteTask(String taskId, CibrSysUser user) {
        CibrSysTaskBusiness taskBusiness = new CibrSysTaskBusiness();
        CibrSysTask task = taskMapper.selectByPrimaryKey(taskId);
        taskBusiness.setPrestatu(task.getTaskstatu());
        task.setTaskstatu(TaskUtil.TASK_STATU_DELETE);
        taskMapper.updateByPrimaryKey(task);
        taskBusiness.setNextstatu(TaskUtil.TASK_STATU_DELETE);
        taskBusiness.setUserid(user.getId());
        taskBusiness.setCreatetime(new Date());
        taskBusiness.setBusiness("删除任务");
        taskBusiness.setTaskid(taskId);
        taskBusiness.setId(Util.getUUID());
        businessMapper.insert(taskBusiness);
    }

    public List<CibrTaskDetailDrosophila> selectAskTaskDetail(String taskId) {
        CibrSysTask task = taskMapper.selectByPrimaryKey(taskId);
        CibrTaskAskDrosophilaExample example = new CibrTaskAskDrosophilaExample();
        example.createCriteria().andTaskidEqualTo(taskId);
        List<CibrTaskAskDrosophila> cibrTaskAskDrosophilas = askDrosophilaMapper.selectByExample(example);
        CibrTaskAskDrosophila ask = null;
        if (cibrTaskAskDrosophilas != null && cibrTaskAskDrosophilas.size() > 0) {
            ask = cibrTaskAskDrosophilas.get(0);
        }
        List<CibrTaskDetailDrosophila> details = detailDrosophilaMapper.selectAllDetailByTaskId(ask.getId());
        CibrTaskAskDirectorExample directorExample = new CibrTaskAskDirectorExample();
        directorExample.createCriteria().andTaskidEqualTo(ask.getId());
        List<CibrTaskAskDirector> directors = askDirectorMapper.selectByExample(directorExample);
        List<String> ids = directors.stream().map(CibrTaskAskDirector::getUserid).collect(Collectors.toList());
        details.forEach(detail -> {
            detail.setDirectors(ids);
            detail.setSupporter(task.getCurrentuser());
        });
        return details;
    }

    public CibrTaskAskDrosophila findaskTask(String taskId) {
        CibrTaskAskDrosophilaExample example = new CibrTaskAskDrosophilaExample();
        example.createCriteria().andTaskidEqualTo(taskId);
        List<CibrTaskAskDrosophila> cibrTaskAskDrosophilas = askDrosophilaMapper.selectByExample(example);
        CibrTaskAskDrosophila ask = null;
        if (cibrTaskAskDrosophilas != null && cibrTaskAskDrosophilas.size() > 0) {
            ask = cibrTaskAskDrosophilas.get(0);
        }
        return ask;
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateDetails(List<CibrTaskDetailDrosophila> detailList, CibrSysUser user) {
        detailDrosophilaMapper.batchUpdate(detailList);
    }

    public List<CibrTaskAskPrepare> getAllPrepares(String taskId) {
        CibrTaskAskDrosophila ask = findaskTask(taskId);
        return prepareMapper.getAllPrepare(ask.getId());
    }

    public void updatePrepares(List<CibrTaskAskPrepare> prepareList) {
        prepareMapper.batchUpdate(prepareList);
    }

    public CibrSysTask findTask(String taskId) {
        return taskMapper.selectByPrimaryKey(taskId);
    }

    @Transactional(rollbackFor = Exception.class)
    public void refusePrepare(List<String> ids, String reason, String remark, CibrSysUser user) {
        CibrTaskAskPrepareExample example = new CibrTaskAskPrepareExample();
        example.createCriteria().andIdIn(ids);
        List<CibrTaskAskPrepare> prepareList = prepareMapper.selectByExample(example);
        prepareList.forEach(pre -> pre.setPrestatu("03"));
        prepareMapper.batchUpdate(prepareList);
        List<CibrTaskFail> list = new ArrayList<>();
        for (String id : ids) {
            CibrTaskFail fail = new CibrTaskFail();
            fail.setId(Util.getUUID());
            fail.setCreatetime(new Date());
            fail.setHandler(user.getId());
            fail.setReason(reason);
            fail.setRemarks(remark);
            fail.setDetailid(id);
            list.add(fail);
        }
        failMapper.batchInsert(list);
        CibrTaskAskPrepareExample prepareExample = new CibrTaskAskPrepareExample();
        prepareExample.createCriteria().andAskidEqualTo(prepareList.get(0).getAskid());
        List<CibrTaskAskPrepare> prepareList1 = prepareMapper.selectByExample(prepareExample);
        boolean hasAllDeal = true;
        for (CibrTaskAskPrepare prepare : prepareList) {
            if (ids.contains(prepare.getId())) {
                continue;
            }
            if ("01".equals(prepare.getPrestatu())) {
                hasAllDeal = false;
            }
        }
        if (hasAllDeal) {
            CibrTaskAskDrosophila ask = askDrosophilaMapper.selectByPrimaryKey(prepareList.get(0).getAskid());
            ask.setCurrentstatu(TaskUtil.ASK_TASK_PREPARED);
            askDrosophilaMapper.updateByPrimaryKey(ask);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void finalConfirm(String askId, String flag, String remark, CibrSysUser user) {
        CibrTaskAskDrosophila ask = askDrosophilaMapper.selectByPrimaryKey(askId);
        CibrSysTask task = taskMapper.selectByPrimaryKey(ask.getTaskid());
        if ("N".equals(flag)) {
            ask.setCurrentstatu(TaskUtil.ASK_TASK_ASKER_ALL_REFUSE);
            task.setTaskstatu(TaskUtil.TASK_STATU_FAIL);
        } else {
            ask.setCurrentstatu(TaskUtil.ASK_TASK_ASKER_CONFIRM);
            task.setTaskstatu(TaskUtil.TASK_STATU_SUCCESS);
        }
        CibrTaskAskConfirm confirm = new CibrTaskAskConfirm();
        confirm.setId(Util.getUUID());
        confirm.setPrepareid(askId);
        confirm.setRemarks(remark);
        confirm.setIscomplete(flag);
        confirm.setCreatetime(new Date());
        confirm.setCreater(user.getId());
        confirmMapper.insert(confirm);
        taskMapper.updateByPrimaryKey(task);
        askDrosophilaMapper.updateByPrimaryKey(ask);
    }

    public CibrTaskAskConfirm findconfirm(String id) {
        CibrTaskAskConfirmExample example = new CibrTaskAskConfirmExample();
        example.createCriteria().andPrepareidEqualTo(id);
        List<CibrTaskAskConfirm> list = confirmMapper.selectByExample(example);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Transactional(rollbackFor = Exception.class)
    public void submitShare(List<String> sharesIds, String taskId, CibrSysUser user) {
        List<CibrTaskShare> shares = new ArrayList<>();
        CibrTaskShareExample shareExample = new CibrTaskShareExample();
        shareExample.createCriteria().andTaskidEqualTo(taskId);
        List<CibrTaskShare> db_shares = shareMapper.selectByExample(shareExample);
        List<String> userIds = new ArrayList<>();
        if (db_shares != null && db_shares.size()>0){
            db_shares.forEach(share -> userIds.add(share.getShareuser()));
        }
        for (String userId : sharesIds){
            if (userIds.contains(userId)){
                continue;
            }
            CibrTaskShare share = new CibrTaskShare();
            share.setId(Util.getUUID());
            share.setShareuser(userId);
            share.setCreater(user.getId());
            share.setTaskid(taskId);
            share.setCreatetime(new Date());
            shares.add(share);
        }
        if (shares.size() > 0){
            shareMapper.batchInsert(shares);
        }
    }

    public Map<String,String> getTodoCount(List<String> ids, CibrSysUser user) {
        Map<String,String> retMap = new HashMap<>();
        for (String processId : ids){
            Map<String, Object> map = processTaskService.countTaskNum(processId, user);
            Map<String, String> todoNum = (Map<String, String>) map.get("todoNum");
            int todoAll = 0;
            for (String key : todoNum.keySet()){
                todoAll += Integer.parseInt(String.valueOf(todoNum.get(key)));
            }
            Map<String, String> checkNum = (Map<String, String>) map.get("checkNum");
            int checkAll = 0;
            for (String key : checkNum.keySet()){
                checkAll += Integer.parseInt(String.valueOf(checkNum.get(key)));
            }
            retMap.put(processId,String.valueOf(todoAll + checkAll));
        }
        return retMap;
    }
}



























