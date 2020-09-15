package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.service.LoginService;
import com.cibr.animal.demo.service.ProcessTaskService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ProcessController {

    @Autowired
    ProcessTaskService processTaskService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private LoginService loginService;

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
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("process",process);
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

    @RequestMapping("/task/process/sampleInput")
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
            retMap.put("subs",allSubTask);
            retMap.put("sampleInputs",sampleInputs);
            ret.setRetMap(retMap);
            ret.setCode("200");
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
            processTaskService.saveSampleInput(processId,user,list,type);
            ret.setCode("200");
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
            retMap.put("makes",allTodoMakes);
            retMap.put("allUsers",allUsers);
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
            retMap.put("libs",libs);
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

    @RequestMapping("/task/process/dismountInit")
    public String dismountInit(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            boolean showAll = (boolean) requestBody.get("showAll");
            List<CibrTaskProcessDismountdata> list = processTaskService.selectAllDismountDatas(processId,showAll);
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("allUsers",allUsers);
            retMap.put("datas",list);
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
            CibrTaskProcessSubtask subtask = processTaskService.selectSubTaskById(subId);
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("allUsers",allUsers);
            retMap.put("datas",analyses);
            retMap.put("subtask",subtask);
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
            List<CibrTaskProcessAnalysis> analyses = JSON.parseArray(datas, CibrTaskProcessAnalysis.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveAnalyses(processId,subId,analyses,type,user);
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
        HSSFWorkbook sheets = processTaskService.downloadSampleInput(processId, user);
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
        String subId = (String) requestBody.get("subId");
        HSSFWorkbook sheets = processTaskService.downloadMakes(subId, user);
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

    @RequestMapping("/task/process/downloadLibs")
    public void downloadLibs(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody) throws IOException {
        String token = request.getHeader("token");
        CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
        String subId = (String) requestBody.get("subId");
        HSSFWorkbook sheets = processTaskService.downloadLibs(subId, user);
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
        String subId = (String) requestBody.get("subId");
        HSSFWorkbook sheets = processTaskService.downloadDismount(subId, user);
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
        String subId = (String) requestBody.get("subId");
        HSSFWorkbook sheets = processTaskService.downloadAnalysis(subId, user);
        OutputStream outputStream = response.getOutputStream();
        response.setHeader("Content-disposition", "attachment; filename=Info.xls");
        response.setContentType("application/msexcel");
        sheets.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }
}
