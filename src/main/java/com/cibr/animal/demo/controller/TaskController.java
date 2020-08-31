package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrAnimalDrosophila;
import com.cibr.animal.demo.entity.CibrSysMaterial;
import com.cibr.animal.demo.entity.CibrSysTask;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.*;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class TaskController {

    @Autowired
    PersonalService personalService;

    @Autowired
    TaskService taskService;

    @Autowired
    CibrSysUserService userService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private MeterialService meterialService;


    @RequestMapping("/orderTask/init")
    public String initOrderTask(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> result = new HashMap<String, Object>();
            List<String> stockIds = (List<String>) requestBody.get("stockIds");
            Map<String, Object> retMap = personalService.stockTable(0, 0);
            List<Map<String, Object>> stockTable = taskService.getTaskStock(stockIds, (List<Map<String, Object>>) retMap.get("stockTable"));
            List<CibrSysUser> userByRole = userService.findUserByRole("01");
            List<CibrSysUser> supporters = userService.findUserByRole("02");
            List<CibrAnimalDrosophila> allDrosophila = taskService.findAllDrosophila();
            List<CibrSysMaterial> allMerial = meterialService.getAllMerial();
            result.put("stockTable", stockTable);
            result.put("researchers", userByRole);
            result.put("supporters", supporters);
            result.put("allDrosophila", allDrosophila);
            result.put("allMerial",allMerial);
            ret.setCode("200");
            ret.setRetMap(result);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/askTask")
    public String createAskTask(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            Map<String, Object> result = new HashMap<String, Object>();
            HashMap<String, Object> postData = (HashMap<String, Object>) requestBody.get("postData");
            List<String> selectedStudyDirector = (List<String>) postData.get("selectedStudyId");
            String remarks = (String) postData.get("remarks");
            String urgent = (String) postData.get("urgent");
            String supporter = (String) postData.get("supporter");
            Map<String, Object> detailData = (Map<String, Object>) postData.get("detailData");

            taskService.createAskTask(supporter,user, selectedStudyDirector, remarks, urgent, detailData);

            ret.setCode("200");
            ret.setRetMap(result);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/gatAllTask")
    public String getAllTask(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            Integer currentPage = (Integer) requestBody.get("currentPage");
            Integer pageSize = (Integer) requestBody.get("pageSize");

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> allTask = taskService.findAllTask(currentPage, pageSize, user);
            ret.setRetMap(allTask);
            ret.setCode("200");
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/askTaskDetail")
    public String askTaskDetail(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            Map<String, Object> taskDetail = taskService.findTaskDetail(taskId);
            ret.setRetMap(taskDetail);
            ret.setCode("200");
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/refuse")
    public String refuseAsk(HttpServletRequest request,
                            HttpServletResponse response,
                            @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            String reason = (String) requestBody.get("reason");
            String detailId = (String) requestBody.get("detailId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.refuseAskTask(taskId,reason,detailId,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/task/ask/confirm")
    public String confirmAsk(HttpServletRequest request,
                            HttpServletResponse response,
                            @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String isNeedMore = (String) requestBody.get("isNeedMore");
            String startDate = (String) requestBody.get("startDate");
            String endDate = (String) requestBody.get("endDate");
            String remarks = (String) requestBody.get("remarks");
            String taskid = (String) requestBody.get("taskid");
            String detailId = (String) requestBody.get("detailId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.confirmTask(taskid,detailId,isNeedMore,startDate,endDate,remarks,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/getPrepare")
    public String prepared(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String askId = (String) requestBody.get("askId");
            Map<String, Object> prepare = taskService.getPrepare(askId);
            ret.setRetMap(prepare);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/confirmPrepare")
    public String confirmPrepare(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String prepId = (String) requestBody.get("id");
            String readyTime = (String) requestBody.get("readyTime");
            String allowTime = (String) requestBody.get("allowTime");
            String remarks = (String) requestBody.get("remarks");
            Integer realAge = 0;
            Integer realNumber = 0;
            try {
                realAge = Integer.parseInt((String) requestBody.get("realAge"));
            }catch (ClassCastException exception){
                realAge = (Integer) requestBody.get("realAge");
            }
            try {
                realNumber = (Integer) requestBody.get("realNumber");
            }catch (ClassCastException exception){
                realNumber =  Integer.parseInt((String) requestBody.get("realNumber"));
            }
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.confrimPrepare(prepId,readyTime,allowTime,remarks,realAge,realNumber,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/confirmTask")
    public String createrConfirmTask(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String prepareId = (String) requestBody.get("id");
            String isComplete = (String) requestBody.get("isComplete");
            String remarks = (String) requestBody.get("remarks");

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.createrConfirmTask(prepareId,isComplete,remarks,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/user/allowTask")
    public String userAllowTask(HttpServletRequest request,
                                     HttpServletResponse response,
                                     @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            Map<String, Object> userAllowTask = taskService.getUserAllowTask(taskId);
            ret.setRetMap(userAllowTask);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        System.out.println(JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect));
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/user/refuseAllow")
    public String refuseAllow(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            String reason = (String) requestBody.get("reason");
            String remarks = (String) requestBody.get("remarks");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            taskService.refuseUserAllow(taskId,reason,remarks,user);

            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/user/allowCreate")
    public String allowCreate(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            List<String> roles = (List<String>) requestBody.get("roles");
            String taskId = (String) requestBody.get("taskId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            taskService.allowCreateUser(roles,taskId,user);

            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/addProcess")
    public String addProcess(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String projectName = (String) requestBody.get("projectName");
            String dataType = (String) requestBody.get("dataType");
            String principal = (String) requestBody.get("principal");
            List<String> emails = (List<String>) requestBody.get("emails");
            String sampleMsg = (String) requestBody.get("sampleMsg");
            String samplePreparation = (String) requestBody.get("samplePreparation");
            String libraryPreparation = (String) requestBody.get("libraryPreparation");
            String dismountData = (String) requestBody.get("dismountData");
            String bioinformaticsAnalysis = (String) requestBody.get("bioinformaticsAnalysis");
            String remarks = (String) requestBody.get("remarks");

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            processTaskService.createProcessTask(user,projectName,dataType,principal,emails,sampleMsg,
                    samplePreparation,libraryPreparation,dismountData,bioinformaticsAnalysis,remarks);

            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

}
