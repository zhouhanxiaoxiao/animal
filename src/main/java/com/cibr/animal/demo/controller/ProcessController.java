package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.service.CibrSysUserService;
import com.cibr.animal.demo.service.LoginService;
import com.cibr.animal.demo.service.ProcessTaskService;
import com.cibr.animal.demo.service.TaskService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import com.cibr.animal.demo.util.TaskUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
public class ProcessController {

    @Autowired
    ProcessTaskService processTaskService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private LoginService loginService;

    @Autowired
    private CibrSysUserService userService;

    @Autowired
    private TaskService taskService;

    private Logger logger = LoggerFactory.getLogger(ProcessController.class);

    @RequestMapping("/task/process/init")
    public String getProcess(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            CibrTaskProcess process = processTaskService.getProcessByTaskId(taskId);
//            processTaskService.getProcessBySubTaskId(subId);
            CibrTaskFail error = processTaskService.findError(process.getId());
            CibrSysUserGroup group = userService.getGroupByName("基因组学中心");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> map = processTaskService.countTaskNum(process.getId(), user);
            Map<String, String> unCommitNext = processTaskService.findUnCommitNext(process.getId(), user);
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("process",process);
            retMap.put("fail",error);
            retMap.put("group",group);
            retMap.put("unCommitNext",unCommitNext);
            retMap.putAll(map);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/subinit")
    public String subInit(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String subId = (String) requestBody.get("subId");
            Map<String, Object> retMap = processTaskService.getProcessBySubTaskId(subId);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("task/process/sampleInput")
    public String sampleInputInit(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String curFlag = (String) requestBody.get("curFlag");
            String subId = (String) requestBody.get("subId");
            Map<String,Object> retMap = new HashMap<>();
            List<CibrTaskProcessSampleinput> sampleInputs = processTaskService.getSampleInputs(processId,curFlag,subId);
            List<CibrTaskProcessSubtask> allSubTask = processTaskService.getAllSubTask(processId, TaskUtil.PROCESS_TASK_STATU_SP);
            Map<String, Object> operators = processTaskService.getOperators(processId);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> map = processTaskService.countTaskNum(processId, user);
            retMap.putAll(map);
            retMap.put("subs",allSubTask);
            retMap.put("sampleInputs",sampleInputs);
            retMap.put("operators",operators);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("task/process/changeTipNum")
    public String changeTipNum(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            Map<String,Object> retMap = new HashMap<>();
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> map = processTaskService.countTaskNum(processId, user);
            retMap.putAll(map);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/refuseInput")
    public String refuseInput(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<CibrTaskProcessSampleinput> list = JSON.parseArray(datas, CibrTaskProcessSampleinput.class);
            Map<String, Object> map = processTaskService.saveSampleInput(processId, user, list, type);
            List<String> ids = list.stream().map(ip -> ip.getId()).collect(Collectors.toList());
            processTaskService.batchInsertFails(ids,reason,remark,user);
            ret.setRetMap(map);
            ret.setCode((String) map.get("retCode"));
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/commitDatas")
    public String sampleInputSave(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<CibrTaskProcessSampleinput> list = JSON.parseArray(datas, CibrTaskProcessSampleinput.class);
            Map<String, Object> map = processTaskService.saveSampleInput(processId, user, list, type);
            ret.setRetMap(map);
            ret.setCode((String) map.get("retCode"));
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/startSubTask")
    public String startSubTask(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            String datas = (String) requestBody.get("datas");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<CibrTaskProcessSampleinput> list = JSON.parseArray(datas, CibrTaskProcessSampleinput.class);
            processTaskService.startSubTask(processId,list,subProcessName,remarks,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/makeInit")
    public String makeInit(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            String curFlag = (String) requestBody.get("curFlag");
            List<CibrTaskProcessSamplemake> allTodoMakes = processTaskService.getAllTodoMakes(processId,subId,curFlag);
            List<CibrTaskProcessSubtask> allSubTask = processTaskService.getAllSubTask(processId,TaskUtil.PROCESS_TASK_STATU_SPWAIT);
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            Map<String,Object> retMap = new HashMap<>();
            Map<String, Object> operators = processTaskService.getOperators(processId);
            retMap.put("makes",allTodoMakes);
            retMap.put("allUsers",allUsers);
            retMap.put("operators",operators);
            retMap.put("subs",allSubTask);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/submitMakes")
    public String submitMakes(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
//            String subId = (String) requestBody.get("subId");
            String data = (String) requestBody.get("data");
            String flag = (String) requestBody.get("flag");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<CibrTaskProcessSamplemake> list = JSON.parseArray(data, CibrTaskProcessSamplemake.class);
            processTaskService.saveSampleMakes(processId,flag,list,user,null,subProcessName,remarks);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/unPassMakes")
    public String unPassMakes(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String data = (String) requestBody.get("data");
            String flag = (String) requestBody.get("flag");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<CibrTaskProcessSamplemake> list = JSON.parseArray(data, CibrTaskProcessSamplemake.class);
            processTaskService.saveSampleMakes(processId,flag,list,user,null,subProcessName,remarks);
            List<String> ids = list.stream().map(make -> make.getId()).collect(Collectors.toList());
            processTaskService.batchInsertFails(ids,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/libInit")
    public String libInit(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            List<CibrTaskProcessLibrary> libs = processTaskService.selectAllLibs(processId,subId);
            List<CibrTaskProcessSubtask> allSubTask = processTaskService.getAllSubTask(processId, TaskUtil.PROCESS_TASK_STATU_LIB);
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            Map<String,Object> retMap = new HashMap<>();
            Map<String, Object> operators = processTaskService.getOperators(processId);
            retMap.put("libs",libs);
            retMap.put("operators",operators);
            retMap.put("subs",allSubTask);
            retMap.put("allUsers",allUsers);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/tempSaveLib")
    public String tempSaveLib(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            List<CibrTaskProcessLibrary> libs = JSON.parseArray(datas, CibrTaskProcessLibrary.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.tempSaveLibs(processId,libs,type,user,subId,subProcessName,remarks);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/unPassLibs")
    public String unPassLibs(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            List<CibrTaskProcessLibrary> libs = JSON.parseArray(datas, CibrTaskProcessLibrary.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.tempSaveLibs(processId,libs,type,user,subId,subProcessName,remarks);
            List<String> ids = libs.stream().map(lib -> lib.getId()).collect(Collectors.toList());
            processTaskService.batchInsertFails(ids,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/dismountInit")
    public String dismountInit(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            List<CibrTaskProcessDismountdata> list = processTaskService.selectAllDismountDatas(processId,subId);
            List<CibrTaskProcessSubtask> allSubTask = processTaskService.getAllSubTask(processId, TaskUtil.PROCESS_TASK_STATU_DIS);
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            CibrSysUser bioAnalysis = processTaskService.getBioAnalysis(processId);
            Map<String,Object> retMap = new HashMap<>();
            Map<String, Object> operators = processTaskService.getOperators(processId);
            retMap.put("allUsers",allUsers);
            retMap.put("operators",operators);
            retMap.put("datas",list);
            retMap.put("subs",allSubTask);
            retMap.put("bioAnalysis",bioAnalysis);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/saveDismountData")
    public String saveDismountData(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
//            String subId = (String) requestBody.get("subId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            List<CibrTaskProcessDismountdata> dismountdata = JSON.parseArray(datas, CibrTaskProcessDismountdata.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveDismountData(processId,null,dismountdata,type,user,subProcessName,remarks);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/saveConfirms")
    public String saveConfirms(HttpServletRequest request,
                                   HttpServletResponse response,
                                   @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            List<CibrTaskProcessConfirm> confirms = JSON.parseArray(datas, CibrTaskProcessConfirm.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveConfirms(processId,null,confirms,type,user,subProcessName,remarks);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }


    @RequestMapping("/task/process/unPassConfirms")
    public String unPassConfirms(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            List<CibrTaskProcessConfirm> confirms = JSON.parseArray(datas, CibrTaskProcessConfirm.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveConfirms(processId,null,confirms,type,user,subProcessName,remarks);
            List<String> ids = confirms.stream().map(confirm -> confirm.getId()).collect(Collectors.toList());
            processTaskService.batchInsertFails(ids,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }


    @RequestMapping("/task/process/refuseDis")
    public String refuseDis(HttpServletRequest request,
                                   HttpServletResponse response,
                                   @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            List<CibrTaskProcessDismountdata> dismountdata = JSON.parseArray(datas, CibrTaskProcessDismountdata.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveDismountData(processId,null,dismountdata,type,user,subProcessName,remarks);
            List<String> ids = dismountdata.stream().map(dis -> dis.getId()).collect(Collectors.toList());
            processTaskService.batchInsertFails(ids,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/analyseInit")
    public String analyseInit(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            List<CibrTaskProcessAnalysis> analyses = processTaskService.selectAllAnalyses(processId,subId);
            List<CibrTaskProcessSubtask> allSubTask = processTaskService.getAllSubTask(processId, TaskUtil.PROCESS_TASK_STATU_BA);
            Map<String,Object> retMap = new HashMap<>();
            Map<String, Object> operators = processTaskService.getOperators(processId);
            retMap.put("allUsers",allUsers);
            retMap.put("operators",operators);
            retMap.put("datas",analyses);
            retMap.put("subs",allSubTask);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/initConfirm")
    public String initConfirm(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            List<CibrTaskProcessConfirm> confirms = processTaskService.selectAllConfirms(processId, subId);
            List<CibrTaskProcessSubtask> allSubTask = processTaskService.getAllSubTask(processId, TaskUtil.PROCESS_TASK_STATU_CONFIRM);
            Map<String,Object> retMap = new HashMap<>();
            Map<String, Object> operators = processTaskService.getOperators(processId);
            retMap.put("operators",operators);
            retMap.put("allUsers",allUsers);
            retMap.put("datas",confirms);
            retMap.put("subs",allSubTask);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/saveAnalyse")
    public String saveAnalyse(HttpServletRequest request,
                                   HttpServletResponse response,
                                   @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            List<CibrTaskProcessAnalysis> analyses = JSON.parseArray(datas, CibrTaskProcessAnalysis.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveAnalyses(processId,subId,analyses,type,user,subProcessName,remarks);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/refuseAnalysis")
    public String refuseAnalysis(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String subId = (String) requestBody.get("subId");
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            String subProcessName = (String) requestBody.get("subProcessName");
            String remarks = (String) requestBody.get("remarks");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            List<CibrTaskProcessAnalysis> analyses = JSON.parseArray(datas, CibrTaskProcessAnalysis.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveAnalyses(processId,subId,analyses,type,user,subProcessName,remarks);
            List<String> ids = analyses.stream().map(an -> an.getId()).collect(Collectors.toList());
            processTaskService.batchInsertFails(ids,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/downloadSampleInput")
    public void downloadSampleInput(HttpServletRequest request,
                                    HttpServletResponse response,
                                    @RequestBody Map requestBody) throws IOException {
        String token = request.getHeader("token");
        CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
        String processId = (String) requestBody.get("processId");
        String inputIds = (String) requestBody.get("inputIds");
        List<String> ids = JSON.parseArray(inputIds, String.class);
        HSSFWorkbook sheets = processTaskService.downloadSampleInput(processId, user,ids);
        OutputStream outputStream = response.getOutputStream();
        response.setHeader("Content-disposition", "attachment; filename=Info.xls");
        response.setContentType("application/msexcel");
        sheets.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    @RequestMapping("/task/process/stopMake")
    public String stopMake(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String makeId = (String) requestBody.get("makeId");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.stopMake(makeId,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/showStopReason")
    public String showStopReason(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String detailId = (String) requestBody.get("detailId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            String reason = processTaskService.showStopReason(detailId);
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("reason",reason);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/downloadMakes")
    public void downloadMakes(HttpServletRequest request,
                                    HttpServletResponse response,
                                    @RequestBody Map requestBody) throws IOException {
        String token = request.getHeader("token");
        CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
        String processId = (String) requestBody.get("processId");
        String makeIds = (String) requestBody.get("makeIds");
        List<String> ids = JSON.parseArray(makeIds, String.class);
        HSSFWorkbook sheets = processTaskService.downloadMakes(processId, user,ids);
        OutputStream outputStream = response.getOutputStream();
        response.setHeader("Content-disposition", "attachment; filename=Info.xls");
        response.setContentType("application/msexcel");
        sheets.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    @RequestMapping("/task/process/stopLib")
    public String stopLib(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String libId = (String) requestBody.get("libId");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.stopLib(libId,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/deleteByIds")
    public String deleteByIds(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            List<String> ids = (List<String>) requestBody.get("ids");
            String type = (String) requestBody.get("type");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.deleteByIds(ids,type,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/downloadLibs")
    public void downloadLibs(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody) throws IOException {
        String token = request.getHeader("token");
        CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
        String processId = (String) requestBody.get("processId");
        String libIds = (String) requestBody.get("libIds");
        List<String> ids = JSON.parseArray(libIds, String.class);
        HSSFWorkbook sheets = processTaskService.downloadLibs(processId, user, ids);
        OutputStream outputStream = response.getOutputStream();
        response.setHeader("Content-disposition", "attachment; filename=Info.xls");
        response.setContentType("application/msexcel");
        sheets.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    @RequestMapping("/task/process/downloadConfirms")
    public void downloadConfirms(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody) throws IOException {
        String token = request.getHeader("token");
        CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
        String processId = (String) requestBody.get("processId");
        String confirmIds = (String) requestBody.get("confirmIds");
        List<String> ids = JSON.parseArray(confirmIds, String.class);
        HSSFWorkbook sheets = processTaskService.downloadConfirms(processId, user, ids);
        OutputStream outputStream = response.getOutputStream();
        response.setHeader("Content-disposition", "attachment; filename=Info.xls");
        response.setContentType("application/msexcel");
        sheets.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    @RequestMapping("/task/process/downloadDismount")
    public void downloadDismount(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody) throws IOException {
        String token = request.getHeader("token");
        CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
        String processId = (String) requestBody.get("processId");
        String disIds = (String) requestBody.get("disIds");
        List<String> list = JSON.parseArray(disIds, String.class);
        HSSFWorkbook sheets = processTaskService.downloadDismount(processId, user,list);
        OutputStream outputStream = response.getOutputStream();
        response.setHeader("Content-disposition", "attachment; filename=Info.xls");
        response.setContentType("application/msexcel");
        sheets.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    @RequestMapping("/task/process/downloadAnalysis")
    public void downloadAnalysis(HttpServletRequest request,
                                 HttpServletResponse response,
                                 @RequestBody Map requestBody) throws IOException {
        String token = request.getHeader("token");
        CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
        String processId = (String) requestBody.get("processId");
        String idsStr = (String) requestBody.get("ids");
        List<String> ids = JSON.parseArray(idsStr, String.class);
        HSSFWorkbook sheets = processTaskService.downloadAnalysis(processId, user,ids);
        OutputStream outputStream = response.getOutputStream();
        response.setHeader("Content-disposition", "attachment; filename=Info.xls");
        response.setContentType("application/msexcel");
        sheets.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }

    @RequestMapping("/task/process/deleteInput")
    public String deleteInput(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            List<String> inputIds = (List<String>) requestBody.get("inputIds");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.deleteInput(inputIds,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/completeProject")
    public String completeProject(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.completeProject(processId,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/initAllConfirm")
    public String initAllConfirm(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String flag = (String) requestBody.get("flag");
            String stat = (String) requestBody.get("stat");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> map = processTaskService.initAllConfirm(processId, flag, stat);
            Map retMap = new HashMap();
            retMap.putAll(map);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/initAllStatu")
    public String initAllStatu(HttpServletRequest request,
                                 HttpServletResponse response,
                                 @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<Map<String, String>> maps = processTaskService.initAllStatu(processId, user);
            Map retMap = new HashMap();
            retMap.put("list",maps);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/baseInfo")
    public String processBaseInfo(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            Map retMap = new HashMap();
            String processId = (String) requestBody.get("processId");
            List<CibrSysUser> allUsers = userService.getAllUsers();
            retMap.put("users",allUsers);
            List<CibrTaskProcessEmail> processEmails = processTaskService.findProcessEmails(processId);
            CibrSysUserGroup jyzxzx = userService.getGroupByName("基因组学中心");
            CibrTaskProcess process = processTaskService.getPorcessById(processId);
            CibrSysUser groupAdmin = userService.getGroupAdmin(process.getCreater());
            CibrSysTask task = processTaskService.selectTask(process.getTaskid());
            CibrTaskFail error = processTaskService.findError(processId);
            List<CibrSysUser> groupReviewer = userService.findGroupReviewer(process.getCreater());
            retMap.put("processEmails",processEmails);
            retMap.put("jyzxzx",jyzxzx);
            retMap.put("task",task);
            retMap.put("groupAdmin",groupAdmin);
            retMap.put("fail",error);
            retMap.put("groupReviewer",groupReviewer);

            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/setPrincepal")
    public String setPrincepal(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processStr = (String) requestBody.get("process");
            String flag = (String) requestBody.get("flag");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            CibrTaskProcess process = JSONObject.parseObject(processStr, CibrTaskProcess.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.updateProcess(reason,remark,flag,process,user,false);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/pisetPrincepal")
    public String pisetPrincepal(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processStr = (String) requestBody.get("process");
            String flag = (String) requestBody.get("flag");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            CibrTaskProcess process = JSONObject.parseObject(processStr, CibrTaskProcess.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.updateProcess(reason,remark,flag,process,user,true);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/passItem")
    public String passItem(HttpServletRequest request,
                                 HttpServletResponse response,
                                 @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String item = (String) requestBody.get("item");
            String flag = (String) requestBody.get("flag");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.passItem(item,flag,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/unPassItem")
    public String unPassItem(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String item = (String) requestBody.get("item");
            String flag = (String) requestBody.get("flag");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.unPassItem(item,flag,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/nextStep")
    public String nextStep(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String item = (String) requestBody.get("item");
            String flag = (String) requestBody.get("flag");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.nextStep(item,flag,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/allData")
    public String allData(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String flag = (String) requestBody.get("flag");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> stringObjectMap = processTaskService.allData(processId, flag, user);
            ret.setRetMap(stringObjectMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/diyStatuInit")
    public String diyStatuInit(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> map = processTaskService.diyStatuInit(processId, user);
            ret.setRetMap(map);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/saveDiyStatu")
    public String saveDiyStatu(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String diyStatuStr = (String) requestBody.get("diyStatu");
            CibrTaskProcessDiystatu diyStatu = JSONObject.parseObject(diyStatuStr, CibrTaskProcessDiystatu.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveDiyStatu(diyStatu, user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/process/deleteDiyStatu")
    public String deleteDiyStatu(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String id = (String) requestBody.get("id");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.deleteDiyStatu(id, user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/emailTmp/piConfirm")
    public String piConfirm(HttpServletRequest request,
                                 HttpServletResponse response) throws IOException {
        String tmpIdp = (String) request.getParameter("tmpId");
        logger.info("实验室PI确认！");
        processTaskService.piConfrim(tmpIdp);
        return "操作成功！";
    }

    @RequestMapping("/emailTmp/piRefuse")
    public String piRefuse(HttpServletRequest request,
                            HttpServletResponse response) throws IOException {
        String tmpIdp = (String) request.getParameter("tmpId");
        logger.info("实验室PI拒绝！");
        processTaskService.piRefuse(tmpIdp);
        return "操作成功！";
    }

}
