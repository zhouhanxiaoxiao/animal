package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.service.LoginService;
import com.cibr.animal.demo.service.ProcessTaskService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping("/task/process/sampleInput")
    public String sampleInputInit(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            Map<String,Object> retMap = new HashMap<>();
            List<CibrTaskProcessSampleinput> sampleInputs = processTaskService.getSampleInputs(processId);
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

    @RequestMapping("/task/process/makeInit")
    public String makeInit(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            List<CibrTaskProcessSamplemake> allTodoMakes = processTaskService.getAllTodoMakes(processId);
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("makes",allTodoMakes);
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

    @RequestMapping("/task/process/submitMakes")
    public String submitMakes(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String data = (String) requestBody.get("data");
            logger.info("data : =========== : " + data);
            String flag = (String) requestBody.get("flag");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<CibrTaskProcessSamplemake> list = JSON.parseArray(data, CibrTaskProcessSamplemake.class);
            processTaskService.saveSampleMakes(processId,flag,list,user);
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
            List<CibrTaskProcessLibrary> libs = processTaskService.selectAllLibs(processId);
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("libs",libs);
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
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            List<CibrTaskProcessLibrary> libs = JSON.parseArray(datas, CibrTaskProcessLibrary.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.tempSaveLibs(processId,libs,type,user);
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
            List<CibrTaskProcessDismountdata> list = processTaskService.selectAllDismountDatas(processId);
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
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            List<CibrTaskProcessDismountdata> dismountdata = JSON.parseArray(datas, CibrTaskProcessDismountdata.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveDismountData(processId,dismountdata,type,user);
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
            List<CibrSysUser> allUsers = loginService.findAllUsers();
            List<CibrTaskProcessAnalysis> analyses = processTaskService.selectAllAnalyses(processId);
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("allUsers",allUsers);
            retMap.put("datas",analyses);
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
            String datas = (String) requestBody.get("datas");
            String type = (String) requestBody.get("type");
            List<CibrTaskProcessAnalysis> analyses = JSON.parseArray(datas, CibrTaskProcessAnalysis.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            processTaskService.saveAnalyses(processId,analyses,type,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}
