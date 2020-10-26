package com.cibr.animal.demo.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cibr.animal.demo.dao.*;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.*;
import com.cibr.animal.demo.util.exception.CommonException;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactory;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProcessTaskService {

    @Autowired
    private CibrSysTaskMapper cibrSysTaskMapper;

    @Autowired
    private CibrTaskProcessMapper processMapper;

    @Autowired
    private CibrTaskProcessEmailMapper processEmailMapper;

    @Autowired
    private CibrSysTaskBusinessMapper businessMapper;

    @Autowired
    private EmailService emailService;

    @Autowired
    private CibrSysUserService userService;

    @Autowired
    private CibrTaskProcessSampleinputMapper sampleinputMapper;

    @Autowired
    private CibrTaskProcessSamplemakeMapper makeMapper;

    @Autowired
    private CibrTaskProcessLibraryMapper libraryMapper;

    @Autowired
    private CibrTaskProcessDismountdataMapper dismountdataMapper;

    @Autowired
    private CibrTaskProcessAnalysisMapper analysisMapper;

    @Autowired
    private CibrTaskProcessSubtaskMapper subtaskMapper;

    @Autowired
    private CibrSysSampleindexMapper sampleindexMapper;

    @Autowired
    private FileService fileService;

    @Autowired
    private CibrTaskFailMapper failMapper;

    @Autowired
    private CibrSysUserMapper userMapper;

    @Autowired
    private FreeMarkerConfigurationFactory freeMarkerConfigurationFactory;

    @Transactional(rollbackFor = Exception.class)
    public void createProcessTask(CibrSysUser user, String projectName, String dataType, String principal,
                                  List<String> emails, String sampleMsg, String sampleInput, String samplePreparation,
                                  String libraryPreparation, String dismountData, String bioinformaticsAnalysis,
                                  String remarks, String projectDesc, HttpServletRequest request) throws IOException, TemplateException {
        CibrSysUserGroup group = userService.getGroupByName("基因组学中心");
        CibrSysUser groupAdmin = userMapper.selectByPrimaryKey(group.getGroupadmin());
        CibrSysUser userGroupAdmin = userService.getGroupAdmin(user.getId());

        /*任务主表*/
        CibrSysTask task = new CibrSysTask();
        String taskId = Util.getUUID();
        task.setId(taskId);
        task.setTaskstatu(TaskUtil.TASK_STATU_TODO);
        task.setCurrentuser(group.getGroupadmin());
        task.setCreatetime(new Date());
        task.setCreateuser(user.getId());
        task.setTasktype(TaskUtil.PROCESS_TASK);
        task.setTaskdesc(remarks);
        cibrSysTaskMapper.insert(task);
        /*流程任务表*/
        CibrTaskProcess process = new CibrTaskProcess();
        String processId = Util.getUUID();
        process.setId(processId);
        process.setTaskid(taskId);
        process.setCreater(user.getId());
        process.setCreatetime(new Date());
        process.setProjectname(projectName);
        process.setDatatype(dataType);
        process.setPrincipal(principal);
        process.setSampletype(sampleMsg);
        process.setSampleinput(sampleInput);
        process.setSamplepreparation(samplePreparation);
        process.setLibrarypreparation(libraryPreparation);
        process.setDismountdata(dismountData);
        process.setBioinformaticsanalysis(bioinformaticsAnalysis);
        process.setRemarks(remarks);
        process.setProjectdesc(projectDesc);
        if (user.getId().equals(userGroupAdmin.getId())){
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_PICONFIRM);
        }else if (user.getId().equals(groupAdmin.getId())){
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SPWAIT);
        }else {
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SP);
        }
        process.setEmails(emails);
        processMapper.insert(process);
        List<CibrTaskProcessEmail> list = new ArrayList<CibrTaskProcessEmail>();
        for (String email : emails){
            CibrTaskProcessEmail processEmail = new CibrTaskProcessEmail();
            processEmail.setProcessid(processId);
            processEmail.setEmail(email);
            list.add(processEmail);
        }
        processEmailMapper.batchInsert(list);

        CibrSysTaskBusiness business = new CibrSysTaskBusiness();
        business.setTaskid(taskId);
        business.setPrestatu(TaskUtil.TASK_STATU_TODO);
        business.setNextstatu(TaskUtil.TASK_STATU_TODO);
        business.setId(Util.getUUID());
        business.setCreatetime(new Date());
        business.setUserid(user.getId());
        business.setBusiness("创建流程管理任务");
        businessMapper.insert(business);

//        List<String> userIds = new ArrayList<String>();
//        userIds.add(samplePreparation);
//        userIds.add(libraryPreparation);
//        userIds.add(dismountData);
//        userIds.add(bioinformaticsAnalysis);
//        List<CibrSysUser> users = userService.findUserByIds(userIds);
//        List<String> addrs = new ArrayList<String>();
//        for (CibrSysUser cibrSysUser : users){
//            addrs.add(cibrSysUser.getEmail());
//        }
        if(!user.getId().equals(userGroupAdmin.getId())){
            this.sendPiConfirmEmail(process,user,request);
        }

        StringBuilder sb = new StringBuilder(Util.EMAIL_PREFIX);
        sb.append("您有一个【" + TaskUtil.TASK_PROCESS + "】待处理，请及时查看！");
        sb.append("\n如有疑问，请联系【");
        sb.append(user.getEmail());
        sb.append("】");
        sb.append(Util.EMAIL_SUFFIX);
        emailService.simpleSendEmail(sb.toString(),groupAdmin.getEmail(),TaskUtil.TASK_PROCESS);

        String createrEmail = "";
        createrEmail += Util.EMAIL_PREFIX + "您的测序任务【" + projectName + "】提交成功！" +
                "\n如有疑问，请联系【" + groupAdmin.getEmail() + "】" + Util.EMAIL_SUFFIX;
        emailService.simpleSendEmail(createrEmail,user.getEmail(),TaskUtil.TASK_PROCESS);
    }

    private void sendPiConfirmEmail(CibrTaskProcess process,CibrSysUser user,HttpServletRequest request) throws IOException, TemplateException {
        Map<String, String> id_name = userService.getid_user();
        Map<String,Object> map = new HashMap<>();
        map.put("projectName",process.getProjectname());
        map.put("dateType",process.getDatatype());
        map.put("preMan",id_name.get(process.getPrincipal()));
        map.put("emails",process.getEmails());
        String[] types = process.getSampletype().split("##");
        String allType = "";
        for (String type : types){
            allType += FileUtil.getInitSampleFlag(type) + ",";
        }
        map.put("sampleTypes",allType);
        map.put("projectDesc",process.getProjectdesc());
        map.put("spip",id_name.get(process.getSampleinput()));
        map.put("spmk",id_name.get(process.getSamplepreparation()));
        map.put("lib",id_name.get(process.getLibrarypreparation()));
        map.put("disData",id_name.get(process.getDismountdata()));
        map.put("bio",id_name.get(process.getBioinformaticsanalysis()));
        map.put("rmk",process.getRemarks());
        String url = request.getRequestURL().toString();
        url = url.substring(0,url.indexOf("/",url.indexOf(":",url.indexOf("//"))));
        map.put("confirmUrl",url + "/emailTmp/piConfirm?tmpId=" + process.getId());
        map.put("refuseUrl",url + "/emailTmp/piRefuse?tmpId=" + process.getId());
//        map.put("url",oot)
        Configuration configuration = freeMarkerConfigurationFactory.createConfiguration();
        configuration.setClassForTemplateLoading(this.getClass(),"/templates/");
        Template template = configuration.getTemplate("processConfirm.ftl");
        String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
        emailService.simpleSendHtmlEmail(html,user.getEmail(),"审核");
    }

    public List<CibrTaskProcess> findAllPorcess(){
        List<CibrTaskProcess> cibrTaskProcesses = processMapper.queryAllProcess(new HashMap());
        return cibrTaskProcesses;
    }

    public CibrTaskProcess getPorcessById(String processId) {
        Map<String,String> condition = new HashMap<>();
        condition.put("id",processId);
        List<CibrTaskProcess> cibrTaskProcesses = processMapper.queryAllProcess(condition);
        return cibrTaskProcesses.get(0);
    }

    public CibrTaskProcess getProcessByTaskId(String taskId){
        CibrSysTask task = cibrSysTaskMapper.selectByPrimaryKey(taskId);
        if (!"03".equals(task.getTasktype())){
            return null;
        }
        CibrTaskProcessExample processExample = new CibrTaskProcessExample();
        processExample.createCriteria().andTaskidEqualTo(taskId);
        List<CibrTaskProcess> cibrTaskProcesses = processMapper.selectByExample(processExample);
        return getPorcessById(cibrTaskProcesses.get(0).getId());
    }

    public void batchInsert(List<CibrTaskProcessSampleinput> list){
        sampleinputMapper.batchInsert(list);
    }

    public List<CibrTaskProcessSampleinput> getSampleInputs(String processId,String curFlag,String subId) {
        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        CibrTaskProcessSampleinputExample.Criteria criteria = sampleinputExample.createCriteria();
        criteria.andProcessidEqualTo(processId).andCurrentstatuNotEqualTo("09");
        if ("00".equals(subId)){
            criteria.andSubidIsNull()
                    .andCurrentstatuNotEqualTo("02")
                    .andCurrentstatuNotEqualTo("03")
                    .andCurrentstatuNotEqualTo("08");
        }else if ("02".equals(subId)){
            criteria.andCurrentstatuIn(Arrays.asList("02","08"));
        }else if ("03".equals(subId)){
            criteria.andCurrentstatuEqualTo("03");
        }
        else {
            criteria.andSubidEqualTo(subId);
        }
//        if ("01".equals(curFlag)){
//            criteria.andCurrentstatuNotEqualTo("02");
//        }
//        if (!StringUtils.isEmpty(subId) && !"showAll".equals(subId)){
//            criteria.andSubidEqualTo(subId);
//        }
        sampleinputExample.setOrderByClause("currentStatu,rowIndex");
        return sampleinputMapper.selectByExample(sampleinputExample);
    }

    /**
     * 样品录入已完成，保存最终样品录入结果
     * @param processId
     * @param user
     * @param list
     */
    @Transactional(rollbackFor = Exception.class)
    public Map<String,Object> saveSampleInput(String processId, CibrSysUser user, List<CibrTaskProcessSampleinput> list,String type) throws IOException, TemplateException {
        Map<String,Object> retMap = new HashMap<>();
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        CibrTaskProcessSampleinputExample example = new CibrTaskProcessSampleinputExample();
        example.createCriteria().andProcessidEqualTo(processId).andCurrentstatuNotEqualTo("09");
        final List<CibrTaskProcessSampleinput> list_database = sampleinputMapper.selectByExample(example);
        /*校验样本编号是否重复*/
        List<CibrTaskProcessSampleinput> samelist = checkSampleIndex(list);
        if (samelist != null && samelist.size() > 0){
            retMap.put("sameList",samelist);
            retMap.put("retCode", "E560");
            return retMap;
        }
        List<CibrTaskProcessSampleinput> updateList = new ArrayList<CibrTaskProcessSampleinput>();
        List<CibrTaskProcessSampleinput> delList = new ArrayList<CibrTaskProcessSampleinput>();
        List<CibrTaskProcessSampleinput> insertList = new ArrayList<CibrTaskProcessSampleinput>();
        Map<String,CibrTaskProcessSampleinput> update_map = new HashMap<>();
        Map<String, CibrSysSampleindex> currentIndexs = getCurrentIndex();
        List<CibrTaskProcessSampleinput> newSamples = new ArrayList<>();
        for (CibrTaskProcessSampleinput input : list){
            if ("real".equals(type)){
                input.setCurrentstatu("03");
            }else if ("pass".equals(type)){
                input.setCurrentstatu("03");
            }else if ("unPass".equals(type)){
                input.setCurrentstatu("08");
            }else if ("complete".equals(type)){
                input.setCurrentstatu("02");
            }else {
                if (!"02".equals(input.getCurrentstatu())){
                    input.setCurrentstatu("01");
                }
            }
            if (StringUtils.isEmpty(input.getId())){
                input.setId(Util.getUUID());
                input.setCreater(user.getId());
                input.setProcessid(processId);
                input.setCreatetime(new Date());
                insertList.add(input);
            }else {
                updateList.add(input);
                update_map.put(input.getId(),input);
            }
            if (
                    StringUtils.isEmpty(input.getSampleindex())
                    && !StringUtils.isEmpty(input.getInitsample())
                    && !StringUtils.isEmpty(input.getDatabasetype())
                    && !StringUtils.isEmpty(input.getSamplemsg())
            ){
                String selfNum = Util.getSelfNum(input.getInitsample(), input.getSamplemsg(), input.getDatabasetype());
                CibrSysSampleindex sampleindex = currentIndexs.get(selfNum);
                sampleindex.setCurrentindex(sampleindex.getCurrentindex() + 1);
                input.setSampleindex(sampleindex.getSelfNum());
                newSamples.add(input);
            }
        }

        this.updateSampleIndex(currentIndexs);
        int maxRowIndex = -1;
        for (CibrTaskProcessSampleinput input : list_database){
            if (maxRowIndex < input.getRowindex()){
                maxRowIndex = input.getRowindex();
            }
        }

        for (CibrTaskProcessSampleinput input : insertList){
            maxRowIndex ++;
            input.setRowindex(maxRowIndex);
        }

        if ("real".equals(type)){
//            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SPWAIT);
//            process.setInputtime(new Date());
//            processMapper.updateByPrimaryKey(process);
            /*创建样本制备信息*/
            List<CibrTaskProcessSamplemake> makes = createMakes(list);
            makeMapper.batchInsert(makes);
        }
        if (insertList.size()>0){
            sampleinputMapper.batchInsert(insertList);
        }
        if (updateList.size()>0){
            sampleinputMapper.batchUpdate(updateList);
        }
        if (delList.size()>0){
            sampleinputMapper.batchUpdate(delList);
        }
        if("complete".equals(type)){
            List<List<String>> inputList = getInputList(processId, list);
            CibrSysUser inputer = userMapper.selectByPrimaryKey(process.getSamplepreparation());
            sendPassEmail(inputer, inputList,"样品录入已完成，请及时确认！");
        }
        retMap.put("retCode", "200");
        return retMap;
    }

    /**
     *
     * @param list
     * @return 重复的list
     */
    private List<CibrTaskProcessSampleinput> checkSampleIndex(List<CibrTaskProcessSampleinput> list) {
        List<String> sampleIndexs = list.stream()
                .filter(ipt -> !StringUtils.isEmpty(ipt.getSampleindex()))
                .map(CibrTaskProcessSampleinput::getSampleindex).collect(Collectors.toList());
        if (sampleIndexs == null || sampleIndexs.size() == 0){
            return null;
        }
        CibrTaskProcessSampleinputExample example = new CibrTaskProcessSampleinputExample();
        example.createCriteria().andSampleindexIn(sampleIndexs);
        List<CibrTaskProcessSampleinput> dbList = sampleinputMapper.selectByExample(example);
        if(dbList == null || dbList.size() == 0){
            return null;
        }
        Map<String,CibrTaskProcessSampleinput> index_uuid = new HashMap<>();
        dbList.stream().forEach(ipt->index_uuid.put(ipt.getSampleindex(),ipt));

        List<CibrTaskProcessSampleinput> sameList = list.stream().filter(
                ipt ->  (index_uuid.get(ipt.getSampleindex()) != null &&
                !index_uuid.get(ipt.getSampleindex()).getId().equals(ipt.getId())
        )).collect(Collectors.toList());
        return sameList;
    }

    public void sendPassEmail(CibrSysUser user, List<List<String>> inputList,String title) throws IOException, TemplateException {
        Map map = new HashMap();
        map.put("list", inputList);
        map.put("userEmail", user.getEmail());
        map.put("title",title);
        Configuration configuration = freeMarkerConfigurationFactory.createConfiguration();
        configuration.setClassForTemplateLoading(this.getClass(),"/templates/");
        Template template = configuration.getTemplate("processInputConfirm.ftl");
        String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
        emailService.simpleSendHtmlEmail(html, user.getEmail(),"审核");
    }


    public List<CibrTaskProcessSamplemake> createMakes(List<CibrTaskProcessSampleinput> sampleInputs){
        List<CibrTaskProcessSamplemake> samplemakes = new ArrayList<CibrTaskProcessSamplemake>();
        for(CibrTaskProcessSampleinput sampleinput : sampleInputs){
            CibrTaskProcessSamplemake make = new CibrTaskProcessSamplemake();
            make.setId(Util.getUUID());
            make.setProcessid(sampleinput.getProcessid());
            make.setInputid(sampleinput.getId());
            make.setSamplename(sampleinput.getSamplename());
            make.setSpecies(sampleinput.getSpecies());
            make.setTissue(sampleinput.getTissue());
            make.setConcentration(sampleinput.getConcentration());
            make.setSamplevolume(sampleinput.getSamplevolume());
            make.setTotalnumber(sampleinput.getTotalnumber());
            make.setCelllife(sampleinput.getCelllife());
            make.setCellsort(sampleinput.getCellsort());
            make.setDatabasetype(sampleinput.getDatabasetype());
            make.setSequencingplatform(sampleinput.getSequencingplatform());
            make.setSelfnumber(sampleinput.getSampleindex());
            make.setInitsample(sampleinput.getInitsample());
            make.setTestdate(new Date());
            make.setCurrentstatu("01");
            make.setRowindex(sampleinput.getRowindex());
            samplemakes.add(make);
        }
        return samplemakes;
    }

    public List<CibrTaskProcessSamplemake> getAllTodoMakes(String processId,String subId,String curFlag) {
        CibrTaskProcessSamplemakeExample samplemakeExample = new CibrTaskProcessSamplemakeExample();
        CibrTaskProcessSamplemakeExample.Criteria criteria = samplemakeExample.createCriteria();
        criteria.andProcessidEqualTo(processId).andCurrentstatuNotEqualTo("08");
//        if (!"showAll".equals(subId) && !StringUtils.isEmpty(subId)){
//            criteria.andSubidEqualTo(subId);
//        }else if (StringUtils.isEmpty(subId)){
//            criteria.andCurrentstatuNotEqualTo("02");
//        }
        if ("00".equals(subId)){
            criteria.andSubidIsNull().andCurrentstatuNotEqualTo("02").andCurrentstatuNotEqualTo("03");
        }else  if ("02".equals(subId)){
            criteria.andCurrentstatuEqualTo("02");
        }else  if ("03".equals(subId)){
            criteria.andCurrentstatuEqualTo("03");
        }
        else{
            criteria.andSubidEqualTo(subId);
        }
        samplemakeExample.setOrderByClause("rowIndex desc");
        return makeMapper.selectByExample(samplemakeExample);
    }

    public CibrTaskProcessSubtask createSubTask(CibrSysUser user,String subName,CibrTaskProcess process,String remarks,String statu){
        CibrTaskProcessSubtask subtask = new CibrTaskProcessSubtask();
        subtask.setId(Util.getUUID());
        subtask.setCreater(user.getId());
        subtask.setCreatetime(new Date());
        subtask.setCurrentstatu(statu);
        subtask.setName(subName);
        subtask.setProcessid(process.getId());
        subtask.setTaskid(process.getTaskid());
        subtask.setRemarks(remarks);
        subtaskMapper.insert(subtask);
        return subtask;
    }

    /**
     * 暂存或保存样本制备信息
     * @param processId
     * @param flag
     * @param list
     * @param user
     */
    @Transactional(rollbackFor = Exception.class)
    public void saveSampleMakes(String processId, String flag, List<CibrTaskProcessSamplemake> list, CibrSysUser user,
                                String subId,String subProcessName,String remarks) throws IOException, TemplateException {
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        List<CibrTaskProcessLibrary> libs = new ArrayList<CibrTaskProcessLibrary>();
        Map<String, CibrSysSampleindex> currentIndexs = getCurrentIndex();
        CibrTaskProcessSubtask subTask = null;
        if ("divide".equals(flag)){
            subTask = createSubTask(user, subProcessName, process, remarks, TaskUtil.PROCESS_TASK_STATU_SPWAIT);
        }
        for (CibrTaskProcessSamplemake make : list){
            if ("09".equals(make.getCurrentstatu())){
                continue;
            }
            make.setUpdatetime(new Date());
            make.setUpdateuser(user.getId());
            make.setProcessid(processId);
            /*生成衍生编号*/
            if (StringUtils.isEmpty(make.getDerivativeindex())
                && "02".equals(make.getInitsample())
                && !StringUtils.isEmpty(make.getTransform())
            ){
                String transformIndex = Util.getTransformIndex(make.getTransform(), make.getDatabasetype());
                CibrSysSampleindex sampleindex = currentIndexs.get(transformIndex);
                sampleindex.setCurrentindex(sampleindex.getCurrentindex() + 1);
                make.setDerivativeindex(sampleindex.getSelfNum());
            }
            if("tmp".equals(flag)){
                make.setCreater(user.getId());
                make.setCreatetime(new Date());
            }else if ("complete".equals(flag)){
                make.setCurrentstatu("02");
            }else if ("pass".equals(flag)){
                make.setCurrentstatu("03");
            }else if ("unPass".equals(flag)){
                make.setCurrentstatu("07");
            }else if ("divide".equals(flag)){
                make.setSubid(subTask.getId());
            }else {
                make.setCurrentstatu("03");
                CibrTaskProcessLibrary lib = createLib(make,user);
                libs.add(lib);
            }
        }
        updateSampleIndex(currentIndexs);
        makeMapper.batchUpdate(list);
        if ("real".equals(flag)){
//            CibrTaskProcessSubtask subtask = subtaskMapper.selectByPrimaryKey(subId);
//            subtask.setCurrentstatu(TaskUtil.PROCESS_TASK_STATU_LIB);
//            subtaskMapper.updateByPrimaryKey(subtask);

//            CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
//            process.setSpupdatetime(new Date());
//            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_LIB);
//            processMapper.updateByPrimaryKey(process);
            /*创建文库信息*/
            libraryMapper.batchInsert(libs);
        }
        if ("complete".equals(flag)){
            List<List<String>> makeLists = getMakeLists(processId, list);
            this.sendPassEmail(user,makeLists,"样品制备已完成，请及时确认！");
        }
    }

    public CibrTaskProcessLibrary createLib(CibrTaskProcessSamplemake make,CibrSysUser user){
        CibrTaskProcessLibrary lib = new CibrTaskProcessLibrary();
        lib.setId(Util.getUUID());
        lib.setMakeid(make.getId());
        lib.setCreateuser(user.getId());
        lib.setCreatetime(new Date());
        if (StringUtils.isEmpty(make.getDerivativeindex())){
            lib.setSelfnumber(make.getSelfnumber());
        }else {
            lib.setSelfnumber(make.getDerivativeindex());
        }
        if (StringUtils.isEmpty(make.getTransform())){
            lib.setInitsample(make.getInitsample());
        }else {
            lib.setInitsample(make.getTransform());
        }
//        lib.setDatabasetype(make.getDatabasetype());
        lib.setProcessid(make.getProcessid());
        lib.setRowindex(make.getRowindex());
        lib.setCelllife(make.getCelllife());
        lib.setSpecies(make.getSpecies());
        lib.setSamplename(make.getSamplename());
        lib.setConcentration(make.getConcentration());
        lib.setTotalnumber(make.getTotalnumber());
        lib.setCurrentstatu("01");
        return lib;
    }

    public List<CibrTaskProcessLibrary> selectAllLibs(String processId,String subId) {
        CibrTaskProcessLibraryExample example = new CibrTaskProcessLibraryExample();
        CibrTaskProcessLibraryExample.Criteria criteria = example.createCriteria();
        criteria.andProcessidEqualTo(processId).andCurrentstatuNotEqualTo("08");
        if ("00".equals(subId)){
            criteria.andSubidIsNull()
                    .andCurrentstatuNotEqualTo("02").andCurrentstatuNotEqualTo("03");
        }else if ("02".equals(subId)){
            criteria.andCurrentstatuEqualTo("02");
        }else if ("03".equals(subId)){
            criteria.andCurrentstatuEqualTo("03");
        }else{
            criteria.andSubidEqualTo(subId);
        }
        example.setOrderByClause("rowIndex");
        return libraryMapper.selectByExample(example);
    }

    @Transactional(rollbackFor = Exception.class)
    public void tempSaveLibs(String processId, List<CibrTaskProcessLibrary> libs,String type, CibrSysUser user,
                             String subId,String subProcessName,String remarks) throws IOException, TemplateException {
        List<CibrTaskProcessDismountdata> list = new ArrayList<>();
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        CibrTaskProcessSubtask subTask = null;
        if("divide".equals(type)){
            subTask = createSubTask(user, subProcessName, process, remarks, TaskUtil.PROCESS_TASK_STATU_LIB);
        }
        for (CibrTaskProcessLibrary lib : libs){
            if ("09".equals(lib.getCurrentstatu())){
                continue;
            }
            lib.setUpdatetime(new Date());
            lib.setUpdateuser(user.getId());
            if ("divide".equals(type)){
                lib.setSubid(subTask.getId());
            }else if ("real".equals(type)){
                lib.setCurrentstatu("03");
                list.add(createDismountData(user,lib,processId));
            }else if ("complete".equals(type)){
                lib.setCurrentstatu("02");
            }else if ("pass".equals(type)){
                lib.setCurrentstatu("03");
            }
        }

        libraryMapper.batchUpdate(libs);
        if ("real".equals(type)){
//            CibrTaskProcessSubtask subtask = subtaskMapper.selectByPrimaryKey(subId);
//            subtask.setCurrentstatu(TaskUtil.PROCESS_TASK_STATU_DIS);
//            subtaskMapper.updateByPrimaryKey(subtask);
//            CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
//            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_DIS);
//            process.setLpupdatetime(new Date());
//            processMapper.updateByPrimaryKey(process);
            dismountdataMapper.batchInsert(list);
        }
        if ("complete".equals(type)){
            List<List<String>> libLists = getLibLists(processId, libs);
            sendPassEmail(user,libLists,"文库制备已完成，请及时确认！");
        }
    }

    private CibrTaskProcessDismountdata createDismountData(CibrSysUser user, CibrTaskProcessLibrary lib, String processId) {
        CibrTaskProcessDismountdata dismountdata = new CibrTaskProcessDismountdata();
        dismountdata.setId(Util.getUUID());
        dismountdata.setProcessid(processId);
        dismountdata.setMakeid(lib.getId());
        dismountdata.setCreater(user.getId());
        dismountdata.setCreatetime(new Date());
        dismountdata.setCurrentstatu("00");
        dismountdata.setRowindex(lib.getRowindex());
        dismountdata.setSampleindex(lib.getSelfnumber());
        dismountdata.setSamplename(lib.getSamplename());
        return dismountdata;
    }

    public List<CibrTaskProcessDismountdata> selectAllDismountDatas(String processId,String subId) {
        CibrTaskProcessDismountdataExample example = new CibrTaskProcessDismountdataExample();
        CibrTaskProcessDismountdataExample.Criteria criteria = example.createCriteria();
        criteria.andProcessidEqualTo(processId).andCurrentstatuNotEqualTo("08");
        if ("00".equals(subId)){
            criteria.andSubidIsNull().andCurrentstatuNotEqualTo("02").andCurrentstatuNotEqualTo("03");
        }else if ("02".equals(subId)){
            criteria.andCurrentstatuEqualTo("02");
        }else if ("03".equals(subId)){
            criteria.andCurrentstatuEqualTo("03");
        }else{
            criteria.andSubidEqualTo(subId);
        }
        example.setOrderByClause("rowIndex");
        return dismountdataMapper.selectByExample(example);
    }

    @Transactional(rollbackFor = Exception.class)
    public void saveDismountData(String processId, String subId, List<CibrTaskProcessDismountdata> dismountdatas,
                                 String type, CibrSysUser user,String subProcessName,String remarks) throws IOException, TemplateException {
        List<CibrTaskProcessAnalysis> analyses = new ArrayList<>();
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        CibrTaskProcessSubtask subTask = null;
        if ("divide".equals(type)){
            subTask = createSubTask(user, subProcessName, process, remarks, TaskUtil.PROCESS_TASK_STATU_DIS);
        }
        for (CibrTaskProcessDismountdata dismountdata : dismountdatas){
            dismountdata.setUpdatetime(new Date());
            dismountdata.setUpdateuser(user.getId());
            if ("divide".equals(type)){
                dismountdata.setSubid(subTask.getId());
            }
            else if ("complete".equals(type)){
                dismountdata.setCurrentstatu("02");
            }else if ("pass".equals(type)){
                dismountdata.setCurrentstatu("03");
            }else if ("real".equals(type)){
                dismountdata.setCurrentstatu("03");
                analyses.add(createAnalyse(dismountdata,processId,user));
            }
        }
        dismountdataMapper.batchUpdate(dismountdatas);
        if ("real".equals(type)){
//            CibrTaskProcessSubtask subtask = subtaskMapper.selectByPrimaryKey(subId);
//            subtask.setCurrentstatu(TaskUtil.PROCESS_TASK_STATU_BA);
//            subtaskMapper.updateByPrimaryKey(subtask);

//            CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
//            process.setDdupdatetime(new Date());
//            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_BA);
//            processMapper.updateByPrimaryKey(process);
            analysisMapper.batchInsert(analyses);
        }
        if ("complete".equals(type)){
            List<List<String>> disDataLists = getDisDataLists(processId, dismountdatas);
            sendPassEmail(user,disDataLists,"数据交付已完成，请及时确认！");
        }
    }

    private CibrTaskProcessAnalysis createAnalyse(CibrTaskProcessDismountdata dismountdata, String processId, CibrSysUser user) {
        CibrTaskProcessAnalysis analysis = new CibrTaskProcessAnalysis();
        analysis.setId(Util.getUUID());
        analysis.setCreater(user.getId());
        analysis.setCreatetime(new Date());
        analysis.setProcessid(processId);
        analysis.setDismountid(dismountdata.getId());
        analysis.setSamplename(dismountdata.getSamplename());
        analysis.setSampleindex(dismountdata.getSampleindex());
        analysis.setCurrentstatu("00");
        return analysis;
    }

    public List<CibrTaskProcessAnalysis> selectAllAnalyses(String processId,String subId) {
        CibrTaskProcessAnalysisExample analysisExample = new CibrTaskProcessAnalysisExample();
        CibrTaskProcessAnalysisExample.Criteria criteria = analysisExample.createCriteria();
        criteria.andProcessidEqualTo(processId);
        if ("00".equals(subId)){
            criteria.andSubidIsNull().andCurrentstatuNotEqualTo("02").andCurrentstatuNotEqualTo("03");
        }else if ("02".equals(subId)){
            criteria.andCurrentstatuEqualTo("02");
        }else if ("03".equals(subId)){
            criteria.andCurrentstatuEqualTo("03");
        }else {
            criteria.andSubidEqualTo(subId);
        }
        analysisExample.setOrderByClause("rowIndex desc");
        return analysisMapper.selectByExample(analysisExample);
    }

    public void saveAnalyses(String processId, String subId, List<CibrTaskProcessAnalysis> analyses, String type,
                             CibrSysUser user,String subProcessName,String remarks) throws IOException, TemplateException {
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        CibrTaskProcessSubtask subTask = null;
//        if ("real".equals(type)){
//            subTask = createSubTask(user, subProcessName, process, remarks, TaskUtil.PROCESS_TASK_STATU_BA);
//        }
        for (CibrTaskProcessAnalysis analysis : analyses){
            analysis.setUpdatetime(new Date());
            analysis.setUpdateuser(user.getId());
            if ("tmp".equals(type)){
            }else if ("pass".equals(type)){
                analysis.setCurrentstatu("03");
            }
            else {
                analysis.setCurrentstatu("02");
            }
        }
        analysisMapper.batchUpdate(analyses);
        if ("complete".equals(type)){
            List<List<String>> bioLists = getBioLists(processId, analyses);
            sendPassEmail(user,bioLists,"生信分析已完成，请及时确认！");
        }
//        if ("real".equals(type)){
//            CibrTaskProcessSubtask subtask = subtaskMapper.selectByPrimaryKey(subId);
//            subtask.setCurrentstatu(TaskUtil.PROCESS_TASK_STATU_READY);
//            subtaskMapper.updateByPrimaryKey(subtask);

//            CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
//            process.setBaupdatetime(new Date());
//            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_READY);
//            processMapper.updateByPrimaryKey(process);
//        }
    }


    @Transactional(rollbackFor = Exception.class)
    public void startSubTask(String processId, List<CibrTaskProcessSampleinput> list,String subName,String remarks, CibrSysUser user) {
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);

        CibrTaskProcessSubtask subtask = new CibrTaskProcessSubtask();
        subtask.setId(Util.getUUID());
        subtask.setCreater(user.getId());
        subtask.setCreatetime(new Date());
        subtask.setCurrentstatu(TaskUtil.PROCESS_TASK_STATU_SP);
        subtask.setName(subName);
        subtask.setProcessid(processId);
        subtask.setTaskid(process.getTaskid());
        subtask.setRemarks(remarks);
        subtaskMapper.insert(subtask);

        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        sampleinputExample.createCriteria().andProcessidEqualTo(processId);
        List<CibrTaskProcessSampleinput> databaseInputs = sampleinputMapper.selectByExample(sampleinputExample);
        Map<String, List<CibrTaskProcessSampleinput>> divide = getDivide(databaseInputs, list,user,subtask);
        List<CibrTaskProcessSampleinput> saveList = divide.get("saveList");
        List<CibrTaskProcessSampleinput> updateList = divide.get("updateList");

        if (updateList.size()>0){
            sampleinputMapper.batchUpdate(updateList);
        }

        if (saveList.size()>0){
            sampleinputMapper.batchInsert(saveList);
        }
//        List<CibrTaskProcessSamplemake> makes = createMakes(list);
//        for (CibrTaskProcessSamplemake make : makes) {
//            make.setSubid(subtask.getId());
//        }
//        makeMapper.batchInsert(makes);
    }

    /**
     * 区分是新增的input，还是原有的input,
     * 如果是新增的，则给input编号
     * @param databaseInputs
     * @param commitInputs
     * @return
     */
    public Map<String,List<CibrTaskProcessSampleinput>> getDivide(List<CibrTaskProcessSampleinput> databaseInputs,
                                                                  List<CibrTaskProcessSampleinput> commitInputs,
                                                                  CibrSysUser user,
                                                                  CibrTaskProcessSubtask subtask
    ){
        Map<String,List<CibrTaskProcessSampleinput>> retMap = new HashMap<>();
        List<CibrTaskProcessSampleinput> saveList = new ArrayList<>();
        List<CibrTaskProcessSampleinput> updateList = new ArrayList<>();
        for (CibrTaskProcessSampleinput commit : commitInputs){
            commit.setSubid(subtask.getId());
            commit.setCurrentstatu("01");
            if (StringUtils.isEmpty(commit.getRowindex())){
                saveList.add(commit);
            }else {
                updateList.add(commit);
            }
        }
        int rowIndex = -1;
        for (CibrTaskProcessSampleinput ip : databaseInputs){
            if (ip.getRowindex() > rowIndex){
                rowIndex = ip.getRowindex();
            }
        }
        for (CibrTaskProcessSampleinput ip : saveList){
            ip.setId(Util.getUUID());
            ip.setCreatetime(new Date());
            ip.setCreater(user.getId());
            rowIndex ++;
            ip.setRowindex(rowIndex);
        }
        retMap.put("saveList",saveList);
        retMap.put("updateList",updateList);
        return retMap;
    }

    public List<CibrTaskProcessSubtask> getAllSubTask(String processId,String statu) {
        CibrTaskProcessSubtaskExample subtaskExample = new CibrTaskProcessSubtaskExample();
        subtaskExample.createCriteria().andProcessidEqualTo(processId).andCurrentstatuEqualTo(statu);
        subtaskExample.setOrderByClause("createTime desc");
        return subtaskMapper.selectByExample(subtaskExample);
    }

    public Map<String ,Object> getProcessBySubTaskId(String subId) {
        CibrTaskProcessSubtask subtask = subtaskMapper.selectByPrimaryKey(subId);
        CibrTaskProcess process = processMapper.selectByPrimaryKey(subtask.getProcessid());
        Map<String ,Object> retMap = new HashMap<>();
        retMap.put("process",process);
        retMap.put("subTask", subtask);
        return retMap;
    }

    /**
     * 获取当前月份的编号
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Map<String,CibrSysSampleindex> getCurrentIndex(){
        Map<String,CibrSysSampleindex> retMap = new HashMap<>();
        String yyMM = TimeUtil.date2str(new Date(),"yyMM");
        CibrSysSampleindexExample sampleindexExample = new CibrSysSampleindexExample();
        sampleindexExample.createCriteria().andCurtimeEqualTo(yyMM);
        List<CibrSysSampleindex> sampleindexs = sampleindexMapper.selectByExample(sampleindexExample);
        if (sampleindexs == null || sampleindexs.size() == 0){
            CibrSysSampleindex ND = new CibrSysSampleindex();
            ND.setName("ND");
            ND.setCurtime(yyMM);
            ND.setCurrentindex(0);
            sampleindexMapper.insert(ND);
            CibrSysSampleindex NR = new CibrSysSampleindex();
            NR.setName("NR");
            NR.setCurtime(yyMM);
            NR.setCurrentindex(0);
            sampleindexMapper.insert(NR);
            CibrSysSampleindex NC = new CibrSysSampleindex();
            NC.setName("NC");
            NC.setCurtime(yyMM);
            NC.setCurrentindex(0);
            sampleindexMapper.insert(NC);
            CibrSysSampleindex NDO = new CibrSysSampleindex();
            NDO.setName("NDO");
            NDO.setCurtime(yyMM);
            NDO.setCurrentindex(0);
            sampleindexMapper.insert(NDO);
            CibrSysSampleindex NRO = new CibrSysSampleindex();
            NRO.setName("NRO");
            NRO.setCurtime(yyMM);
            NRO.setCurrentindex(0);
            sampleindexMapper.insert(NRO);
            CibrSysSampleindex ZND = new CibrSysSampleindex();
            ZND.setName("ZND");
            ZND.setCurtime(yyMM);
            ZND.setCurrentindex(0);
            sampleindexMapper.insert(ZND);
            CibrSysSampleindex ZNR = new CibrSysSampleindex();
            ZNR.setName("ZNR");
            ZNR.setCurtime(yyMM);
            ZNR.setCurrentindex(0);
            sampleindexMapper.insert(ZNR);
            CibrSysSampleindex ZNC = new CibrSysSampleindex();
            ZNC.setName("ZNC");
            ZNC.setCurtime(yyMM);
            ZNC.setCurrentindex(0);
            sampleindexMapper.insert(ZNC);
            retMap.put("ND",ND);
            retMap.put("NR",NR);
            retMap.put("NC",NC);
            retMap.put("NDO",NDO);
            retMap.put("NRO",NRO);
            retMap.put("ZND",ZND);
            retMap.put("ZNR",ZNR);
            retMap.put("ZNC",ZNC);
        }else {
            for (CibrSysSampleindex sampleindex : sampleindexs){
                retMap.put(sampleindex.getName(),sampleindex);
            }
        }
        return retMap;
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateSampleIndex(Map<String, CibrSysSampleindex> currentIndexs) {
        for (String cur : currentIndexs.keySet()){
            sampleindexMapper.updateByPrimaryKey(currentIndexs.get(cur));
        }
    }

    public HSSFWorkbook downloadSampleInput(String processId,CibrSysUser user,List<String> ids) {
        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        sampleinputExample.createCriteria()
                .andProcessidEqualTo(processId)
                .andIdIn(ids)
                .andCurrentstatuNotEqualTo("09");
        sampleinputExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessSampleinput> list = sampleinputMapper.selectByExample(sampleinputExample);

        List<List<String>> excleRows = getInputList(processId, list);
        HSSFWorkbook sheets = fileService.exportExcel(excleRows, user);
        return sheets;
    }

    public List<List<String>> getInputList(String processId, List<CibrTaskProcessSampleinput> list) {
        Map<String, String> uuid_subname = getSubTaskUuidName(processId);

        List<List<String>> excleRows = new ArrayList<>();
        List<String> heads = new ArrayList<>();
        heads.add("批次");
        heads.add("初始样本(必填)");
        heads.add("样本名称");
        heads.add("样本编号");
        heads.add("物种");
        heads.add("组织来源");
        heads.add("样本类型");
        heads.add("样本状态");
        heads.add("组织量（g）");
        heads.add("血液体积(ml)");
        heads.add("浓度(细胞个数/μl)");
        heads.add("样本体积(ul)");
        heads.add("细胞总量(细胞个数)");
        heads.add("细胞活性");
        heads.add("细胞分选法");
        heads.add("建库类型");
        heads.add("测序平台");
        heads.add("备注");
        heads.add("子任务名称");
        heads.add("状态");
        excleRows.add(heads);
        for (CibrTaskProcessSampleinput input : list){
            List<String> row = new ArrayList<>();
            row.add(Util.nullToStr(input.getArrindex()));
            row.add(Util.nullToStr(FileUtil.getInitSampleFlag(input.getInitsample())));
            row.add(Util.nullToStr(input.getSamplename()));
            row.add(Util.nullToStr(input.getSampleindex()));
            row.add(Util.nullToStr(input.getSpecies()));
            row.add(Util.nullToStr(input.getTissue()));
            row.add(Util.nullToStr(FileUtil.getSampleTypeFlag(input.getSamplemsg())));
            row.add(Util.nullToStr(FileUtil.getSampleStatuFlag(input.getSamplestatu())));
            row.add(Util.nullToStr(input.getTissuenumber()));
            row.add(Util.nullToStr(input.getBloodvolume()));
            row.add(Util.nullToStr(input.getConcentration()));
            row.add(Util.nullToStr(input.getSamplevolume()));
            row.add(Util.nullToStr(input.getTotalnumber()));
            row.add(Util.nullToStr(input.getCelllife()));
            row.add(Util.nullToStr(FileUtil.getCellsortFlag(input.getCellsort())));
            row.add(Util.nullToStr(FileUtil.getDatabaseFlag(input.getDatabasetype())));
            row.add(Util.nullToStr(FileUtil.getSeqFlag(input.getSequencingplatform())));
            row.add(Util.nullToStr(input.getRemarks()));
            row.add(Util.nullToStr(uuid_subname.get(input.getSubid())));
            row.add(Util.nullToStr(Util.statuFlag(input.getCurrentstatu())));
            excleRows.add(row);
        }
        return excleRows;
    }

    public Map<String, String> getSubTaskUuidName(String processId) {
        CibrTaskProcessSubtaskExample subtaskExample = new CibrTaskProcessSubtaskExample();
        subtaskExample.createCriteria().andProcessidEqualTo(processId);
        List<CibrTaskProcessSubtask> cibrTaskProcessSubtasks = subtaskMapper.selectByExample(subtaskExample);
        Map<String, String> uuid_subname = new HashMap<>();
        if (cibrTaskProcessSubtasks != null && cibrTaskProcessSubtasks.size() > 0) {
            for (CibrTaskProcessSubtask subtask : cibrTaskProcessSubtasks) {
                uuid_subname.put(subtask.getId(), subtask.getName());
            }
        }
        return uuid_subname;
    }

    /**
     * 停止样本制备过程
     * @param makeId
     * @param reason
     * @param remark
     * @param user
     */
    @Transactional(rollbackFor = Exception.class)
    public void stopMake(String makeId, String reason, String remark, CibrSysUser user) {
        CibrTaskProcessSamplemake make = makeMapper.selectByPrimaryKey(makeId);
        make.setUpdatetime(new Date());
        make.setUpdateuser(user.getId());
        make.setCurrentstatu("09");
        makeMapper.updateByPrimaryKey(make);

        CibrTaskFail fail = new CibrTaskFail();
        fail.setId(Util.getUUID());
        fail.setDetailid(make.getId());
        fail.setHandler(user.getId());
        fail.setCreatetime(new Date());
        fail.setReason(reason);
        fail.setRemarks(remark);
        failMapper.insert(fail);
    }

    public String showStopReason(String detailId) {
        CibrTaskFailExample failExample = new CibrTaskFailExample();
        failExample.createCriteria().andDetailidEqualTo(detailId);
        failExample.setOrderByClause("createTime");
        List<CibrTaskFail> fails = failMapper.selectByExample(failExample);
        if (fails == null || fails.size() == 0){
            return "";
        }else {
            return fails.get(0).getReason();
        }

    }

    public HSSFWorkbook downloadMakes(String processId,CibrSysUser user,List<String> ids ) {
        CibrTaskProcessSamplemakeExample samplemakeExample = new CibrTaskProcessSamplemakeExample();
        samplemakeExample.createCriteria()
                .andIdIn(ids)
                .andCurrentstatuNotEqualTo("09")
                .andProcessidEqualTo(processId);
        samplemakeExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessSamplemake> samplemakes = makeMapper.selectByExample(samplemakeExample);


        List<List<String>> excleRows = getMakeLists(processId, samplemakes);
        HSSFWorkbook sheets = fileService.exportExcel(excleRows, user);
        return sheets;
    }

    public List<List<String>> getMakeLists(String processId, List<CibrTaskProcessSamplemake> samplemakes) {
        Map<String, String> uuid_subName = getSubTaskUuidName(processId);
        Map<String, String> uuid_user = userService.getid_user();
        List<List<String>> excleRows = new ArrayList<>();
        List<String> heads = new ArrayList<>();
        heads.add("初始样本");
        heads.add("转化样本");
        heads.add("样本名称");
        heads.add("样本编号");
        heads.add("样本衍生编号");
        heads.add("物种");
        heads.add("组织来源");
        heads.add("检测日期");
        heads.add("浓度(细胞个数/μl)");
        heads.add("样本体积(ul)");
        heads.add("细胞总量(细胞个数)");
        heads.add("细胞活性");
        heads.add("细胞分选法");
        heads.add("提取方法");
        heads.add("检测结果");
        heads.add("检测备注");
        heads.add("检测员");
        heads.add("审核人");
        heads.add("建库类型");
        heads.add("测序平台");
        heads.add("剩余量");
        heads.add("备注");
        heads.add("子任务名称");
        heads.add("状态");
        excleRows.add(heads);
        for (CibrTaskProcessSamplemake make : samplemakes){
            List<String> row = new ArrayList<>();
            row.add(Util.nullToStr(FileUtil.getInitSampleFlag(make.getInitsample())));
            row.add(Util.nullToStr(FileUtil.getInitSampleFlag(make.getTransform())));
            row.add(Util.nullToStr(make.getSamplename()));
            row.add(Util.nullToStr(make.getSelfnumber()));
            row.add(Util.nullToStr(make.getDerivativeindex()));
            row.add(Util.nullToStr(make.getSpecies()));
            row.add(Util.nullToStr(make.getTissue()));
            row.add(Util.nullToStr(TimeUtil.date2str(make.getTestdate(),"yyyy-MM-dd")));
            row.add(Util.nullToStr(make.getConcentration()));
            row.add(Util.nullToStr(make.getSamplevolume()));
            row.add(Util.nullToStr(make.getTotalnumber()));
            row.add(Util.nullToStr(make.getCelllife()));
            row.add(Util.nullToStr(FileUtil.getCellsortFlag(make.getCellsort())));
            row.add(Util.nullToStr(FileUtil.getExtractFlag(make.getExtractmethod())));
            row.add(Util.nullToStr(FileUtil.getCheckResultFlag(make.getCheckresult())));
            row.add(Util.nullToStr(make.getCheckremarks()));
            row.add(Util.nullToStr(uuid_user.get(make.getCheckuser())));
            row.add(Util.nullToStr(uuid_user.get(make.getReviewer())));
            row.add(Util.nullToStr(FileUtil.getDatabaseFlag(make.getDatabasetype())));
            row.add(Util.nullToStr(FileUtil.getSeqFlag(make.getSequencingplatform())));
            row.add(Util.nullToStr(make.getRemaining()));
            row.add(Util.nullToStr(make.getRemarks()));
            row.add(Util.nullToStr(uuid_subName.get(make.getSubid())));
            row.add(Util.nullToStr(Util.statuFlag(make.getCurrentstatu())));
            excleRows.add(row);
        }
        return excleRows;
    }

    public CibrTaskProcessSubtask selectSubTaskById(String subId) {
        return subtaskMapper.selectByPrimaryKey(subId);
    }

    @Transactional(rollbackFor = Exception.class)
    public void makeInput(List<List<String>> rows, CibrSysUser user, String processId) throws ParseException {
        CibrTaskProcessSamplemakeExample samplemakeExample = new CibrTaskProcessSamplemakeExample();
        samplemakeExample.createCriteria().andProcessidEqualTo(processId);
        List<CibrTaskProcessSamplemake> samplemakes = makeMapper.selectByExample(samplemakeExample);
        Map<String,CibrTaskProcessSamplemake> index_make = new HashMap<>();
        for (CibrTaskProcessSamplemake make : samplemakes){
            index_make.put(make.getSelfnumber(),make);
        }

        Map<String, String> name_id = userService.getname_id();
        Map<String, CibrSysSampleindex> currentIndexs = getCurrentIndex();

        for (List<String> row : rows){
            CibrTaskProcessSamplemake importMake = index_make.get(row.get(3));
            if (importMake == null){
                continue;
            }
            if ("02".equals(importMake.getCurrentstatu()) ||
                    "09".equals(importMake.getCurrentstatu())
            ){
                continue;
            }
            int rowIndex = 0;
            rowIndex++;
//            importMake.setInitsample(Util.nullToStr(FileUtil.getInitSampleType(row.get(rowIndex++))));
            if ("02".equals(importMake.getInitsample()) && StringUtils.isEmpty(importMake.getTransform())){
                importMake.setTransform(Util.nullToStr(FileUtil.getInitSampleType(row.get(rowIndex++))));
            }else {
                rowIndex++;
            }
            rowIndex++;
//            importMake.setSamplename(Util.nullToStr(row.get(rowIndex++)));
            rowIndex++;
            rowIndex++;
            importMake.setSpecies(Util.nullToStr(row.get(rowIndex++)));
            importMake.setTissue(Util.nullToStr(row.get(rowIndex++)));
            importMake.setTestdate(Util.str2date(row.get(rowIndex++),"yyyy-MM-dd"));
            importMake.setConcentration(Util.nullToStr(row.get(rowIndex++)));
            importMake.setSamplevolume(Util.nullToStr(row.get(rowIndex++)));
            importMake.setTotalnumber(Util.nullToStr(row.get(rowIndex++)));
            importMake.setCelllife(Util.nullToStr(row.get(rowIndex++)));
            importMake.setCellsort(FileUtil.getCellSortCode(row.get(rowIndex++)));
            importMake.setExtractmethod(FileUtil.getExtractCode(row.get(rowIndex++)));
            importMake.setCheckresult(FileUtil.getCheckResultCode(row.get(rowIndex++)));
            importMake.setCheckremarks(Util.nullToStr(row.get(rowIndex++)));
            importMake.setCheckuser(Util.nullToStr(name_id.get(row.get(rowIndex++))));
            importMake.setReviewer(Util.nullToStr(name_id.get(row.get(rowIndex++))));
            importMake.setDatabasetype(FileUtil.getDatabaseType(row.get(rowIndex++),row.get(0)));
            importMake.setSequencingplatform(FileUtil.getSeqCode(row.get(rowIndex++)));
            importMake.setUpdatetime(new Date());
            importMake.setUpdateuser(user.getId());
            /*生成转化衍生编号*/
            if (StringUtils.isEmpty(importMake.getDerivativeindex())
                    && "02".equals(importMake.getInitsample())
                    && !StringUtils.isEmpty(importMake.getTransform())
            ){
                String transformIndex = Util.getTransformIndex(importMake.getTransform(), importMake.getDatabasetype());
                CibrSysSampleindex sampleindex = currentIndexs.get(transformIndex);
                sampleindex.setCurrentindex(sampleindex.getCurrentindex() + 1);
                importMake.setDerivativeindex(sampleindex.getSelfNum());
            }
        }
        updateSampleIndex(currentIndexs);
        makeMapper.batchUpdate(samplemakes);
    }

    @Transactional(rollbackFor = Exception.class)
    public void stopLib(String libId, String reason, String remark, CibrSysUser user) {
        CibrTaskProcessLibrary lib = libraryMapper.selectByPrimaryKey(libId);
        lib.setUpdateuser(user.getId());
        lib.setUpdatetime(new Date());
        lib.setCurrentstatu("09");
        libraryMapper.updateByPrimaryKey(lib);

        CibrTaskFail fail = new CibrTaskFail();
        fail.setId(Util.getUUID());
        fail.setDetailid(lib.getId());
        fail.setHandler(user.getId());
        fail.setCreatetime(new Date());
        fail.setReason(reason);
        fail.setRemarks(remark);
        failMapper.insert(fail);
    }

    public HSSFWorkbook downloadLibs(String processId, CibrSysUser user,List<String> ids) {
        CibrTaskProcessLibraryExample libraryExample = new CibrTaskProcessLibraryExample();
        libraryExample.createCriteria()
                .andIdIn(ids)
                .andCurrentstatuNotEqualTo("08")
                .andProcessidEqualTo(processId);
        libraryExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessLibrary> libs = libraryMapper.selectByExample(libraryExample);
        List<List<String>> excleRows = getLibLists(processId, libs);
        HSSFWorkbook sheets = fileService.exportExcel(excleRows, user);
        return sheets;
    }

    public List<List<String>> getLibLists(String processId, List<CibrTaskProcessLibrary> libs) {
        Map<String, String> uuid_user = userService.getid_user();
        Map<String, String> uuid_subName = getSubTaskUuidName(processId);
        List<List<String>> excleRows = new ArrayList<>();
        List<String> heads = new ArrayList<>();
        heads.add("建库时间");
        heads.add("样本编号");
        heads.add("中间产物编号");
        heads.add("样本名称");
        heads.add("物种");
        heads.add("浓度(细胞个数/μl)");
        heads.add("细胞总量(细胞个数)");
        heads.add("细胞活性");
        heads.add("样本使用量(ug)/细胞使用量（细胞个数）");
        heads.add("片段大小（bp）");
        heads.add("index");
        heads.add("barcode");
        heads.add("常规PCR循环数");
        heads.add("文库类型");
        heads.add("文库编号");
        heads.add("建库人");
        heads.add("审核人");
        heads.add("Qubit浓度");
        heads.add("文库体积（ul）");
        heads.add("测序策略");
        heads.add("上机数据量");
        heads.add("数据量单位");
        heads.add("建库备注");
        heads.add("上机备注");
        heads.add("子任务名称");
        heads.add("状态");
        excleRows.add(heads);

        for (CibrTaskProcessLibrary lib : libs){
            List<String> row = new ArrayList<>();
            if (lib.getCreatedbtime() == null){
                row.add("");
            }else {
                row.add(TimeUtil.date2str(lib.getCreatedbtime(),"yyyy-MM-dd"));
            }
            row.add(Util.nullToStr(lib.getSelfnumber()));
            row.add(Util.nullToStr(lib.getMiddleindex()));
            row.add(Util.nullToStr(lib.getSamplename()));
            row.add(Util.nullToStr(lib.getSpecies()));
            row.add(Util.nullToStr(lib.getConcentration()));
            row.add(Util.nullToStr(lib.getTotalnumber()));
            row.add(Util.nullToStr(lib.getCelllife()));
            row.add(Util.nullToStr(lib.getUsenumber()));
            row.add(Util.nullToStr(lib.getPartsize()));
            row.add(Util.nullToStr(lib.getLibindex()));
            row.add(Util.nullToStr(lib.getLibbarcode()));
            row.add(Util.nullToStr(lib.getCyclenumber()));
            row.add(Util.nullToStr(FileUtil.getDatabaseFlag(lib.getDatabasetype())));
            row.add(Util.nullToStr(lib.getDatabaseindex()));
            row.add(Util.nullToStr(uuid_user.get(lib.getCreatedbuser())));
            row.add(Util.nullToStr(uuid_user.get(lib.getReviewer())));
            row.add(Util.nullToStr(lib.getQbit()));
            row.add(Util.nullToStr(lib.getLibsize()));
            row.add(Util.nullToStr(lib.getSeqmethods()));
            row.add(Util.nullToStr(lib.getUploadsize()));
            row.add(Util.nullToStr(lib.getDatabaseunit()));
            row.add(Util.nullToStr(lib.getLibremark()));
            row.add(Util.nullToStr(lib.getUploadremark()));
            row.add(Util.nullToStr(uuid_subName.get(lib.getSubid())));
            row.add(Util.nullToStr(Util.statuFlag(lib.getCurrentstatu())));
            excleRows.add(row);
        }
        return excleRows;
    }

    public HSSFWorkbook downloadDismount(String processId, CibrSysUser user,List<String> ids) {
        CibrTaskProcessDismountdataExample dismountdataExample = new CibrTaskProcessDismountdataExample();
        dismountdataExample.createCriteria()
                .andCurrentstatuNotEqualTo("08")
                .andIdIn(ids)
                .andProcessidEqualTo(processId);
        dismountdataExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessDismountdata> dismountdataList = dismountdataMapper.selectByExample(dismountdataExample);

        List<List<String>> excleRows = getDisDataLists(processId, dismountdataList);
        HSSFWorkbook sheets = fileService.exportExcel(excleRows, user);
        return sheets;
    }

    public List<List<String>> getDisDataLists(String processId, List<CibrTaskProcessDismountdata> dismountdataList) {
        List<List<String>> excleRows = new ArrayList<>();
        List<String> heads = new ArrayList<>();

        Map<String, String> uuid_subName = getSubTaskUuidName(processId);

        heads.add("样本编号");
        heads.add("样本名称");
        heads.add("数据账号");
        heads.add("数据密码");
        heads.add("数据目录");
        heads.add("测序平台");
        heads.add("备注");
        heads.add("子任务名称");
        heads.add("状态");
        excleRows.add(heads);
        for (CibrTaskProcessDismountdata dismountdata : dismountdataList){
            List<String> row = new ArrayList<>();
            row.add(Util.nullToStr(dismountdata.getSampleindex()));
            row.add(Util.nullToStr(dismountdata.getSamplename()));
            row.add(Util.nullToStr(dismountdata.getDateaccount()));
            row.add(Util.nullToStr(dismountdata.getDatepassword()));
            row.add(Util.nullToStr(dismountdata.getDatepath()));
            row.add(Util.nullToStr(FileUtil.getSeqFlag(dismountdata.getSequencingplatform())));
            row.add(Util.nullToStr(dismountdata.getRemarks()));
            row.add(Util.nullToStr(uuid_subName.get(dismountdata.getSubid())));
            row.add(Util.statuFlag(dismountdata.getCurrentstatu()));
            excleRows.add(row);
        }
        return excleRows;
    }

    public void dismountImport(List<List<String>> rows, CibrSysUser user, String processId) {
        CibrTaskProcessDismountdataExample dismountdataExample = new CibrTaskProcessDismountdataExample();
        dismountdataExample.createCriteria().andProcessidEqualTo(processId);
        List<CibrTaskProcessDismountdata> list = dismountdataMapper.selectByExample(dismountdataExample);

        Map<String,CibrTaskProcessDismountdata> index_dis = new HashMap<>();
        for (CibrTaskProcessDismountdata dismountdata : list){
            index_dis.put(dismountdata.getSampleindex(),dismountdata);
        }

        for (List<String> row : rows){
            int index = 2;
            CibrTaskProcessDismountdata dismountdata = index_dis.get(Util.nullToStr(row.get(0)));
            if (dismountdata == null
                    || "02".equals(dismountdata.getCurrentstatu())
            ){
                continue;
            }
            dismountdata.setDateaccount(Util.nullToStr(row.get(index++)));
            dismountdata.setDatepassword(Util.nullToStr(row.get(index++)));
            dismountdata.setDatepath(Util.nullToStr(row.get(index++)));
            dismountdata.setSequencingplatform(FileUtil.getSeqCode(Util.nullToStr(row.get(index++))));
            dismountdata.setRemarks(Util.nullToStr(row.get(index++)));
        }
        dismountdataMapper.batchUpdate(list);
    }

    public HSSFWorkbook downloadAnalysis(String processId, CibrSysUser user,List<String> ids) {
        CibrTaskProcessAnalysisExample analysisExample = new CibrTaskProcessAnalysisExample();
        analysisExample.createCriteria().andProcessidEqualTo(processId).andIdIn(ids);
        analysisExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessAnalysis> analyses = analysisMapper.selectByExample(analysisExample);

        List<List<String>> excleRows = getBioLists(processId, analyses);
        HSSFWorkbook sheets = fileService.exportExcel(excleRows, user);
        return sheets;
    }

    public List<List<String>> getBioLists(String processId, List<CibrTaskProcessAnalysis> analyses) {
        List<List<String>> excleRows = new ArrayList<>();
        List<String> heads = new ArrayList<>();

        Map<String, String> uuid_subName = getSubTaskUuidName(processId);

        heads.add("样本编号");
        heads.add("样本名称");
        heads.add("结果主路径");
        heads.add("报告地址");
        heads.add("分析流程/参数");
        heads.add("分析人");
        heads.add("备注");
        heads.add("子任务名称");
        heads.add("状态");
        excleRows.add(heads);

        Map<String, String> uuid_user = userService.getid_user();

        for (CibrTaskProcessAnalysis analysis : analyses){
            List<String> row = new ArrayList<>();
            row.add(Util.nullToStr(analysis.getSampleindex()));
            row.add(Util.nullToStr(analysis.getSamplename()));
            row.add(Util.nullToStr(analysis.getResultpath()));
            row.add(Util.nullToStr(analysis.getReportpath()));
            row.add(Util.nullToStr(analysis.getArgs()));
            row.add(Util.nullToStr(uuid_user.get(analysis.getAnalyst())));
            row.add(Util.nullToStr(analysis.getRemarks()));
            row.add(Util.nullToStr(uuid_subName.get(analysis.getSubid())));
            row.add(Util.nullToStr(Util.statuFlag(analysis.getCurrentstatu())));
            excleRows.add(row);
        }
        return excleRows;
    }

    public void analysisImport(List<List<String>> rows, CibrSysUser user, String processId) {
        CibrTaskProcessAnalysisExample analysisExample = new CibrTaskProcessAnalysisExample();
        analysisExample.createCriteria().andProcessidEqualTo(processId);
        analysisExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessAnalysis> analyses = analysisMapper.selectByExample(analysisExample);
        Map<String,CibrTaskProcessAnalysis> index_analysis = new HashMap<>();
        for (CibrTaskProcessAnalysis analysis : analyses){
            index_analysis.put(analysis.getSampleindex(),analysis);
        }
        Map<String, String> name_id = userService.getname_id();
        for (List<String> row : rows){
            int index = 2;
            CibrTaskProcessAnalysis analysis = index_analysis.get(Util.nullToStr(row.get(0)));
            if (analysis == null
                    || "02".equals(analysis.getCurrentstatu())
            ){
                continue;
            }
            analysis.setResultpath(Util.nullToStr(row.get(index++)));
            analysis.setReportpath(Util.nullToStr(row.get(index++)));
            analysis.setArgs(Util.nullToStr(row.get(index++)));
            analysis.setAnalyst(Util.nullToStr(name_id.get(row.get(index++))));
            analysis.setRemarks(Util.nullToStr(row.get(index++)));
        }
        analysisMapper.batchUpdate(analyses);
    }

    @Transactional(rollbackFor = Exception.class)
    public void handleSampleInput(List<List<String>> rows, MultipartFile file, String processId, CibrSysUser user) {
        String fileName = file.getOriginalFilename();
        List<CibrTaskProcessSampleinput> saveList = new ArrayList<CibrTaskProcessSampleinput>();
        List<CibrTaskProcessSampleinput> updateList = new ArrayList<CibrTaskProcessSampleinput>();
        CibrTaskProcess process = getPorcessById(processId);

        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        sampleinputExample.createCriteria().andProcessidEqualTo(processId);
        sampleinputExample.setOrderByClause("rowIndex");
        List<CibrTaskProcessSampleinput> dblist = sampleinputMapper.selectByExample(sampleinputExample);
        Map<String, CibrTaskProcessSampleinput> index_input = new HashMap<>();
        if (dblist != null && dblist.size()>0){
            for (CibrTaskProcessSampleinput input : dblist){
                index_input.put(input.getSampleindex(),input);
            }
        }
//        if (
//                ("01".equals(process.getSampletype()) && !fileName.contains(FileUtil.NUCLEIC_ACID_FILENAME))
//                || ("02".equals(process.getSampletype()) && !fileName.contains(FileUtil.TISSUE_FILENAME))
//                || ("03".equals(process.getSampletype()) && !fileName.contains(FileUtil.CELL_FILENAME))
//        ){
//            throw new RuntimeException("导入的文件类型与任务类型不相符");
//        }
        Map<String, CibrSysSampleindex> currentIndexs = getCurrentIndex();
        int rowIndex = 0;
        for (List<String> row : rows){
            boolean hasAlreadyExist = false;
            CibrTaskProcessSampleinput input = new CibrTaskProcessSampleinput();
            if (!StringUtils.isEmpty(row.get(3)) && index_input.get(row.get(3)) != null){
                hasAlreadyExist = true;
                input = index_input.get(row.get(3));
                if ("02".equals(input.getCurrentstatu())){
                    continue;
                }
            }else {
                input.setId(Util.getUUID());
                input.setProcessid(processId);
                input.setCreater(user.getId());
                input.setCreatetime(new Date());
                input.setRowindex(rowIndex);
                //上传文件为临时状态，等待用户确认之后再修改状态
                input.setCurrentstatu("01");
            }
            int index = 0;
            input.setArrindex(row.get(index++));
            String initSample = row.get(index++);
            input.setInitsample(FileUtil.getInitSampleType(initSample));
            input.setSamplename(row.get(index++));
            index++;//跳过样本编号填写，在末尾判断。
            input.setSpecies(row.get(index++));
            input.setTissue(row.get(index++));
            String sampleMsg = "";
            String sampleMsgText = row.get(index++);
            if (sampleMsgText != null){
                if (initSample.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                    sampleMsg = FileUtil.getSampleMsgCode(sampleMsgText,FileUtil.NUCLEIC_ACID_FILENAME);
                }else if (initSample.contains(FileUtil.TISSUE_FILENAME)){
                    sampleMsg = FileUtil.getSampleMsgCode(sampleMsgText,FileUtil.TISSUE_FILENAME);
                }else if (initSample.contains(FileUtil.CELL_FILENAME)){
                    sampleMsg = FileUtil.getSampleMsgCode(sampleMsgText,FileUtil.CELL_FILENAME);
                }
            }
            input.setSamplemsg(sampleMsg);
            String sampleStatu = "";
            String sampleStatuText = row.get(index++);
            if (sampleStatuText != null){
                if (initSample.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(sampleStatuText,FileUtil.NUCLEIC_ACID_FILENAME);
                }else if (initSample.contains(FileUtil.TISSUE_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(sampleStatuText,FileUtil.TISSUE_FILENAME);
                }else if (initSample.contains(FileUtil.CELL_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(sampleStatuText,FileUtil.CELL_FILENAME);
                }
            }
            input.setSamplestatu(sampleStatu);
            String tissuenumber = row.get(index++);
            String bloodvolume = row.get(index++);
            if (initSample != null && initSample.contains(FileUtil.TISSUE_FILENAME)){
                input.setTissuenumber(tissuenumber);
                input.setBloodvolume(bloodvolume);
            }
            String concentration = row.get(index++);
            String samplevolume = row.get(index++);
            String totalnumber = row.get(index++);
            if (initSample != null && !initSample.contains(FileUtil.TISSUE_FILENAME)){
                input.setConcentration(concentration);
                input.setSamplevolume(samplevolume);
                input.setTotalnumber(totalnumber);
            }
            String celllife = row.get(index++);
            String cellsort = row.get(index++);
            if (initSample != null && initSample.contains(FileUtil.CELL_FILENAME)){
                input.setCelllife(celllife);
                String cellSort = "";
                cellSort = FileUtil.getCellSortCode(cellsort);
                input.setCellsort(cellSort);
            }
            String databaseType = "";
            String databaseTypeText = row.get(index++);
            if (initSample != null && initSample.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                databaseType = FileUtil.getDatabaseType(databaseTypeText,FileUtil.NUCLEIC_ACID_FILENAME);
            }else if (initSample != null && initSample.contains(FileUtil.TISSUE_FILENAME)){
                databaseType = FileUtil.getDatabaseType(databaseTypeText,FileUtil.TISSUE_FILENAME);
            }else if (initSample != null && initSample.contains(FileUtil.CELL_FILENAME)){
                databaseType = FileUtil.getDatabaseType(databaseTypeText,FileUtil.CELL_FILENAME);
            }
            input.setDatabasetype(databaseType);
            String seq = "";
            seq = FileUtil.getSeqCode(row.get(index++));
            input.setSequencingplatform(seq);
            input.setRemarks(row.get(index++));
            if (hasAlreadyExist){
                updateList.add(input);
            }else {
                if (!StringUtils.isEmpty(input.getSampleindex())){
                    CibrTaskProcessSampleinputExample inputExam = new CibrTaskProcessSampleinputExample();
                    inputExam.createCriteria().andSampleindexEqualTo(row.get(2));
                    List<CibrTaskProcessSampleinput> list = sampleinputMapper.selectByExample(inputExam);
                    if (list != null && list.size()>0){
                        CommonException commonException = new CommonException("【" + row.get(2) +"】重复");
                        throw commonException;
                    }
                    input.setSampleindex(row.get(2));
                }else {
                    String selfNum = Util.getSelfNum(input.getInitsample(), sampleMsg, databaseType);
                    CibrSysSampleindex sampleindex = currentIndexs.get(selfNum);
                    if (sampleindex != null){
                        sampleindex.setCurrentindex(sampleindex.getCurrentindex() + 1);
                        input.setSampleindex(sampleindex.getSelfNum());
                    }
                }
                saveList.add(input);
                rowIndex ++;
            }
        }
        updateSampleIndex(currentIndexs);
        if (updateList.size()>0){
            sampleinputMapper.batchUpdate(updateList);
        }else {
            sampleinputMapper.batchInsert(saveList);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void libImport(List<List<String>> rows, CibrSysUser user, String processId) throws ParseException {
        CibrTaskProcessLibraryExample libraryExample = new CibrTaskProcessLibraryExample();
        libraryExample.createCriteria().andProcessidEqualTo(processId);
        List<CibrTaskProcessLibrary> dblibs = libraryMapper.selectByExample(libraryExample);
        Map<String,CibrTaskProcessLibrary> index_lib = new HashMap<>();
        for (CibrTaskProcessLibrary lib : dblibs){
            index_lib.put(lib.getSelfnumber(),lib);
        }
        Map<String, String> name_id = userService.getname_id();
        for (List<String> row : rows){
            int index = 0;
            CibrTaskProcessLibrary dblib = index_lib.get(row.get(1));
            if (dblib == null
                    || "02".equals(dblib.getCurrentstatu())
                    || "09".equals(dblib.getCurrentstatu())
            ){
                continue;
            }
            String createDbtime = row.get(index++);
            if (!StringUtils.isEmpty(createDbtime)){
                dblib.setCreatedbtime(TimeUtil.str2date(createDbtime,"yyyy-MM-dd"));
            }
            index++;
            dblib.setMiddleindex(Util.nullToStr(row.get(index++)));
            dblib.setSamplename(Util.nullToStr(row.get(index++)));
            dblib.setSpecies(Util.nullToStr(row.get(index++)));
            dblib.setConcentration(Util.nullToStr(row.get(index++)));
            dblib.setTotalnumber(Util.nullToStr(row.get(index++)));
            dblib.setCelllife(Util.nullToStr(row.get(index++)));
            dblib.setUsenumber(Util.nullToStr(row.get(index++)));
            dblib.setPartsize(Util.nullToStr(row.get(index++)));
            dblib.setLibindex(Util.nullToStr(row.get(index++)));
            dblib.setLibbarcode(Util.nullToStr(row.get(index++)));
            dblib.setCyclenumber(Util.nullToStr(row.get(index++)));
            dblib.setDatabasetype(FileUtil.getDatabaseType(row.get(index++),FileUtil.getInitSampleFlag(dblib.getInitsample())));
            dblib.setDatabaseindex(row.get(index++));
            dblib.setCreatedbuser(Util.nullToStr(name_id.get(row.get(index++))));
            dblib.setReviewer(Util.nullToStr(name_id.get(row.get(index++))));
            dblib.setQbit(Util.nullToStr(row.get(index++)));
            dblib.setLibsize(Util.nullToStr(row.get(index++)));
            dblib.setSeqmethods(Util.nullToStr(row.get(index++)));
            dblib.setUploadsize(Util.nullToStr(row.get(index++)));
            dblib.setDatabaseunit(Util.nullToStr(row.get(index++)));
            dblib.setLibremark(Util.nullToStr(row.get(index++)));
            dblib.setUploadremark(Util.nullToStr(row.get(index++)));
        }
        if (dblibs != null && dblibs.size()>0){
            libraryMapper.batchUpdate(dblibs);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteInput(List<String> inputIds, CibrSysUser user) {
        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        sampleinputExample.createCriteria().andIdIn(inputIds);
        List<CibrTaskProcessSampleinput> list = sampleinputMapper.selectByExample(sampleinputExample);
        for (CibrTaskProcessSampleinput input : list){
            input.setCurrentstatu("09");
        }
        sampleinputMapper.batchUpdate(list);
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteByIds(List<String> ids, String type, CibrSysUser user) {
        if ("02".equals(type)){
            // 样本制备
            CibrTaskProcessSamplemakeExample example = new CibrTaskProcessSamplemakeExample();
            example.createCriteria().andIdIn(ids);
            List<CibrTaskProcessSamplemake> samplemakes = makeMapper.selectByExample(example);
            for (CibrTaskProcessSamplemake samplemake : samplemakes){
                samplemake.setCurrentstatu("08");
                samplemake.setUpdateuser(user.getId());
                samplemake.setUpdatetime(new Date());
            }
            makeMapper.batchUpdate(samplemakes);
        }else if ("03".equals(type)){
            //文库制备
            CibrTaskProcessLibraryExample libraryExample = new CibrTaskProcessLibraryExample();
            libraryExample.createCriteria().andIdIn(ids);
            List<CibrTaskProcessLibrary> libs = libraryMapper.selectByExample(libraryExample);
            for (CibrTaskProcessLibrary lib : libs){
                lib.setUpdatetime(new Date());
                lib.setUpdateuser(user.getId());
                lib.setCurrentstatu("08");
            }
            libraryMapper.batchUpdate(libs);
        }else if ("04".equals(type)){
            //测序分析
            CibrTaskProcessDismountdataExample dismountdataExample = new CibrTaskProcessDismountdataExample();
            dismountdataExample.createCriteria().andIdIn(ids);
            List<CibrTaskProcessDismountdata> dis = dismountdataMapper.selectByExample(dismountdataExample);
            for (CibrTaskProcessDismountdata data : dis){
                data.setUpdatetime(new Date());
                data.setUpdateuser(user.getId());
                data.setCurrentstatu("08");
            }
            dismountdataMapper.batchUpdate(dis);
        }
    }


    @Transactional(rollbackFor = Exception.class)
    public void completeProject(String processId, CibrSysUser user) {
        CibrTaskProcess process = processMapper.selectByPrimaryKey(processId);
        process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_COMPLETE);
        processMapper.updateByPrimaryKey(process);

        CibrSysTask task = cibrSysTaskMapper.selectByPrimaryKey(process.getTaskid());
        task.setTaskstatu(TaskUtil.TASK_STATU_SUCCESS);
        task.setHandletime(new Date());
        cibrSysTaskMapper.updateByPrimaryKey(task);
    }

    public List<CibrTaskProcessEmail> findProcessEmails(String processId) {
        CibrTaskProcessEmailExample emailExample = new CibrTaskProcessEmailExample();
        emailExample.createCriteria().andProcessidEqualTo(processId);
        return processEmailMapper.selectByExample(emailExample);
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateProcess(String reason,String remark,String flag,CibrTaskProcess process, CibrSysUser user,boolean isPi) {
        CibrTaskProcess processDatabase = processMapper.selectByPrimaryKey(process.getId());
        if ("refuse".equals(flag)){
            if (
                    !TaskUtil.PROCESS_TASK_STATU_PICONFIRM.equals(processDatabase.getTaskstatu())
                    && !TaskUtil.PROCESS_TASK_STATU_ADMINCONFIRM.equals(processDatabase.getTaskstatu())
                    && !TaskUtil.PROCESS_TASK_STATU_SP.equals(processDatabase.getTaskstatu())
            ){
                return;
            }
            CibrSysTask task = cibrSysTaskMapper.selectByPrimaryKey(process.getTaskid());
            task.setTaskstatu(TaskUtil.TASK_STATU_FAIL);
            task.setHandletime(new Date());
            cibrSysTaskMapper.updateByPrimaryKey(task);
            CibrTaskFail fail = new CibrTaskFail();
            fail.setId(Util.getUUID());
            fail.setReason(reason);
            fail.setCreatetime(new Date());
            fail.setHandler(user.getId());
            fail.setDetailid(process.getId());
            fail.setRemarks(remark);
            failMapper.insert(fail);
            if (isPi){
                process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_PIREFUSE);
            }else {
                process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_ADMINREFUSE);
            }
            processMapper.updateByPrimaryKey(process);
            return;
        }
        if (isPi){
            if (TaskUtil.PROCESS_TASK_STATU_SP.equals(process.getTaskstatu())){
                process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_PICONFIRM);
            }else if (TaskUtil.PROCESS_TASK_STATU_ADMINCONFIRM.equals(process.getTaskstatu())){
                process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SPWAIT);
            }
        }else {
            if (TaskUtil.PROCESS_TASK_STATU_PICONFIRM.equals(processDatabase.getTaskstatu())){
                process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SPWAIT);
            }else if(TaskUtil.PROCESS_TASK_STATU_SP.equals(processDatabase.getTaskstatu())){
                process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_ADMINCONFIRM);
            }
        }
        processMapper.updateByPrimaryKey(process);
        if (TaskUtil.PROCESS_TASK_STATU_SPWAIT.equals(process.getTaskstatu())){
            sendProcessPriEmail(process, userMapper.selectByPrimaryKey(process.getCreater()));
        }
    }

    public void sendProcessPriEmail(CibrTaskProcess process, CibrSysUser user) {
        Map<String, CibrSysUser> uuid_user = userService.getuuid_userObject();
        String emailEnd = "\n如有疑问，请联系【" + user.getEmail() + "】" + Util.EMAIL_SUFFIX;
        String inputEmail = Util.EMAIL_PREFIX + "您有一个【测序流程】任务，项目名称【" + process.getProjectname()
                + "】，您被指定为【样品录入负责人】，请及时处理！" + emailEnd;
        CibrSysUser sampleInput = uuid_user.get(process.getSampleinput());
        emailService.simpleSendEmail(inputEmail,sampleInput.getEmail(),TaskUtil.TASK_PROCESS);

        String makeEmail = Util.EMAIL_PREFIX + "您有一个【测序流程】任务，项目名称【" + process.getProjectname()
                + "】，您被指定为【样品制备负责人】，请及时处理！" + emailEnd;
        CibrSysUser make = uuid_user.get(process.getSamplepreparation());
        emailService.simpleSendEmail(makeEmail,make.getEmail(),TaskUtil.TASK_PROCESS);

        String libEmail = Util.EMAIL_PREFIX + "您有一个【测序流程】任务，项目名称【" + process.getProjectname()
                + "】，您被指定为【文库制备负责人】，请及时处理！" + emailEnd;
        CibrSysUser lib = uuid_user.get(process.getSamplepreparation());
        emailService.simpleSendEmail(libEmail,lib.getEmail(),TaskUtil.TASK_PROCESS);

        String disEmail = Util.EMAIL_PREFIX + "您有一个【测序流程】任务，项目名称【" + process.getProjectname()
                + "】，您被指定为【数据交付负责人】，请及时处理！" + emailEnd;
        CibrSysUser dis = uuid_user.get(process.getSamplepreparation());
        emailService.simpleSendEmail(disEmail,dis.getEmail(),TaskUtil.TASK_PROCESS);

        String bioEmail = Util.EMAIL_PREFIX + "您有一个【测序流程】任务，项目名称【" + process.getProjectname()
                + "】，您被指定为【生信分析负责人】，请及时处理！" + emailEnd;
        CibrSysUser bio = uuid_user.get(process.getSamplepreparation());
        emailService.simpleSendEmail(bioEmail,bio.getEmail(),TaskUtil.TASK_PROCESS);
    }

    public CibrSysTask selectTask(String taskid) {
        return cibrSysTaskMapper.selectByPrimaryKey(taskid);
    }

    @Transactional(rollbackFor = Exception.class)
    public void piConfrim(String tmpIdp) {
        CibrTaskProcess process = processMapper.selectByPrimaryKey(tmpIdp);
        String pre = process.getTaskstatu();
        if (TaskUtil.PROCESS_TASK_STATU_SP.equals(process.getTaskstatu())){
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_PICONFIRM);
        }else if (TaskUtil.PROCESS_TASK_STATU_ADMINCONFIRM.equals(process.getTaskstatu())){
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_SPWAIT);
        }
        processMapper.updateByPrimaryKey(process);
        CibrSysUser groupAdmin = userService.getGroupAdmin(process.getCreater());
        CibrSysTaskBusiness business = new CibrSysTaskBusiness();
        business.setId(Util.getUUID());
        business.setTaskid(process.getTaskid());
        business.setCreatetime(new Date());
        business.setPrestatu(pre);
        business.setNextstatu(process.getTaskstatu());
        business.setBusiness("PI确认项目");
        business.setUserid(groupAdmin.getId());
        businessMapper.insert(business);
    }

    @Transactional(rollbackFor = Exception.class)
    public void piRefuse(String tmpIdp) {
        CibrTaskProcess process = processMapper.selectByPrimaryKey(tmpIdp);
        if (!TaskUtil.PROCESS_TASK_STATU_SP.equals(process.getTaskstatu())
                && !TaskUtil.PROCESS_TASK_STATU_ADMINCONFIRM.equals(process.getTaskstatu())
        ){
            return;
        }
        CibrSysTask task = cibrSysTaskMapper.selectByPrimaryKey(process.getTaskid());
        task.setTaskstatu(TaskUtil.TASK_STATU_FAIL);
        task.setHandletime(new Date());
        cibrSysTaskMapper.updateByPrimaryKey(task);

        String pre = process.getTaskstatu();
        if (!TaskUtil.PROCESS_TASK_STATU_COMPLETE.equals(process.getTaskstatu())){
            process.setTaskstatu(TaskUtil.PROCESS_TASK_STATU_COMPLETE);
        }
        CibrSysUser groupAdmin = userService.getGroupAdmin(process.getCreater());
        processMapper.updateByPrimaryKey(process);

        CibrTaskFail fail = new CibrTaskFail();
        fail.setDetailid(process.getId());
        fail.setHandler(groupAdmin.getId());
        fail.setCreatetime(new Date());
        fail.setId(Util.getUUID());
        fail.setReason("PI拒绝！");
        failMapper.insert(fail);

        CibrSysTaskBusiness business = new CibrSysTaskBusiness();
        business.setId(Util.getUUID());
        business.setTaskid(process.getTaskid());
        business.setCreatetime(new Date());
        business.setPrestatu(pre);
        business.setNextstatu(process.getTaskstatu());
        business.setBusiness("PI拒绝");
        business.setUserid(groupAdmin.getId());
        businessMapper.insert(business);
    }

    public CibrTaskFail findError(String processId) {
        CibrTaskFailExample example = new CibrTaskFailExample();
        example.createCriteria().andDetailidEqualTo(processId);
        List<CibrTaskFail> fails = failMapper.selectByExample(example);
        if (fails == null || fails.size() == 0){
            return null;
        }
        return fails.get(0);
    }

    public void batchInsertFails(List<String> ids, String reason, String remark, CibrSysUser user) {
        List<CibrTaskFail> fails = new ArrayList<>();
        for (String id : ids){
            CibrTaskFail fail = new CibrTaskFail();
            fail.setId(Util.getUUID());
            fail.setDetailid(id);
            fail.setRemarks(remark);
            fail.setReason(reason);
            fail.setHandler(user.getId());
            fail.setCreatetime(new Date());
            fails.add(fail);
        }
        failMapper.batchInsert(fails);
    }
}
























