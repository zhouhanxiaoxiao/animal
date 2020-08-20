package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrTaskProcess;
import com.cibr.animal.demo.entity.CibrTaskProcessSampleinput;
import com.cibr.animal.demo.entity.CibrTaskProcessSamplemake;
import com.cibr.animal.demo.service.ProcessTaskService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
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
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
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
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping("/task/process/commitDatas")
    public String sampleInputSave(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            String datas = (String) requestBody.get("datas");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<CibrTaskProcessSampleinput> list = JSON.parseArray(datas, CibrTaskProcessSampleinput.class);
            processTaskService.saveSampleInput(processId,user,list);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping("/task/process/makeInit")
    public String makeInit(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String processId = (String) requestBody.get("processId");
            List<CibrTaskProcessSamplemake> allTodoMakes = processTaskService.getAllTodoMakes(processId);
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("makes",allTodoMakes);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }
}
